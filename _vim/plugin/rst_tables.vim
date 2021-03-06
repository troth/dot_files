"
" reStructuredText tables plugin
" Language:     Python (ft=python)
" Maintainer:   Vincent Driessen <vincent@datafox.nl>
" Version:      Vim 7 (may work with lower Vim versions, but not tested)
" URL:          http://github.com/nvie/vim-rst-tables
"
" This plugin is a more flexible reimplementation of the ideas and the
" existing Vim plugin by Hugo Ruscitti:
"   http://www.vim.org/scripts/script.php?script_id=3041
"

" Only do this when not done yet for this buffer
if exists("g:loaded_rst_tables_ftplugin")
    finish
endif
let loaded_rst_tables_ftplugin = 1

let s:pth = glob(fnamemodify(resolve(expand('<sfile>:p')), ':h:h').'/python/rst_tables.py')

if has('python3')
    execute 'py3file '.s:pth
else
    execute 'pyfile '.s:pth
endif

" Add mappings, unless the user didn't want this.
" The default mapping is registered, unless the user remapped it already.
if !exists("no_plugin_maps") && !exists("no_rst_table_maps")
    if !hasmapto('ReformatTable(')
        noremap <silent> <leader><leader>c :call ReformatTable()<CR>
    endif
    if !hasmapto('ReflowTable(')
        noremap <silent> <leader><leader>f :call ReflowTable()<CR>
    endif
endif
