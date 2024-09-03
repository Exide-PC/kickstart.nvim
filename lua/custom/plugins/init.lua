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
      vim.cmd('highlight! HarpoonInactive guibg=NONE guifg=#9b9b9b')
      vim.cmd('highlight! HarpoonActive guibg=NONE guifg=white')
      vim.cmd('highlight! HarpoonNumberActive guibg=NONE guifg=#3794ff')
      vim.cmd('highlight! HarpoonNumberInactive guibg=NONE guifg=#3794ff')
      vim.cmd('highlight! TabLineFill guibg=NONE guifg=white')

      require('harpoon').setup({
        menu = {
          width = 80, -- or dynamically: width = vim.api.nvim_win_get_width(0) - 4,
        },
        tabline = true,
        tabline_prefix = "   ",
        tabline_suffix = "   ",
      })
    end,
    keys = {
      { '<leader>t', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = 'Open tab' },
      { '<leader>T', '<cmd>lua require("harpoon.mark").add_file()<CR>', desc = 'Add tab' },
      -- { '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', desc = 'Goto tab [1]' },
      -- { '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', desc = 'Goto tab [2]' },
      -- { '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', desc = 'Goto tab [3]' },
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
        width = 150,
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
  }
}
