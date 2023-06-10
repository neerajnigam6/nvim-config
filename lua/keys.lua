-- key mapper function is mapped to key_mapper here
local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true, silent = true}
  )
end


key_mapper('', '<up>', '<nop>')
key_mapper('', '<down>', '<nop>')
key_mapper('', '<left>', '<nop>')
key_mapper('', '<right>', '<nop>')
key_mapper('i', 'jk', '<ESC>')
key_mapper('i', 'JK', '<ESC>')
key_mapper('i', 'jK', '<ESC>')
key_mapper('v', 'jk', '<ESC>')
key_mapper('v', 'JK', '<ESC>')
key_mapper('v', 'jK', '<ESC>')
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
key_mapper('n', '<leader>ff', ':lua require"telescope.builtin".find_files()<CR>')
key_mapper('n', '<leader>fs', ':lua require"telescope.builtin".live_grep()<CR>')
key_mapper('n', '<leader>fh', ':lua require"telescope.builtin".help_tags()<CR>')
key_mapper('n', '<leader>fb', ':lua require"telescope.builtin".buffers()<CR>')
-- --key_mapper('n', '<leader>tfb', ':Telescope file_browser<CR>')
-- key_mapper('n', '<leader>tfc', ':Telescope file_browser path=%:p:h select_buffer=true<CR>')

-- Move to previous/next
key_mapper('n', '≤', '<Cmd>BufferPrevious<CR>', opts)
key_mapper('n', '≥', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
key_mapper('n', '<leader>≤', '<Cmd>BufferMovePrevious<CR>', opts)
key_mapper('n', '<leader>≥', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
key_mapper('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
key_mapper('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
key_mapper('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
key_mapper('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
key_mapper('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
key_mapper('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
key_mapper('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
key_mapper('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
key_mapper('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
key_mapper('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
key_mapper('n', ',', '<Cmd>BufferPin<CR>', opts) -- option + p then press enter
-- Close buffer
key_mapper('n', '¸', '<Cmd>BufferClose<CR>', opts) -- option + c then press enter


-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
key_mapper('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
key_mapper('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
key_mapper('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
key_mapper('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
key_mapper('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- tree filebrowser commands
key_mapper('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
-- toggleterm setup

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

