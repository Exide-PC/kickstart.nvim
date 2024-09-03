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
  {
    --
    'ThePrimeagen/harpoon',
    config = function()
      require('harpoon').setup({
        tabline = true,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
      })
    end,
    keys = {
      { '<leader>ts', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = '[S]earch harpoon [t]ab' },
      { '<leader>ta', '<cmd>lua require("harpoon.mark").add_file()<CR>', desc = '[A]dd harpoon [t]ab' },
    },
  },
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
          --header = {}, --your header
          week_header = {
            enable = true
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
        width = 150,
      },
    },
  },
}
