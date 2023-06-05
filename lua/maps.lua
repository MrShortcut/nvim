local keymap = vim.keymap
vim.g.mapleader = ' '

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- source this
keymap.set('', 's%', ':source %<CR>')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- CM4 Keymaps --------------------------------------

-- ** Util Functions ***************

local function nmap(shortcut, command, opts)
  vim.keymap.set("n", shortcut, command, opts or { noremap = true, silent = true })
end

local function map(shortcut, command, opts)
  vim.keymap.set("", shortcut, command, opts or { noremap = true, silent = true })
end

local function imap(shortcut, command, opts)
  vim.keymap.set("i", shortcut, command, opts or { noremap = true, silent = true })
end

local function vmap(shortcut, command, opts)
  vim.keymap.set("v", shortcut, command, opts or { noremap = true, silent = true })
end

--keymap.set('n', '<C-Space>', '<C-w>w')
map('<Space>', '<C-w>w')
-- ** Util Functions ***************

-- insert Esc
imap('jj', '<ESC>')
imap('hh', '<ESC>')

-- Exit
keymap.set('n', '<Leader>q', ':q!<CR>')

-- Save and Exit
keymap.set('n', '<Leader>w', ':wq!<CR>')

-- Save file
keymap.set('n', '<Leader>s', ':w<CR>')

-- Fast cursor Movement
keymap.set('n', '<Leader>i', ':terminal<CR>')
keymap.set('n', '<Leader>h', 'h _<ESC>')
keymap.set('n', '<Leader>l', '$')
keymap.set('n', '<Leader>j', '9j')
keymap.set('n', '<Leader>k', '9k')

-- Quick semi
nmap('<leader>;', '$a;<Esc>')
nmap('<leader>,', '$a,<Esc>')

-- Buffers
map('<leader>ob', ':buffers<Cr>')

-- Copy relative line
nmap('<leader>kp', ':let @*=expand("%")<CR>')

-- Fast Crolling
nmap('<C-j>', '10<C-e>')
nmap('<C-k>', '10<C-y>')

-- Better Tabbing
vmap('<', '<gv')
vmap('>', '>gv')

-- RunCode-Python
nmap('<Leader>p', ':!python3 %<cr>')

-- " Move selected line / block of text in visual mode
-- " alt + k to move up
-- " alt + j to move down
map('<M-k>', ':m .-2<CR>==')
map('<M-j>', ':m .+1<CR>==')

-- " Move lines
vmap('<M-k>', ":m '<-2<CR>gv-gv")
vmap('<M-j>', ":m '>+1<CR>gv-gv")

-- " Use directional arrows to resize windows
-- " alt + shift + k to resize up
-- " alt + shift + j to resize down
nmap('<M-K>', ':resize -2<CR>')
nmap('<M-J>', ':resize +2<CR>')
nmap('<M-L>', ':vertical resize -2<CR>')
nmap('<M-H>', ':vertical resize +2<CR>')

-- " Nodejs
nmap('<Leader>r', ':!node %<CR>')

-- " Faster scrolling
nmap('<M-e>', '9<C-e>')
nmap('<M-y>', '9<C-y>')

--
nmap('<Leader>d', 'dd')
nmap('x', '"_x')

--
map('<C-p>', ':set paste<Return>a')
-- " Increment/decrement
nmap('+', '<C-a>')
nmap('-', '<C-x>')

-- " Delete word back fast
map('<M-w>', 'dB')

-- " Select all
nmap('<C-a>', 'gg<S-v>G')
map('<leader>a', 'gg<S-v>G')

-- " Change internal word
map('<leader>n', 'ciw')

-- " Delete until "
map('<leader>c', 'dt"')

-- " Delete until '
map('<leader>C', 'dt\'')

-- Delete this line
map("<leader>d", "dd")

-- Delete until space
map("<leader>2d", "dt<Space>")

-- Yank until space
map("<leader>2y", "yt<Space>")

-- Insert a new line up
map("<leader><leader>o", "O")

-- Exit fast like EL ZORRO
map("<leader>z", "<Esc>ZZ")

-- Delete until >
map("<leader>m", "dt>")

-- Delete until <
map("<leader>M", "dt<")

-- Delete until ;
map("<leader>p", "dt;")

-- Delete until )
map("<leader>9", "dt)")

-- Delete until (
map("<leader>8", "dt(")

-- Delete until .
map("<leader>.", "dt.")

-- from Cursor delete until ,
map("<leader>,", "dt,s<Esc>")

-- Quick semi
map("<leader>2,", "$a,")

-- from C delete until ]
map("<leader>2}", "dt]")

-- from C delete until }
map("<leader>}", "dt}")

-- from C delete until /
map("<leader>7", "dt/")

-- Fast delete entire current document
map("<leader><Backspace>", "ggdG")

-- Change internal t
map("<leader>N", "cit")

-- Change internal B
map("<leader>B", "ciB")

-- Change internal b
map("<leader>2b", "cib")

-- !J
nmap("¿", "f<Space>a<CR><Esc>")

-- Format
keymap.set('n', '<Leader>f', ':lua vim.lsp.buf.formatting_seq_sync()<CR>')

-- Change " -> '
keymap.set('n', '<Leader>2f', "<Cmd>:%s/\"/'/g<CR>")

-- Change !" -> '
keymap.set('n', '<Leader>3f', "<Cmd>:%s/'/\"/g<CR>")
-- CM4 Keymaps --------------------------------------

-- Toggle comment
function toggle_comment()
    local current_line = vim.fn.getline('.')
    local commented_line = string.match(current_line, '^%s*%-%-')

   -- Si la línea está comentada, la descomentamos eliminando los dos guiones iniciales
  if commented_line then
      vim.fn.setline('.', vim.split(current_line, '^%s*%-%-')[2])
  -- Si la línea no está comentada, la comentamos agregando dos guiones al inicio
  else
      vim.fn.setline('.', {'--' .. current_line})
  end
end

-- Mapeos de teclado para alternar comentarios en modo normal y visual
vim.api.nvim_set_keymap('n', '<Leader>1', ':lua toggle_comment()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>1', ':lua toggle_comment()<CR>', { noremap = true, silent = true })


-- Select lines Toggle comment
function toggle_comment_selectedLines()
    local mode = vim.fn.mode()
    local start_line, end_line = vim.fn.line("'<"), vim.fn.line("'>")

    for line = start_line, end_line do
        local current_line = vim.fn.getline(line)
        local commented_line = string.match(current_line, '^%s*%-%-')

-- Si la línea está comentada, la descomentamos eliminando los dos guiones iniciales
        if commented_line then
            vim.fn.setline(line, vim.split(current_line, '^%s*%-%-')[2])
-- Si la línea no está comentada, la comentamos agregando dos guiones al inicio
        else
            vim.fn.setline(line, {'--' .. current_line})
        end
    end

-- Si estamos en el modo visual, salimos del modo visual después de alternar los comentarios
    if mode == 'v' or mode == 'V' then
        vim.cmd('normal! `<')
        vim.cmd('normal! >`')
    end
end
-- Mapeos de teclado para alternar comentarios en modo normal y visual
vim.api.nvim_set_keymap('n', '<Leader>2', ':lua toggle_comment_selectedLines()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Leader>2', ':lua toggle_comment_selectedLines()<CR>', { noremap = true, silent = true })
