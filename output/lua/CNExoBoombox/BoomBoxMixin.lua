
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
}

local kTrackAssets = {
    [BoomBoxMixin.gTrackEnum.Custom]  =  {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/cjdl"), name = "不眠之夜" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/ygkldnh"), name = "阳光开朗大男孩" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/Girl"), name = "恋爱困难女孩" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/LOTUS"), name = "美丽的神话" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/Youngthink"), name = "ヰ世界の宝石譚" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/SonOfTheGround"), name = "大地之子-沙林mix" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/ClearMorning"), name = "Clear Morning" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/InHellWeLive"), name = "In Hell We Live, Lament" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/SpinTheSnow"), name = "回レ! 雪月花" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/Summoning101"), name = "Summoning 101" },
    },
    [BoomBoxMixin.gTrackEnum.OST]  = {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/2077"), name = "The Rebel Path" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/PTSD"), name = "PTSD" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/RisingTide"), name = "Rising Tide" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/Castlevania"), name = "狂月の招き" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/MMFight"), name = "激闘" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/HLA"), name = "Gravity Perforation Detail" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/GTAV"), name = "No Happy Endings" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/VortalCombat"), name = "Vortal Combat" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/OST/EXO"), name = "Exosuit" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/CUSTOM/DD2"), name = "The Decisive Combat" },
        
    },
    [BoomBoxMixin.gTrackEnum.TwoDimension] = {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/Flamingo"), name = "Flamingo" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/StepIt"), name = "Step It" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/Hear"), name = "聴きたかったダンスミュージック、リキッドルームに" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/DaMeDaNe"), name = "Baka Mitai" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/BloodyStream"), name = "Bloody Stream" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/DevilmanOld"), name = "Devilman" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/RageOfDust"), name = "Rage Of Dust" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/LoveLoop"), name = "恋爱循环" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/Monster"), name = "怪物" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/BlinBlin"), name = "ピカピカなのん" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/TWO/FreesiaLive"), name = "フリージア" },
    },
    [BoomBoxMixin.gTrackEnum.SONG] = {
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Slumlord"), name = "Slumlord" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/BetterCallSaul"), name = "Better Call Saul" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/BadHabit"), name = "Bad Habit" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/FreeBird"), name = "Free Bird" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Sabotage"), name = "Sabotage" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/HowYouLikeMeNow"), name = "How you like me now" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/TheFeelings"), name = "The Feelings" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/WestCoast"), name = "West Coast" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/GreenRiver"), name = "Green River" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/AfterTheDisco"), name = "After the Disco" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/TheSetup"), name = "The Setup" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/PolishGirl"), name = "Polish Girl" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/Valkyrie"), name = "Valkyrie" },
        { asset = PrecacheAsset("sound/CNBoomBox.fev/SONG/VirtualInsanity"), name = "Virtual Insanity" },
    },
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
    self.selectedTrackIndex = 0
    self.volume = BoomBoxMixin.kStartVolume
    self.musicId = Entity.invalidId
end

function BoomBoxMixin:GetBoomBoxTitle()
    if self.musicId == Entity.invalidId then
        return Locale.ResolveString("BOOMBOX_TITLE")
    end

    return string.format("<%s>(V%i", kTrackAssets[self.selectedTrack][self.selectedTrackIndex].name,math.floor(GetVolume(self)*100)) .. "%)"
end


if Server then
    local function Play(self)
        if self.volume == 1 
            or self.selectedTrackIndex <= 0
        then return end

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
    
    
    --For exosuit's messy states
    function BoomBoxMixin:SaveMusic()
        local id = self.musicId
        self.musicId = Entity.invalidId
        if id ~= Entity.invalidId then
            local musicEntity = Shared.GetEntity(id)
            musicEntity:SetParent(nil)
        end
        
        return id
    end

    function BoomBoxMixin:ReleaseMusic(_id, _target)
        self.musicId = _id
        if _target then
            _target:TransferMusic(self)
            return
        end
        self:DestroyMusic()
    end

end