
local OST = {
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/EXO"), name = "Exosuit" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/DL2"), name = "Empowering Yourself" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/2077"), name = "The Rebel Path" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/GTAV"), name = "No Happy Endings" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/VortalCombat"), name = "Vortal Combat" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/HL2"), name = "Triage At Dawn" },
  { asset =  PrecacheAsset("sound/CNBoomBox.fev/OST/HLA"), name = "Gravity Perforation Detail" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/HALO"), name = "The Road" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/GTAIV"), name = "Soviet Connection" },
  { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/CV"), name = "Heart of fire" },
}

local SONG =
{
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/LowRider"), name = "Low Rider" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/HowYouLikeMeNow"), name = "How you like me now" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/GreenRiver"), name = "Green River" },
    { asset =  PrecacheAsset("sound/CNBoomBox.fev/SONG/SadRobot"), name = "Sad Robot" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/AfterTheDisco"), name = "After the Disco" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/TheSetup"), name = "The Setup" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/PolishGirl"), name = "Polish Girl" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/HoldOnToMe"), name = "Hold On To Me" },
    { asset =  PrecacheAsset("sound/CNBoomBox.fev/SONG/CaughtInADaze"), name = "Caught In A Daze" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Valkyrie"), name = "Valkrie" },
}

local TwoDimension =
{
    { asset =  PrecacheAsset("sound/CNBoomBox.fev/TWO/DaMeDaNe"), name = "Baka Mitai" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/BloodyStream"), name = "Bloody Stream" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/DevilmanOld"), name = "悪魔復活" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/RageOfDust"), name = "Rage Of Dust" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/LoveLoop"), name = "恋爱循环" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/Monster"), name = "怪物" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/BlinBlin"), name = "ピカピカなのん" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/OneMoreNight"), name = "One More Night" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/FreesiaLive"), name = "フリージア" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/Night"), name = "夜に駆ける" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/Devilman"), name = "Devilman No Uta" },
}

local Otto =
{
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/Kirby"), name = "吉吉先进国" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/Nobody"), name = "全球百大DJ2021" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/Tremor"), name = "全球百大DJ2022" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/TimeBreaker"), name = "时间撕裂者" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/Lynx"), name = "全球百大DJ2020" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/Byte"), name = "全球百大DJ2023" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/Reflection"), name = "Sakura Reflection" },
    { asset = PrecacheAsset("sound/CNBoomBox.fev/OTTO/War"), name = "国玉的战争" },
}

gExosuitBoomboxTracks =
{
    [0] = nil,
    [1] = OST,
    [2] = SONG,
    [3] = TwoDimension,
    [4] = Otto,
}

local networkVars =
{
    exoMusicId = "private entityid",
    selectedTrack  = "integer",
    selectedTrackIndex = "integer",
    --exoMusicVolume = "private float (0 to 1.2 by 0.01)"
}

Shared.LinkClassToMap("Exo", Exo.kMapName, networkVars, true)

local baseOninitialized = Exo.OnInitialized
function Exo:OnInitialized()
    baseOninitialized(self)
    self.selectedTrack = 0
    self.selectedTrackIndex = 0
end

function Exo:SetMusic(_musicId,_selectedTrack,_selectedTrackIndex)
    self.selectedTrack = _selectedTrack
    self.selectedTrackIndex = _selectedTrackIndex
    if _musicId ~= nil then
        local musicEntity = Shared.GetEntity(_musicId)
        if musicEntity then
            self.exoMusicId = musicEntity:GetId()
            self:SetRelevancyDistance(Math.infinity)
            musicEntity:SetParent(self)
        end
    end
end

if Server then


    function Exo:SelectTrack(track)

        if track == 0  or  self.selectedTrack ~= track then
            self.selectedTrackIndex = 0
        end
        self.selectedTrack = track

        if self.selectedTrack ~= 0 then
            self.selectedTrackIndex = self.selectedTrackIndex + 1
            local selectedTrack = gExosuitBoomboxTracks[self.selectedTrack]
            if  self.selectedTrackIndex > #selectedTrack then
                self.selectedTrackIndex = 1
            end
        end
    end

    local oldOnDestroy = Exo.OnDestroy
    function Exo:OnDestroy()
        oldOnDestroy( self )
    
        self.selectedTrack = 0
        self.selectedTrackIndex = 0
    
        if self.exoMusicId ~= nil then
            local musicEntity = Shared.GetEntity(self.exoMusicId)
            if musicEntity and musicEntity.GetIsPlaying and musicEntity:GetIsPlaying() and musicEntity.Stop then
                musicEntity:Stop()
            end
            self.exoMusicId = nil
        end
    end

    local originalHandleButtons = Exo.HandleButtons
    function Exo:HandleButtons(input)
        originalHandleButtons(self, input)

        if not self.pressingMusicButtons and bit.band(input.commands, Move.Weapon1 + Move.Weapon2 + Move.Weapon3 + Move.Weapon4 + Move.Weapon5) ~= 0 then
            self.pressingMusicButtons = true

            //Clear previous sound
            if self.exoMusicId ~= nil then
                local musicEntity = Shared.GetEntity(self.exoMusicId)
                if musicEntity and musicEntity.GetIsPlaying and musicEntity:GetIsPlaying() then
                    musicEntity:Stop()
                end
                self.exoMusicId = nil
            end

            //Do track selection
            if bit.band(input.commands,Move.Weapon1) ~= 0 then
                self:SelectTrack(1)
            end

            if bit.band(input.commands,Move.Weapon2) ~= 0 then
                self:SelectTrack(2)
            end

            if bit.band(input.commands,Move.Weapon3) ~= 0 then
                self:SelectTrack(3)
            end

            if bit.band(input.commands,Move.Weapon4) ~= 0 then
                self:SelectTrack(4)
            end

            if bit.band(input.commands,Move.Weapon5) ~= 0 then
                self:SelectTrack(0)
            end

            if self.selectedTrack ~= 0 then
              local exoMusicPlaying = Server.CreateEntity(SoundEffect.kMapName)
              exoMusicPlaying:SetAsset(gExosuitBoomboxTracks[self.selectedTrack][self.selectedTrackIndex].asset)
              --exoMusicPlaying:SetOrigin(self:GetOrigin())
              self.exoMusicVolume = 1
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
          exosuit:SetMusic(self.exoMusicId,self.selectedTrack,self.selectedTrackIndex)
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


