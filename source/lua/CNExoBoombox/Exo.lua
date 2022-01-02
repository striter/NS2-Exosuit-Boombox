
local ost = {
  PrecacheAsset("sound/CNBoomBox.fev/SND/EXO"),
  PrecacheAsset("sound/CNBoomBox.fev/SND/2077"),
  PrecacheAsset("sound/CNBoomBox.fev/SND/COD"),
  PrecacheAsset("sound/CNBoomBox.fev/SND/HL2"),
  PrecacheAsset("sound/CNBoomBox.fev/SND/HLA"),
  PrecacheAsset("sound/CNBoomBox.fev/SND/HALO"),
  PrecacheAsset("sound/CNBoomBox.fev/SND/GTAIV"),
  PrecacheAsset("sound/CNBoomBox.fev/SND/AWDR"),
}

local SONG =
{
    PrecacheAsset("sound/CNBoomBox.fev/SND/LowRider"),
    PrecacheAsset("sound/CNBoomBox.fev/SND/HowYouLikeMeNow"),
    PrecacheAsset("sound/CNBoomBox.fev/SND/AfterTheDisco"),
    PrecacheAsset("sound/CNBoomBox.fev/SND/TheSetup"),
    PrecacheAsset("sound/CNBoomBox.fev/SND/PolishGirl"),
    PrecacheAsset("sound/CNBoomBox.fev/SND/CaughtInADaze"),
    PrecacheAsset("sound/CNBoomBox.fev/SND/Valkyrie"),
}

local networkVars =
{
    exoMusicId = "private entityid",
    --exoMusicVolume = "private float (0 to 1.2 by 0.01)"
}

Shared.LinkClassToMap("Exo", Exo.kMapName, networkVars, true)

function Exo:SetMusic(musicId)
    if musicId ~= nil then
        local musicEntity = Shared.GetEntity(musicId)
        if musicEntity then
            self.exoMusicId = musicEntity:GetId()
            self:SetRelevancyDistance(Math.infinity)
            musicEntity:SetParent(self)
        end
    end
end

if Server then

     function Exo:SelectTrack(track)
        if not self.selectedTrackIndex then
            self.selectedTrackIndex = 0
        end

        if track == nil  or (self.selectedTrack and self.selectedTrack ~= track) then
            self.selectedTrackIndex = 0
        end
        self.selectedTrack = track

        if self.selectedTrack then
          self.selectedTrackIndex = self.selectedTrackIndex + 1
          if  self.selectedTrackIndex > #track then
              self.selectedTrackIndex = 1
          end
        end
      end

    local originalHandleButtons = Exo.HandleButtons
    function Exo:HandleButtons(input)
        originalHandleButtons(self, input)

        if not self.pressingMusicButtons and bit.band(input.commands, Move.Weapon1 + Move.Weapon2 + Move.Weapon3 + Move.Weapon4 + Move.Weapon5) ~= 0 then
            self.pressingMusicButtons = true

            //Clear previous sound
            if self.exoMusicId then
                local musicEntity = Shared.GetEntity(self.exoMusicId)
                if musicEntity and musicEntity.GetIsPlaying and musicEntity:GetIsPlaying() then
                    musicEntity:Stop()
                    self.exoMusicId = nil
                    self:SetRelevancyDistance(kMaxRelevancyDistance)
                end
                self.exoMusicId = nil
            end

            //Do track selection
            if bit.band(input.commands,Move.Weapon1) ~= 0 then
                self:SelectTrack(ost)
            end

            if bit.band(input.commands,Move.Weapon2) ~= 0 then
                self:SelectTrack(SONG)
            end

            if bit.band(input.commands,Move.Weapon3) ~= 0 then
                self:SelectTrack(nil)
            end

            if bit.band(input.commands,Move.Weapon4) ~= 0 then
                self:SelectTrack(nil)
            end

            if self.selectedTrack then

              local exoMusicPlaying = Server.CreateEntity(SoundEffect.kMapName)
              exoMusicPlaying:SetAsset(self.selectedTrack[self.selectedTrackIndex])
              --exoMusicPlaying:SetOrigin(self:GetOrigin())
              self.exoMusicVolume = 0.2
              exoMusicPlaying:SetVolume(self.exoMusicVolume)
              --self.exoMusicPlaying.assetLength = -1
              exoMusicPlaying:SetRelevancyDistance(Math.infinity)
              self:SetRelevancyDistance(Math.infinity)
              exoMusicPlaying:SetParent(self)
              exoMusicPlaying:Start()

              self.exoMusicId = exoMusicPlaying:GetId()
            end
            --[[
            if (bit.band(input.commands, Move.Weapon4 + Move.Weapon5) ~= 0) and self.exoMusicId then

                local musicEntity = Shared.GetEntity(self.exoMusicId)
                if musicEntity and musicEntity.GetIsPlaying and musicEntity:GetIsPlaying() and self.exoMusicVolume then
                    if self.exoMusicVolume < 1.0 and (bit.band(input.commands, Move.Weapon5) ~= 0) then
                        self.exoMusicVolume = self.exoMusicVolume + 0.1
                    elseif self.exoMusicVolume > 0.2 and (bit.band(input.commands, Move.Weapon4) ~= 0) then
                        self.exoMusicVolume = self.exoMusicVolume - 0.1
                    end
                    musicEntity:SetVolume(self.exoMusicVolume)
                end
            end
            ]]--
        else
            self.pressingMusicButtons = false
        end
    end

    -- can't simply extend due to local var, gotta replace
    function Exo:PerformEject()
      if self:GetIsAlive() then

          -- pickupable version
          local exosuit = CreateEntity(Exosuit.kMapName, self:GetOrigin(), self:GetTeamNumber())
          exosuit:SetLayout(self.layout)
          exosuit:SetCoords(self:GetCoords())
          exosuit:SetMaxArmor(self:GetMaxArmor())
          exosuit:SetArmor(self:GetArmor())
          exosuit:SetExoVariant(self:GetExoVariant())
          exosuit:SetFlashlightOn(self:GetFlashlightOn())
          exosuit:TransferParasite(self)
          exosuit:SetMusic(self.exoMusicId)
          self.exoMusicId = nil

          local reuseWeapons = self.storedWeaponsIds ~= nil

          local marine = self:Replace(self.prevPlayerMapName or Marine.kMapName, self:GetTeamNumber(), false, self:GetOrigin() + Vector(0, 0.2, 0), { preventWeapons = reuseWeapons })
          marine:SetHealth(self.prevPlayerHealth or kMarineHealth)
          marine:SetMaxArmor(self.prevPlayerMaxArmor or kMarineArmor)
          marine:SetArmor(self.prevPlayerArmor or kMarineArmor)

          exosuit:SetOwner(marine)

          marine.onGround = false
          local initialVelocity = self:GetViewCoords().zAxis
          initialVelocity:Scale(4)
          initialVelocity.y = math.max(0,initialVelocity.y) + 9
          marine:SetVelocity(initialVelocity)

          if reuseWeapons then

              for _, weaponId in ipairs(self.storedWeaponsIds) do

                  local weapon = Shared.GetEntity(weaponId)
                  if weapon then
                      marine:AddWeapon(weapon)
                  end

              end

          end

          marine:SetHUDSlotActive(1)

          if marine:isa("JetpackMarine") then
              marine:SetFuel(0.25)
          end

      end

      return false

    end
end


local oldOnDestroy = Exo.OnDestroy
function Exo:OnDestroy()
    oldOnDestroy( self )

    self.selectedTrack=nil
    self.selectedTrackIndex = 0

    if self.exoMusicId then
        local musicEntity = Shared.GetEntity(self.exoMusicId)
        if musicEntity and musicEntity.GetIsPlaying and musicEntity:GetIsPlaying() and musicEntity.Stop then
            musicEntity:Stop()
        end
        self.exoMusicId = nil
    end
end
