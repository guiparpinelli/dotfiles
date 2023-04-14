require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
vim.keymap.set('n', '<leader>,', builtin.buffers, { desc = 'Switch buffer' })

vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = 'Find file' })
vim.keymap.set('n', '<leader>pf', builtin.git_files, { desc = 'Find project file' })
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Search by grep' })

vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search help' })
