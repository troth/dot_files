NeoVim Configuration
====================

Some things will need to be manually installed for this `nvim` configuration to
work.

Installing NeoVim (aka nvim)
----------------------------

The neovim Ubuntu packages prior to 22.04 are too old, as this configuration
requires neovim >= 0.8.0 (developed and tested with 0.8.2 at the time of this
writing).

Ubuntu 22.04 includes nvim 0.6.1, but now 0.8.2 is available. Using Packer causes
packages to be updated from git repos and some of those packages require >= 0.7.0
now. As such, I'm not using the version of nvim from Ubuntu, but installing the
nvim-0.8.2 deb package (or newer) they are releasing on github:

* https://github.com/neovim/neovim/releases

The AppImage can still be used as noted below. Download the AppImage from the
NeoVim github releases link above.

I typically install the .deb package, but you can also install in `~/AppImages/`
like this:

    $ cd ~/AppImages
    $ curl -v <url-of-appimage-file>
    $ chmod 755 nvim.appimage
    $ mv nvim.appimage nvim-0.8.2.appimage
    $ ln -s nvim-0.8.2.appimage nvim
    $ ln -s nvim nv

After you have installed the language servers, you will need to have nvim
install all of the configured plugins. Fire up nvim and run the following:

    :PackageSync
    :qa

I usually need to do that multiple times before I don't see any errors or
warnings when starting up `nvim` (have not yet dug into why that is happening).

Installing C/C++ Language Server
--------------------------------

Need to install `ccls` LSP server with `apt install ccls`.

For navigating C/C++ code in a project, you need to add a `.ccls` file at the
root of the each project with something like the following:

    $ cat .ccls
    clang++
    %c -std=c11
    %cpp -std=c++11
    -I<path>
    <other-cflags>
    <other-cxxflags>

Could also provide a `compile_commands.json` file, but I've not tried that yet.

For more information, see:

* https://github.com/MaskRay/ccls/wiki/Project-Setup#ccls-file

Didn't have any luck getting the `clangd` lsp server working yet.

Installing Python Language Server
---------------------------------

This configuration uses the `python-language-server`:

* https://github.com/python-lsp/python-lsp-server

You will need to create a virtual environment with the needed packages
installed. I do the following:

    $ cat > setup.sh <<EOF
    #!/bin/bash
    python3 -m venv env
    source env/bin/activate
    pip install --upgrade pip
    pip install --upgrade -r requirements.txt
    EOF

    $ chmod 755 setup.sh

    $ cat > requirements.txt <<EOF
    python-lsp-server[yapf]
    Ropes
    Pyflakes
    pycodestyle
    YAPF
    EOF

    $ ./setup.sh
    ...

    $ source env/bin/activate
    $ nvim <some-python-file>

Navigating through python3 code should now work provided you start up `nvim`
in a shell that has activated the virtual environment.

TODO: There is supposedly a way to configure `nvim` to automatically load the
virtual environment, but I have not yet investigated how to do that.

Installing Rust Language Server
-------------------------------

Follow the installation instructions here:

* https://rust-analyzer.github.io/manual.html#rust-analyzer-language-server-binary

I put the binary in `~/.cargo/bin/` since that is already in my `$PATH`.

Fuzzy File Finding
------------------

The `telescope` plugin allows finding files and greping through files. For it
to work, you need to install the following extra packages in the os (use apt):

* `ripgrep`
* `fd-find`

The key bindings to use it:

* `<leader>pf` : Find files within a project.
* `<C-p>`      : Find git files.
* `<leader>ps` : Grep files in project.
