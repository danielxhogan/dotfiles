local nnoremap = require('danielxhogan.keymap').nnoremap;

nnoremap('<C-f>', '<cmd>NERDTreeFocus<CR>')
-- nnoremap('<C-n>', '<cmd>NERDTree<CR>')
nnoremap('<leader>nb', '<cmd>NERDTreeToggle<CR>')
nnoremap('<leader>nn', '<cmd>NERDTreeFind<CR>')

nnoremap('<leader>tt', '<cmd>tab split<cr>')
nnoremap('<leader>tr', '<cmd>tabm -1<cr>')
nnoremap('<leader>ty', '<cmd>tabm +1<cr>')

nnoremap('<leader>ww', '<C-w><C-w>')
nnoremap('<leader>wv', '<C-w><C-v>')

nnoremap('<leader>b', '<C-6>')

nnoremap('<leader>r', '<C-r>')

nnoremap('<leader>ff',  '<cmd>Telescope find_files<cr>')
nnoremap('<leader>fg',  '<cmd>Telescope live_grep<cr>')
nnoremap('<leader>fb',  '<cmd>Telescope buffers<cr>')
nnoremap('<leader>fh',  '<cmd>Telescope help_tags<cr>')

nnoremap('<silent> gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
nnoremap('<silent> gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
nnoremap('<silent> gr','<cmd>lua vim.lsp.buf.references()<cr>')
nnoremap('<silent> gi','<cmd>lua vim.lsp.buf.implementation()<cr>')
nnoremap('<silent> K','<cmd>lua vim.lsp.buf.hover()<cr>')
nnoremap('<silent> <C-k>', '<cmd>lua vim.lsp.buf.signature_help()<cr>')
nnoremap('<silent> <C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')
nnoremap('<silent> <C-p>', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
