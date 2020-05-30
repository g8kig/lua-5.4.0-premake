-- premake5.lua
workspace "Lua54"
   configurations { "Debug", "Release" }

project "Lua54"
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"

   files { "src/**.h", 
	   "src/lapi.c",     "src/lcode.c",   "src/lctype.c",  "src/ldebug.c", 
	   "src/ldo.c",      "src/ldump.c",   "src/lfunc.c",   "src/lgc.c", 
	   "src/llex.c",     "src/lmem.c",    "src/lobject.c", "src/lopcodes.c", 
      "src/lparser.c",  "src/lstate.c",  "src/lstring.c", "src/ltable.c",  
      "src/ltm.c",      "src/lundump.c", "src/lvm.c",     "src/lzio.c" }

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	   defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }
      linkoptions "/DEF:Lua54.def"

   filter "configurations:Debug"
      defines { "DEBUG" }
      symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
      optimize "On"

project "Lua54Lib"
   kind "SharedLib"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua54" }
   libdirs { "bin/%{cfg.buildcfg}" }

   files { "src/**.h", "src/lauxlib.c",  "src/lbaselib.c", "src/lcorolib.c", 
                       "src/ldblib.c",   "src/linit.c",    "src/liolib.c", 
                       "src/lmathlib.c", "src/loadlib.c",  "src/lstrlib.c", 
                       "src/ltablib.c",  "src/lutf8lib.c", "src/loslib.c"  }

   filter { "action:vs*", "configurations:Release" }
	   buildoptions "/GL"
 	   linkoptions "/LTCG" 

   filter "action:vs*"
  	   defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }
      linkoptions "/DEF:Lua54Lib.def"

   filter "configurations:Debug"
     	defines { "DEBUG" }
     	symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
     	optimize "On"

project "Lua"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua54", "Lua54lib" }
   libdirs { "bin/%{cfg.buildcfg}" }

   files { "src/**.h", "src/lua.c" }

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }

   filter "configurations:Debug"
     	defines { "DEBUG" }
     	symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
     	optimize "On"

project "Luac"
   kind "ConsoleApp"
   language "C"
   targetdir "bin/%{cfg.buildcfg}"
   links { "Lua54", "Lua54lib" }
   libdirs { "bin/%{cfg.buildcfg}" }

   files { "src/**.h", 
	   "src/luac.c", "src/lundump.c", "src/ldo.c", "src/lgc.c", "src/lmem.c", "src/lstate.c", "src/lfunc.c", "src/ldebug.c", 
	   "src/ltable.c", "src/ldo.c", "src/lobject.c", "src/lopcodes.c", "src/lctype.c", "src/lstring.c", "src/ltm.c", 
	   "src/ldump.c", "src/lvm.c", "src/llex.c", "src/lparser.c", "src/lzio.c", "src/lcode.c" }

   filter { "action:vs*", "configurations:Release" }
	buildoptions "/GL"
 	linkoptions "/LTCG" 

   filter "action:vs*"
  	defines { "_CRT_SECURE_NO_WARNINGS", "LUA_BUILD_AS_DLL" }

   filter "configurations:Debug"
     	defines { "DEBUG" }
     	symbols "On"

   filter "configurations:Release"
   	defines { "NDEBUG" }
     	optimize "On"
