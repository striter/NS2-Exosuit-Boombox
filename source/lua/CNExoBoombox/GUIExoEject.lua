--======= Copyright (c) 2011, Unknown Worlds Entertainment, Inc. All rights reserved. =======
--
-- lua\GUIExoEject.lua
--
--    Created by:   Andreas Urwalek (andi@unknownworlds.com)
--
-- ========= For more information, visit us at http://www.unknownworlds.com =====================

local kButtonPos
local kTextOffset

local kFontName = Fonts.kAgencyFB_Small

class 'GUIExoEject' (GUIScript)

local function UpdateItemsGUIScale(self)
    kButtonPos = GUIScale(Vector(180, -120, 0))
    kTextOffset = GUIScale(Vector(0, 20, 0))
end

function GUIExoEject:OnResolutionChanged(oldX, oldY, newX, newY)
    UpdateItemsGUIScale(self)

    self:Uninitialize()
    self:Initialize()
end

function GUIExoEject:Initialize()

    UpdateItemsGUIScale(self)

    self.button = GUICreateButtonIcon("Drop")
    self.button:SetAnchor(GUIItem.Left, GUIItem.Bottom)
    self.button:SetPosition(kButtonPos)

    self.text = GetGUIManager():CreateTextItem()
    self.text:SetAnchor(GUIItem.Middle, GUIItem.Bottom)
    self.text:SetTextAlignmentX(GUIItem.Align_Center)
    self.text:SetTextAlignmentY(GUIItem.Align_Center)
    self.text:SetText(Locale.ResolveString("EJECT_FROM_EXO"))
    self.text:SetPosition(kTextOffset)
    self.text:SetScale(GetScaledVector())
    self.text:SetFontName(kFontName)
    GUIMakeFontScale(self.text)
    self.text:SetColor(kMarineFontColor)

    self.button:AddChild(self.text)
    self.button:SetIsVisible(false)

    self.button1 = GUICreateButtonIcon("Weapon1")
    self.button1:SetAnchor(GUIItem.Left, GUIItem.Bottom)
    self.button1:SetPosition(Vector(300, -120, 0))

    self.text1 = GetGUIManager():CreateTextItem()
    self.text1:SetAnchor(GUIItem.Middle, GUIItem.Bottom)
    self.text1:SetTextAlignmentX(GUIItem.Align_Center)
    self.text1:SetTextAlignmentY(GUIItem.Align_Center)
    self.text1:SetText("OST")
    self.text1:SetPosition(kTextOffset)
    self.text1:SetScale(GetScaledVector())
    self.text1:SetFontName(kFontName)
    GUIMakeFontScale(self.text1)
    self.text1:SetColor(kMarineFontColor)

    self.button1:AddChild(self.text1)
    self.button1:SetIsVisible(true)


    self.button2 = GUICreateButtonIcon("Weapon2")
    self.button2:SetAnchor(GUIItem.Left, GUIItem.Bottom)
    self.button2:SetPosition(Vector(360, -120, 0))

    self.text2 = GetGUIManager():CreateTextItem()
    self.text2:SetAnchor(GUIItem.Middle, GUIItem.Bottom)
    self.text2:SetTextAlignmentX(GUIItem.Align_Center)
    self.text2:SetTextAlignmentY(GUIItem.Align_Center)
    self.text2:SetText("Song")
    self.text2:SetPosition(kTextOffset)
    self.text2:SetScale(GetScaledVector())
    self.text2:SetFontName(kFontName)
    GUIMakeFontScale(self.text2)
    self.text2:SetColor(kMarineFontColor)

    self.button2:AddChild(self.text2)
    self.button2:SetIsVisible(true)


    -- self.button3 = GUICreateButtonIcon("Weapon3")
    -- self.button3:SetAnchor(GUIItem.Left, GUIItem.Bottom)
    -- self.button3:SetPosition(Vector(420, -120, 0))
    --
    -- self.text3 = GetGUIManager():CreateTextItem()
    -- self.text3:SetAnchor(GUIItem.Middle, GUIItem.Bottom)
    -- self.text3:SetTextAlignmentX(GUIItem.Align_Center)
    -- self.text3:SetTextAlignmentY(GUIItem.Align_Center)
    -- self.text3:SetText("?")
    -- self.text3:SetPosition(kTextOffset)
    -- self.text3:SetScale(GetScaledVector())
    -- self.text3:SetFontName(kFontName)
    -- GUIMakeFontScale(self.text3)
    -- self.text3:SetColor(kMarineFontColor)
    --
    -- self.button3:AddChild(self.text3)
    -- self.button3:SetIsVisible(true)

    self.button4 = GUICreateButtonIcon("Weapon4")
    self.button4:SetAnchor(GUIItem.Left, GUIItem.Bottom)
    self.button4:SetPosition(Vector(480, -120, 0))

    self.text4 = GetGUIManager():CreateTextItem()
    self.text4:SetAnchor(GUIItem.Middle, GUIItem.Bottom)
    self.text4:SetTextAlignmentX(GUIItem.Align_Center)
    self.text4:SetTextAlignmentY(GUIItem.Align_Center)
    self.text4:SetText("Stop")
    self.text4:SetPosition(kTextOffset)
    self.text4:SetScale(GetScaledVector())
    self.text4:SetFontName(kFontName)
    GUIMakeFontScale(self.text4)
    self.text4:SetColor(kMarineFontColor)

    self.button4:AddChild(self.text4)
    self.button4:SetIsVisible(true)
end


function GUIExoEject:Uninitialize()

    if self.button then
        GUI.DestroyItem(self.button)
    end

    if self.button1 then
        GUI.DestroyItem(self.button1)
    end
    if self.button2 then
        GUI.DestroyItem(self.button2)
    end
    -- if self.button3 then
    --     GUI.DestroyItem(self.button3)
    -- end
    if self.button4 then
        GUI.DestroyItem(self.button4)
    end
end

function GUIExoEject:Update(deltaTime)

    PROFILE("GUIExoEject:Update")

    local player = Client.GetLocalPlayer()
    local showEject = player ~= nil and Client.GetIsControllingPlayer() and player:GetCanEject() and not MainMenu_GetIsOpened()

    self.button:SetIsVisible(showEject)

    -- if self.button1 then
    --     self.button1:SetIsVisible(showEject)
    -- end
    -- if self.button2 then
    --     self.button2:SetIsVisible(showEject)
    -- end
    -- if self.button3 then
    --     self.button3:SetIsVisible(showEject)
    -- end
    -- if self.button4 then
    --     self.button4:SetIsVisible(showEject)
    -- end
end
