#!/usr/bin/env nu

def build [
	files: list
] {
	let includeFlags = ([-I, $env.LUA_DIR, /include] | str join)
	let linkerFlags = ([-L, $env.LUA_DIR] | str join)
	clang $files --std=c++20 -Wall -Wextra -pedantic -O3 -Isrc $includeFlags $linkerFlags -llua54.lib -o ./bin/emlua.exe
}

def main [
	--run (-r) # Runs the executable after compiling
] {
	let cppFilenames = (ls **/*.cpp | get name)

	print $cppFilenames

	# Making the directory
	(mkdir bin)

	print "> Making the executable"
	build $cppFilenames
	print "> Finished making the exectable"

	if $run {
		print "> Running the executable:"
		.\bin\emlua.exe
	}
}
