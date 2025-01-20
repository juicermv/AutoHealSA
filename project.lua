--! NUMAKE PROJECT
PLUGIN_SDK_DIR = network:zip("https://github.com/juicermv/plugin-sdk/releases/latest/download/mingw.zip")

project = Project(
    "AutoHealSA",
    "C++",
    "AutoHealSA.asi",
    filesystem:walk("AutoHealSA", false, {"cpp"}),
    {
        ["README.md"] = "README.md",
    },
    {
        PLUGIN_SDK_DIR .. "/src/",
        PLUGIN_SDK_DIR .. "/src/plugin_sa/",
        PLUGIN_SDK_DIR .. "/src/plugin_sa/game_sa/",
        PLUGIN_SDK_DIR .. "/src/plugin_sa/game_sa/rw/",
        PLUGIN_SDK_DIR .. "/src/shared/",
        PLUGIN_SDK_DIR .. "/src/shared/game"
    },
    {
        PLUGIN_SDK_DIR .. "/lib/plugin_sa/",
        "AutoHealSA"
    },
    {
        "plugin",
    },
    {
        --"_NDEBUG",
        "_USE_MATH_DEFINES",
        "_CRT_SECURE_NO_WARNINGS",
        "_CRT_NON_CONFORMING_SWPRINTFS",
        "GTASA", 
        "GTAGAME_NAME=\"San Andreas\"", 
        "GTAGAME_ABBR=\"SA\"", 
        "GTAGAME_ABBRLOW=\"sa\"", 
        "GTAGAME_PROTAGONISTNAME=\"CJ\"", 
        "GTAGAME_CITYNAME=\"San Andreas\"", 
        "_LA_SUPPORT", 
        "_DX9_SDK_INSTALLED", 
        "PLUGIN_SGV_10US",
        "RW"
    },
    {
        "-std=gnu++23",
        "-Ofast",
        "-fpermissive",
        "-shared",
        "-flto"
    },
    {
        "--dll",
        "--subsystem,windows"
    },
    nil,
    nil,
    "i686",
    "DynamicLibrary"
)

tasks:create("build_mingw", function()
    mingw:build(project)
end)
