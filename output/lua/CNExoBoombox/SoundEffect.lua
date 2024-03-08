if Client then
    local baseOnInitialized = SoundEffect.OnInitialized
    function SoundEffect:OnInitialized()
        baseOnInitialized(self)
        
        local assetName = Shared.GetSoundName(self.assetIndex)
        self.boomboxSound = string.find(assetName, "CNBoomBox.fev") ~= nil
    end

    local function CustomSoundVolume(self)
        if not self.boomboxSound then return end
        if self.playing and self.soundEffectInstance then
            local volume = OptionsDialogUI_GetSoundVolume() / 100
            volume = volume * OptionsDialogUI_GetMusicVolume() / 100
            self.soundEffectInstance:SetVolume(volume)
        end
    end

    local baseOnUpdate = SoundEffect.OnUpdate
    function SoundEffect:OnUpdate(deltaTime)
        baseOnUpdate(self)
        CustomSoundVolume(self)
    end

    local baseOnProcessMove = SoundEffect.OnProcessMove
    function SoundEffect:OnProcessMove()
        baseOnProcessMove(self)
        CustomSoundVolume(self)
    end

    local baseOnProcessSpectate = SoundEffect.OnProcessSpectate
    function SoundEffect:OnProcessSpectate()
        baseOnProcessSpectate(self)
        CustomSoundVolume(self)
    end
end
