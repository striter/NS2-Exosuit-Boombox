
BoomBoxMixin = CreateMixin( BoomBoxMixin )
BoomBoxMixin.type = "BoomBoxAble"
BoomBoxMixin.networkVars =
{
    musicId = "private entityid",
    selectedTrack  = "enum BoomBoxMixin.gTrackEnum",
    selectedTrackIndex = "integer (0 to 16)",
    volume = "integer (0 to 16)",
}

BoomBoxMixin.gTrackEnum =enum{
    'OST',
    'SONG',
    'TwoDimension',
    'Custom',
    --     'Onos',
}

local kTrackAssets = {
    [BoomBoxMixin.gTrackEnum.OST]  = {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/EXO"), name = "Exosuit" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/FFIV1"), name = "エスケープ" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/FFIV2"), name = "天つ風" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/RisingTide"), name = "Rising Tide" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/MMRoute99"), name = "ルート 99" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/MMFight"), name = "激闘" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/HLA"), name = "Gravity Perforation Detail" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/2077"), name = "The Rebel Path" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/GTAV"), name = "No Happy Endings" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/VortalCombat"), name = "Vortal Combat" },
    },
    [BoomBoxMixin.gTrackEnum.SONG]  =   {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/LowRider"), name = "Low Rider" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/HowYouLikeMeNow"), name = "How you like me now" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/HealthFood"), name = "Health Food" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Wildin"), name = "Wild'in" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Vowels"), name = "Vowels" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Easy"), name = "Easy" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/GreenRiver"), name = "Green River" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/AfterTheDisco"), name = "After the Disco" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/TheSetup"), name = "The Setup" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/PolishGirl"), name = "Polish Girl" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/HoldOnToMe"), name = "Hold On To Me" },
        { asset =  PrecacheAsset("sound/CNBoomBox.fev/SONG/CaughtInADaze"), name = "Caught In A Daze" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Valkyrie"), name = "Valkrie" },
    },
    [BoomBoxMixin.gTrackEnum.TwoDimension]  =  {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/DaMeDaNe"), name = "Baka Mitai" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/BloodyStream"), name = "Bloody Stream" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/DevilmanOld"), name = "Devilman" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/RageOfDust"), name = "Rage Of Dust" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/LoveLoop"), name = "恋爱循环" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/Monster"), name = "怪物" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/BlinBlin"), name = "ピカピカなのん" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/OneMoreNight"), name = "One More Night" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/FreesiaLive"), name = "フリージア" },
    },
    [BoomBoxMixin.gTrackEnum.Custom]  =  {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/ClearMorning"), name = "Clear Morning" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/LetBulletFly"), name = "让子弹飞-敢杀我的马？！" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/InHellWeLive"), name = "In Hell We Live, Lament" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/SpinTheSnow"), name = "回レ! 雪月花" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/Summoning101"), name = "Summoning 101" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/KazeWoAtsumete"), name = "Kaze Wo Atsumete" },
    }
    --     [BoomBoxMixin.gTrackEnum.Onos]  =  {
    --         { asset = PrecacheAsset("sound/CNBoomBox.fev/ONOS/L4D2"), name = "Taank" },
    --         { asset = PrecacheAsset("sound/CNBoomBox.fev/ONOS/BM"), name = "Surface Tension 2" },
    --         { asset = PrecacheAsset("sound/CNBoomBox.fev/ONOS/GTAV"), name = "Minor Turbulence" },
    --         { asset = PrecacheAsset("sound/CNBoomBox.fev/ONOS/KF2"), name = "We don't care" },
    --         { asset = PrecacheAsset("sound/CNBoomBox.fev/ONOS/SS4"), name = "Boss Fight String" },
    --     }
}


BoomBoxMixin.kStartVolume = 4
BoomBoxMixin.kVolumeSwitch = {
    [1]=0,
    [2]=0.4,
    [3]=0.6,
    [4]=0.8,
    [5]=1
}

local function GetVolume(self)
    return BoomBoxMixin.kVolumeSwitch[self.volume] or 1
end

function BoomBoxMixin:__initmixin()
    -- Shared.Message("Boombox Init")
    self.selectedTrack = BoomBoxMixin.gTrackEnum.OST
    self.selectedTrackIndex = 1
    self.volume = BoomBoxMixin.kStartVolume
    self.musicId = Entity.invalidId
end

function BoomBoxMixin:GetBoomBoxTitle()
    --     return Locale.ResolveString("BOOMBOX_TITLE")

    return string.format("<%s>(V%i", kTrackAssets[self.selectedTrack][self.selectedTrackIndex].name,math.floor(GetVolume(self)*100)) .. "%)"
end


if Server then
    local function Play(self)
        if self.volume == 1 then return end

        local tracks = kTrackAssets[self.selectedTrack]
        local music = StartSoundEffectOnEntity(tracks[self.selectedTrackIndex].asset,self, GetVolume(self))
        self.musicId = music:GetId()
        self:SetRelevancyDistance(Math.infinity)
    end

    function BoomBoxMixin:SwitchTrack(_trackIndex)
        self:DestroyMusic()

        self.volume = BoomBoxMixin.kStartVolume
        if self.selectedTrack ~= _trackIndex then
            self.selectedTrackIndex = 0
        end

        self.selectedTrack = _trackIndex
        self.selectedTrackIndex = self.selectedTrackIndex + 1
        if  self.selectedTrackIndex > #kTrackAssets[self.selectedTrack] then
            self.selectedTrackIndex = 1
        end

        self.selectedTrack = _trackIndex
        Play(self)
    end

    function BoomBoxMixin:SwitchVolume()
        self.volume = self.volume+1
        if self.volume > #BoomBoxMixin.kVolumeSwitch then
            self.volume = 1
        end

        self:DestroyMusic()
        Play(self)
    end

    function BoomBoxMixin:TransferMusic(_from)
        self.selectedTrack = _from.selectedTrack
        self.selectedTrackIndex = _from.selectedTrackIndex
        self.volume = _from.volume
        if _from.musicId ~= Entity.invalidId then
            local musicEntity = Shared.GetEntity(_from.musicId)
            if musicEntity and musicEntity.GetIsPlaying then
                self.musicId = musicEntity:GetId()
                self:SetRelevancyDistance(Math.infinity)
                musicEntity:SetParent(self)
            end

            _from.musicId = Entity.invalidId
        end
    end

    function BoomBoxMixin:DestroyMusic()
        if self.musicId ~= Entity.invalidId then
            local musicEntity = Shared.GetEntity(self.musicId)
            if musicEntity and musicEntity.GetIsPlaying and musicEntity:GetIsPlaying() and musicEntity.Stop then
                musicEntity:Stop()
            end
            self.musicId = Entity.invalidId
        end
    end

    function BoomBoxMixin:OnDestroy()
        self:DestroyMusic()
    end
end