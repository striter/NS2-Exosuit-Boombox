
local networkVars =
{
    exoMusicId = "private entityid"
}

Shared.LinkClassToMap("Exosuit", Exosuit.kMapName, networkVars)

function Exosuit:SetMusic(musicId)
    if musicId ~= nil then
        local musicEntity = Shared.GetEntity(musicId)
        if musicEntity then
            self.exoMusicId = musicEntity:GetId()
            self:SetRelevancyDistance(Math.infinity)
            musicEntity:SetParent(self)
        end
    end
end

local oldOnDestroy = Exosuit.OnDestroy
function Exosuit:OnDestroy()
    oldOnDestroy( self )
    
    if self.exoMusicId then
        local musicEntity = Shared.GetEntity(self.exoMusicId)
        if musicEntity and musicEntity.GetIsPlaying and musicEntity:GetIsPlaying() and musicEntity.Stop then
            musicEntity:Stop()
        end
        self.exoMusicId = nil
    end
end

if Server then

    
    function Exosuit:OnUseDeferred()
        
      local player = self.useRecipient 
      self.useRecipient = nil
      
      if player and not player:GetIsDestroyed() and self:GetIsValidRecipient(player) then
      
          local weapons = player:GetWeapons()
          for i = 1, #weapons do            
              weapons[i]:SetParent(nil)            
          end

          local exoPlayer = nil

          if self.layout == "MinigunMinigun" then
              exoPlayer = player:GiveDualExo()            
          elseif self.layout == "RailgunRailgun" then
              exoPlayer = player:GiveDualRailgunExo()
          elseif self.layout == "ClawRailgun" then
              exoPlayer = player:GiveClawRailgunExo()
          else
              exoPlayer = player:GiveExo()
          end  

          if exoPlayer then
                         
              for i = 1, #weapons do
                  exoPlayer:StoreWeapon(weapons[i])
              end 

              exoPlayer:SetMaxArmor(self:GetMaxArmor())  
              exoPlayer:SetArmor(self:GetArmor())
              exoPlayer:SetFlashlightOn(self:GetFlashlightOn())
              exoPlayer:TransferParasite(self)
              
              if self.exoMusicId then
                exoPlayer:SetMusic(self.exoMusicId)
                self.exoMusicId = nil
              end
              
              local newAngles = player:GetViewAngles()
              newAngles.pitch = 0
              newAngles.roll = 0
              newAngles.yaw = GetYawFromVector(self:GetCoords().zAxis)
              exoPlayer:SetOffsetAngles(newAngles)
              -- the coords of this entity are the same as the players coords when he left the exo, so reuse these coords to prevent getting stuck
              exoPlayer:SetCoords(self:GetCoords())
              
              self:TriggerEffects("pickup")
              DestroyEntity(self)
              
          end
          
      end
  
    end
end
