-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
vim.g.VM_maps = {
  -- ['Find Under'] = '<C-d>',
  -- ['Find Subword Under'] = '<C-d>',
  ['Select Cursor Down'] = '<M-C-j>',
  ['Select Cursor Up'] = '<M-C-k>',
}

-- for diffview
vim.opt.fillchars = vim.opt.fillchars + 'diff:/'

return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
  },
  {
    'natecraddock/workspaces.nvim',
    config = function()
      require('workspaces').setup {
        hooks = {
          open = { 'Telescope find_files' },
        },
      }
    end,
    keys = {
      { '<leader>wo', '<cmd>Telescope workspaces theme=dropdown<CR>', desc = '[W]orkspace [O]pen' },
    },
  },
  -- conflicts with bufferline
  -- {
  --   'ThePrimeagen/harpoon',
  --   config = function()
  --     -- vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#9b9b9b')
  --     -- vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
  --     -- vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#3794ff')
  --     -- vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#3794ff')
  --     -- vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')
  --
  --     require('harpoon').setup({
  --       menu = {
  --         width = 80, -- or dynamically: width = vim.api.nvim_win_get_width(0) - 4,
  --       },
  --       -- tabline = true,
  --       -- tabline_prefix = "   ",
  --       -- tabline_suffix = "   ",
  --     })
  --   end,
  --   keys = {
  --     { '<leader>t', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = 'Open tab' },
  --     { '<leader>T', '<cmd>lua require("harpoon.mark").add_file()<CR>', desc = 'Add tab' },
  --     { '<tab>', '<cmd>lua require("harpoon.ui").nav_next()<CR>', desc = 'Next tab' },
  --     { '<s-tab>', '<cmd>lua require("harpoon.ui").nav_prev()<CR>', desc = 'Prev tab' },
  --     -- { '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', desc = 'Goto tab [1]' },
  --     -- { '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', desc = 'Goto tab [2]' },
  --     -- { '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', desc = 'Goto tab [3]' },
  --   },
  -- },
  {
    -- https://github.com/nvimdev/dashboard-nvim
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = {
      {'nvim-tree/nvim-web-devicons'}
    },
    config = function()
      vim.api.nvim_set_hl(0, 'DashboardHeader', { fg = '#cccccc' })
      -- vim.api.nvim_set_hl(0, 'DashboardFooter', { fg = '#ff0000' })
      vim.api.nvim_set_hl(0, 'DashboardDesc', { fg = '#3794ff' })
      vim.api.nvim_set_hl(0, 'DashboardKey', { fg = '#989898' })
      vim.api.nvim_set_hl(0, 'DashboardIcon', { fg = '#cccccc' })
      vim.api.nvim_set_hl(0, 'DashboardShortCut', { fg = '#3794ff' })

      require('dashboard').setup {
        theme = 'doom',
        config = {
          header = {
            "",
            "",
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "",
            "",
          },
          center = {
            {
              icon = ' ',
              desc = 'Open Workspace            ',
              key = 'w',
              keymap = 'SPC w o',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'Telescope workspaces theme=dropdown',
            },
            {
              icon = ' ',
              desc = 'Neovim Settings',
              key = 'n',
              keymap = 'SPC s n',
              key_format = ' %s', -- remove default surrounding `[]`
              action = 'lua require("telescope.builtin").find_files({ cwd = vim.fn.stdpath "config" })'
            },
          },
          footer = {}  --your footer
        }
      }
    end,
  },
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 120,
      },
    },
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        -- options = {
        --   theme = 'codedark',
        -- }
      })
    end
  },
  -- {
  --   "kdheepak/lazygit.nvim",
  --   cmd = {
  --     "LazyGit",
  --     "LazyGitConfig",
  --     "LazyGitCurrentFile",
  --     "LazyGitFilter",
  --     "LazyGitFilterCurrentFile",
  --   },
  --   -- optional for floating window border decoration
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --   },
  --   -- setting the keybinding for LazyGit with 'keys' is recommended in
  --   -- order to load the plugin when the command is run for the first time
  --   keys = {
  --     { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
  --   }
  -- }
  -- {
  --   'sindrets/diffview.nvim',
  --   config = function ()
  --     require("diffview").setup({
  --       enhanced_diff_hl = true,
  --     })
  --   end,
  --   keys = {
  --     { '<leader>do', '<cmd>DiffviewOpen<CR>' },
  --     { '<leader>dc', '<cmd>DiffviewClose<CR>' },
  --   }
  -- },
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function ()
  --     vim.opt.termguicolors = true
  --
  --     vim.keymap.set('n', '<leader>tt', '<cmd>BufferLinePick<CR>', { desc = 'Pick tab' })
  --     vim.keymap.set('n', '<leader>tcc', '<cmd>bd<CR>', { desc = 'Close current tab' })
  --     vim.keymap.set('n', '<leader>tcp', '<cmd>BufferLinePickClose<CR>', { desc = 'Pick tab to close' })
  --     vim.keymap.set('n', '<leader>tch', '<cmd>BufferLineCloseLeft<CR>', { desc = 'Close to the Left' })
  --     vim.keymap.set('n', '<leader>tcl', '<cmd>BufferLineCloseRight<CR>', { desc = 'Close to the Right' })
  --     vim.keymap.set('n', '<leader>tco', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close Others' })
  --     -- vim.keymap.set('n', '<leader>1', '<cmd>BufferLineGoToBuffer 1<CR>', { desc = 'Tab #1' })
  --     -- vim.keymap.set('n', '<leader>2', '<cmd>BufferLineGoToBuffer 2<CR>', { desc = 'Tab #2' })
  --     -- vim.keymap.set('n', '<leader>3', '<cmd>BufferLineGoToBuffer 3<CR>', { desc = 'Tab #3' })
  --     vim.keymap.set('n', '<M-C-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous tab', noremap = true, silent = true })
  --     vim.keymap.set('n', '<M-C-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next tab', noremap = true, silent = true })
  --
  --     local bufferline = require('bufferline')
  --
  --     bufferline.setup({
  --       options = {
  --         close_command = "bdelete %d",       -- can be a string | function, | false see "Mouse actions"
  --         style_preset = bufferline.style_preset.default,
  --         diagnostics = "nvim_lsp",
  --         -- separator_style = 'slant',
  --       }
  --     })
  --   end,
  --   -- keys break tabs for some reason
  -- },
}
