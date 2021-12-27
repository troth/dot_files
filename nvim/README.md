To use `nvim` will need to manually install a few things:

* The `nvim`nvim AppImage.
* The `plug.vim` plugin manager.
* The `ccls` LSP server (`apt install ccls`)

For navigating C++ code in a project:

* Need to add a `.ccls` file at the root of the each project with something
  like the following:

    >--> $ cat .ccls
    clang++
    %c -std=c11
    %cpp -std=c++11
    -I<path>
    <other-cflags>
    <other-cxxflags>

  Could also provide a `compile_commands.json` file, but I've not tried that yet.

See https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-file

Didn't have any luck getting the clangd lsp working yet.
