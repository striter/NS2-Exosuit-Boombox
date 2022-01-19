ModLoader.SetupFileHook( "lua/Exo.lua", "lua/CNExoBoombox/Exo.lua", "post" )
ModLoader.SetupFileHook( "lua/GUIExoEject.lua", "lua/CNExoBoombox/GUIExoEject.lua", "post" )
ModLoader.SetupFileHook( "lua/Exosuit.lua", "lua/CNExoBoombox/Exosuit.lua", "post" )

if AddHintModPanel then
    local panelMaterial = PrecacheAsset("materials/CNExosuitBoombox/Banner.material")
    AddHintModPanel(panelMaterial, nil , nil)
end