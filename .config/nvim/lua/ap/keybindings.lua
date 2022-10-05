local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true, noremap = true })
    -- vim.api.nvim_set_keymap(m, k, v, { silent = true })
end

local function nomap(k, v)
    map('n', k, v)
end

local function imap(k, v)
    map('i', k, v)
end

local function vmap(k, v)
    map('v', k, v)
end

-- Esc based on ;
imap(';', '<esc>l')

-- Keep cursors in position
nomap('*', '*N')
nomap('<space>', '')
nomap(',z', 'z=')
nomap('tn', ':tabnew<Space>')
nomap('tk', ':tabnext<CR>')
nomap('tj', ':tabprev<CR>')
nomap('th', ':tabfirst<CR>')
nomap('tl', ':tablast<CR>')
nomap('<leader>q', ':wq<Enter>')
nomap('<leader>Q', ':q!<Enter>')
nomap('<leader>w', ':w<Enter>')
nomap('<leader>o', 'o')
nomap('o', 'o<Esc>')
nomap('O', 'O<Esc>')
nomap('M', ':call cursor(0, 50)<CR>')
nomap('T', ':call cursor(0, 100)<CR>')
nomap('<leader>m', '`')
nomap('<leader>j', '<C-W>j')
nomap('<leader>k', '<C-W>k')
nomap('<leader>h', '<C-W>h')
nomap('<leader>l', '<C-W>l')
nomap('<leader>t', '<C-W>li')
nomap('<leader>rl', '<C-W>L')
nomap('<leader>rh', '<C-W>H')
nomap('<leader>rj', '<C-W>J')
nomap('<leader>rk', '<C-W>K')
nomap('<leader><space>', '^')
nomap('<Enter>', '$')

-- Insert remaps
imap('TT', '`')
imap('RR', '|')
imap('AA', '~')
imap('ZZ', '_')
imap('Dd', '-')
imap('FF', '=')
imap('DD', '+')
imap('QQ', '\'')
imap('Qq', '\"')
imap('Jj', '[')
imap('Kk', ']')
imap('JJ', '{')
imap('KK', '}')
imap(',f', '\\')

-- Nop remappings
nomap('Q', '')
vmap('<C-U>', '')

-- Visual mappings
vmap('<', '<gv')
vmap('>', '>gv')
