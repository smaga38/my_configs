set nocompatible
"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
"
"
" Включаем "умные" отступы, например, авто отступ после `{`
set smartindent
"
" Подсвечивать линию текста, на которой находится курсор
"set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
"highlight CursorLine term=none cterm=none
"
""автоматическая установка количества пробелов в новой строке как в предыдущей
set autoindent
"
set paste "корректно вставляет отступы
"
"перенос длинных строк
set wrap
"
"Показываем табы в начале строки точками
set listchars=tab:··
set list
"
" Кодировка текста по умолчанию utf8
set termencoding=utf8
"
""Порядок применения кодировок и формата файлов
set ffs=unix,dos,mac
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866
"
syntax on
"
"
"Формат строки состояния
"всегда показывать строку состояния
"Изменяет шрифт строки статуса (делает его не жирным)
"hi StatusLine gui=reverse cterm=reverse
"
"При вставке фрагмента сохраняет отступ
set pastetoggle=
"
"F11 - включить-выключить нумерацию строк
imap <F11> <Esc>:set<Space>nu!<CR>a
nmap <F11> :set<Space>nu!<CR>
"
" использовать больше цветов в терминале
set t_Co=256 
"
" во избежание лишней путаницы использовать системный 
"буфер обмена вместо буфера Vim
"set clipboard=unnamed
"
"показывать незавершенные команды в статусбаре (автодополнение ввода)
set showcmd
"
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
"
" Быстрое сохранение по F2
call SMap("<F2>", ":w<cr>")
"
"Выбор кодировки, в которой читать файл -->
"set wcm=<Tab>
"menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
"menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
"menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
"menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
"map <F8> :emenu Encoding.Read.<TAB>
"
""" Выбор кодировки, в которой сохранять файл -->
set wcm=<Tab>
menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utf8 <CR>
menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
map <S-F7> :emenu Encoding.Write.<TAB>
"
" Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
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
"
"edit vimrc command
command! Vimrc :vs $MYVIMRC
"
"Сохранение действий, даже если вы закрываете и открываете Vim
set undofile
"
"Поиск в процессе набора
set incsearch
"
"Подсвечивание результатов поиска
set hlsearch
"
"умная зависимость от регистра. Детали `:h smartcase`
set ignorecase
set smartcase
"
" Отображение парных символов
set showmatch
"
" Показывать положение курсора всё время.
set ruler
"
" Фолдинг по отсупам
set foldenable
set foldlevel=100
set foldmethod=indent
"
" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden
" Сделать строку команд высотой в одну строку
set ch=1
" Скрывать указатель мыши, когда печатаем
set mousehide
"
" Формат строки состояния. Альтернативные варианты настройки `:h statusline`
set laststatus=2
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
"
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction
"
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ 
"
" Подсвечивать линию текста, на которой находится курсор
"set cursorline
"highlight CursorLine guibg=lightblue ctermbg=lightgray
"highlight CursorLine term=none cterm=none
"
" Увеличение размера истории
set history=200
"
" Дополнительная информация в строке состояния
set wildmenu
"
" Настройка отображения специальных символов
set list listchars=tab:→\ ,trail:·
"
" Включение сторонних плагинов
filetype plugin on
"
