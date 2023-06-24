#include <iostream>
#include <string>
#include <lua.hpp>

int main()
{
	std::cout << "[CXX] Starting Lua..." << std::endl;
	lua_State *L = luaL_newstate();
	luaL_openlibs(L);

	int r = luaL_dofile(L, "src/test.lua");

	if (r == LUA_OK)
	{
		lua_getglobal(L, "a");
		if (lua_isnumber(L, -1))
		{
			float a_in_cpp = (float)lua_tonumber(L, -1);
			std::cout << "[CXX] a int cpp: " << a_in_cpp << std::endl;
		}
	}
	else
	{
		std::cout << "[CXX] Fatal Lua Problem:\n" << lua_tostring(L, -1) << std::endl;
	}

	lua_close(L);
	return 0;
}
