#include <iostream>
#include <string>
#include <lua.hpp>

int function_in_lua(lua_State *L)
{
	float a = (float)lua_tonumber(L, 1);
	float b = (float)lua_tonumber(L, 2);
	float c = (float)lua_tonumber(L, 3);
	std::cout << "[CXX] function: mult3(" << a << "," << b << "," << c << ")"<< std::endl;
	float r = a * (b * c);
	lua_pushnumber(L, r);
	return 1;
}

auto main() -> int
{
	std::cout << "[CXX] Starting Lua..." << std::endl;
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);

	lua_register(L, "mult3", function_in_lua);

	int r = luaL_dofile(L, "src/test.lua");

	if (r == LUA_OK)
	{
		lua_getglobal(L, "a");
		if (lua_isnumber(L, -1))
		{
			float a_in_cpp = (float)lua_tonumber(L, -1);
			std::cout << "[CXX] a int cpp: " << a_in_cpp << std::endl;
		}

		lua_getglobal(L, "multiplyer");
		if (lua_isfunction(L, -1))
		{
			lua_pushnumber(L, 1.12);
			lua_pushnumber(L, 2.100);
			int r1 = lua_pcall(L, 2, 1, 0);

			if(r1 == LUA_OK)
			{
				float f = (float)lua_tonumber(L, -1);
				std::cout << "[CXX] called \"multiplyer\" in LUA and returned: " << f << std::endl;
			}
		}

		lua_getglobal(L, "doin");
		if (lua_isfunction(L, -1))
		{
			lua_pushnumber(L, 1);
			lua_pushnumber(L, 2);
			lua_pushnumber(L, 3);
			int r1 = lua_pcall(L, 3, 1, 0);

			if(r1 == LUA_OK)
			{
				float f = (float)lua_tonumber(L, -1);
				std::cout << "[CXX] called \"doin\" in LUA and returned: " << f << std::endl;
			}
		}
	}
	else
	{
		std::cout << "[CXX] Fatal Lua Problem:\n" << lua_tostring(L, -1) << std::endl;
	}

	lua_close(L);
	return EXIT_SUCCESS;
}
