local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

-- <leader> , disables higlighting
map('n', '<leader>,', ':noh<CR>')

-- Fix * (Keep the cursor position, don't move to next match)
map('n', '*', '*N')

-- Set jk to escape every mode
map('i', 'jk', '<ESC>')
map('x', 'jk', '<ESC>')

-- Quickly save the current buffer or all buffers
map('n', '<leader>s', ':source %<CR>')
map('n', '<leader>w', ':w<CR>')
map('n', '<leader>W', ':wall<CR>')

-- Copying the vscode behaviour of making tab splits
map('n', '<leader>v', ':vsplit | Telescope find_files<CR>')
map('n', '<leader>h', ':split | Telescope find_files<CR>')
-- close view but keep it in the buffer list
map('n', '<leader>c', ':q<CR>')
-- close view and remove it from the buffer list
map('n', '<leader>q', ':bw<CR>')

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
map('n', '<C-j>', ':move .+1<CR>')
map('n', '<C-k>', ':move .-2<CR>')
map('x', '<C-j>', ":move '>+1<CR>gv=gv")
map('x', '<C-k>', ":move '<-2<CR>gv=gv")

-- Use operator pending mode to visually select the whole buffer
-- e.g. dA = delete buffer ALL, yA = copy whole buffer ALL
map('o', 'A', ':<C-U>normal! mzggVG<CR>`z')
map('x', 'A', ':<C-U>normal! ggVG<CR>')

------------------------
-- Telescope keybinds --
------------------------

-- Files
map('n', '<leader>o', ':Telescope find_files<CR>')

-- Buffers
map('n', '<leader>b', ':Telescope buffers<CR>')
