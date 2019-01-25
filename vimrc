set nocompatible

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab


" Включаем "умные" отступы, например, авто отступ после `{`
set smartindent

" Подсвечивать линию текста, на которой находится курсор
"set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
"highlight CursorLine term=none cterm=none

""автоматическая установка количества пробелов в новой строке как в предыдущей
set autoindent

set paste "корректно вставляет отступы

"перенос длинных строк
set wrap
"
""поиск и подсветка результатов
set showmatch
set hlsearch
set incsearch
set ignorecase

"Показываем табы в начале строки точками
set listchars=tab:··
set list

" Кодировка текста по умолчанию utf8
set termencoding=utf8

""Порядок применения кодировок и формата файлов
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

syntax on


"Формат строки состояния
"всегда показывать строку состояния
"Изменяет шрифт строки статуса (делает его не жирным)
"hi StatusLine gui=reverse cterm=reverse

"При вставке фрагмента сохраняет отступ
set pastetoggle=

"F11 - включить-выключить нумерацию строк
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>

set t_Co=256 " использовать больше цветов в терминале

"set clipboard=unnamed " во избежание лишней путаницы использовать системный
"буфер обмена вместо буфера Vim
"
""показывать варианты авто-дополнения.
set wildmenu

"показывать незавершенные команды в статусбаре (автодополнение ввода)
set showcmd

" More suitable mapping
function SMap(key, action, ...)
let modes = " vi"
if (a:0 > 0)
let modes = a:{1}
endif
if (match(modes, '\Ii') != -1)
execute 'imap ' . a:key . ' <Esc>' . a:action
endif
if (match(modes, '\Nn') != -1)
execute 'nmap ' . a:key . ' <Esc>' . a:action
endif
if (match(modes, ' ') != -1)
execute 'map ' . a:key . ' <Esc>' . a:action
endif
if (match(modes, '\Vv') != -1)
execute 'vmap ' . a:key . ' <Esc>' . a:action
endif
endfunction

" Быстрое сохранение по F2
call SMap("<F2>", ":w<cr>")

"Выбор кодировки, в которой читать файл -->
"set wcm=<Tab>
"menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
"menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
"menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
"menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
"map <F8> :emenu Encoding.Read.<TAB>
"
""" Выбор кодировки, в которой сохранять файл -->
set wildmenu
set wcm=<Tab>
menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utf8 <CR>
menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
map <S-F7> :emenu Encoding.Write.<TAB>

" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
" set wildmenu
" set wcm=<Tab>
" menu Encoding.End_line_format.unix<Tab><C-F7> :set fileformat=unix<CR>
" menu Encoding.End_line_format.dos<Tab><C-F7> :set fileformat=dos<CR>
" menu Encoding.End_line_format.mac<Tab><C-F7> :set fileformat=mac<CR>
" map <C-F7> :emenu Encoding.End_line_format.<TAB>
"
"включим автозамену по умолчанию
"set et
"вкл автоотступ
""set ai
"номера строк
"set number
"цветовая схема
"colorscheme desert
"поддержка мыши
"set mouse=a
