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
SET compilerFlags=-g -Wall -Werror -pedantic
SEt optimiseFlag=-O3
REM -Wall -Werror
SET includeFlags=-Isrc -IC:/Users/Graef/AppData/Local/Lua/include
SET linkerFlags=-LC:/Users/Graef/AppData/Local/Lua -llua54.lib

ECHO "Building %assembly%..."
clang %cppFilenames% %compilerFlags% %optimiseFlag% -o ./bin/%assembly%.exe %includeFlags% %linkerFlags%
