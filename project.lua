--! NUMAKE PROJECT
PLUGIN_SDK_DIR = workspace:download_zip("https://github.com/juicermv/plugin-sdk/releases/latest/download/mingw.zip")

project = workspace:create_mingw_target("AutoHealSA")
project.arch = "i686"
project.output = "AutoHealSA.asi"

project.library_paths = {
    PLUGIN_SDK_DIR .. "/lib/plugin_sa/",
    "AutoHealSA"
}

project.include_paths = {
    PLUGIN_SDK_DIR,
    PLUGIN_SDK_DIR .. "/plugin_sa/",
    PLUGIN_SDK_DIR .. "/plugin_sa/game_sa/",
    PLUGIN_SDK_DIR .. "/shared/",
    PLUGIN_SDK_DIR .. "/shared/game"
}

project.definitions = {
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
    "PLUGIN_SGV_10US"
}

project.libraries = {
    "plugin",
}

project.compiler_flags = {
    "-std=c++17",
    "-Ofast",
    "-fpermissive",
    "-shared",
    "-flto"
}

project.linker_flags = {
    "--dll",
    "--subsystem,windows"
}

project.assets = {
    ["README.md"] = "README.md",
}

project.files = workspace:walk_dir("AutoHealSA", false, {"cpp"})

workspace:register_target(project)
