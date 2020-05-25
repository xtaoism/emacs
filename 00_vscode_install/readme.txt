==============================================


1.
VSCode-win32-x64-1.42.1
extract to
E:\vscode\VSCode-win32-x64-1.42.1

2.
test_vscode_project
locate E:\vscode\test_vscode_project

3.
mingw-w64 is installed at
c:\mingw64
cmake-3.17.0-rc1-win64-x64.msi is installed at
c:\CMake

4.
LLVM-9.0.0-win64.exe is installed at
c:\LLVM

5.
Modify the env Path of windows10
c:\CMake\bin
c:\mingw64\bin
c:\LLVM\bin

6. Install the extensions of VSCode
c/c++;
c/c++ Clang Command Adapter;
c++ Intellisense;
Clang-Format;
ClangComplete;
CMake;
CMake Tools;
Code Runner;

7. Configure of VSCode
a: Press Ctrl+Shift+p,  Choose CMake: Select a kit
   Find the GCC8.1.0  // the select the c:/mingw64/*
   Scan the kit if you can't find the GCC8.1.0
b: open the file test.c,
   Press F7, then cmake begin to work,
   Press F5, gdb begin to wror
c: Modify the CMakeLists.txt if we need the subfolder

4. 
ok

5. Doxygen Documentation Generator,  (Recommendation)
   For doxygen annotation


   editor.cursorSurroundingLines = 99 cursor is always at center line, good
  
Import:
We must modify the json files of test_vscode_project if we set different paths of step3/step5


