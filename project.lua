--! NUMAKE PROJECT

PLUGIN_SDK_DIR = workspace:download_zip("https://github.com/juicermv/plugin-sdk/releases/latest/download/release.zip")

project = workspace:create_msvc_target("AutoHealSA")
project.msvc_arch = "x86"
project.output = "AutoHealSA.asi"

project.library_paths = {
    PLUGIN_SDK_DIR .. ".numake/out/plugin_sa",
    "AutoHealSA"
}

project.include_paths = {
    PLUGIN_SDK_DIR,
    PLUGIN_SDK_DIR .. "\\plugin_sa\\",
    PLUGIN_SDK_DIR .. "\\plugin_sa\\game_sa\\",
    PLUGIN_SDK_DIR .. "\\shared\\",
    PLUGIN_SDK_DIR .. "\\shared\\game"
}

project.definitions = {
    "_NDEBUG",
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
    "PLUGIN_SGV_10US"
}

project.libraries = {
    "plugin.lib",
}

project.compiler_flags = {
    "/Ot",
    "/Ob1",
    "/std:c++17",
    "/GT",
    "/fp:fast",
    "/W3",
    "/Gy",
    "/MT",
    "/Oi"
}

project.linker_flags = {
    "/SUBSYSTEM:WINDOWS",
    "/OPT:ICF",
    "/OPT:REF",
    "/LTCG",
    "/DLL"
}

project.assets = {
    ["README.md"] = "README.md",
}

project:add_dir("AutoHealSA", false, {"cpp"})

workspace:register_target(project)
