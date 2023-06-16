ModLoader.SetupFileHook( "lua/Exo.lua", "lua/CNExoBoombox/Exo.lua", "post" )
ModLoader.SetupFileHook( "lua/GUIExoEject.lua", "lua/CNExoBoombox/GUIExoEject.lua", "post" )
ModLoader.SetupFileHook( "lua/Exosuit.lua", "lua/CNExoBoombox/Exosuit.lua", "post" )
ModLoader.SetupFileHook( "lua/Onos.lua", "lua/CNExoBoombox/Onos.lua", "post" )

if AddHintModPanel then
    local panelMaterial = PrecacheAsset("materials/CNExosuitBoombox/Banner.material")
    AddHintModPanel(panelMaterial,"https://docs.qq.com/doc/DUGJIQkRuQVB0REpO", "人生就是一场旅行")
end