REM Build script
@ECHO OFF
SetLocal EnableDelayedExpansion

REM Get a list of all the .cxx files.
SET cppFilenames=
FOR /R %%f in (*.cpp) do (
	SET cppFilenames=!cppFilenames! %%f
)

REM echo "Files:" %cppFilenames%

SET assembly=emlua
SET compilerFlags=--std=c++20 -g -Wall -Werror -pedantic
SEt optimiseFlag=-O3
REM -Wall -Werror
SET includeFlags=-Isrc -I%LUA_DIR%/include
SET linkerFlags=-L%LUA_DIR% -llua54.lib

ECHO "Building %assembly%..."
clang %cppFilenames% %compilerFlags% %optimiseFlag% -o ./bin/%assembly%.exe %includeFlags% %linkerFlags%
