local utils = require('utils')

-- nvim-web-devicons plugin provides nice icons for neovim
-- Reference: https://github.com/kyazdani42/nvim-web-devicons
require('nvim-web-devicons').setup { default = true }

-- NVIM Tree plugin creates a file explorer tree
-- Reference: https://github.com/kyazdani42/nvim-tree.lua 
configure('nvim-tree', function(nvim_tree)
  nvim_tree.setup {
    open_on_setup = true, 
    number = true, 
    relativenumber = true
  } 
end)

-- Lualine pluign creates a status line for simple visualiztion
-- Reference: https://github.com/nvim-lualine/lualine.nvim
configure('lualine', function(lualine) 
  lualine.setup {
    options = {
      section_separators = { left = '|', right = '|' },
      sections = {
        lualine_a = {'branch'},
        lualine_b = {'diff'},
        lualine_c = {'filename', 'location'},
        lualine_x = {'buffers'},
        lualine_y = {'progress'},
        lualine_z = {'mode'},
      }
    }
  }
end)

-- Cokeline plugin creates a tab line for visualizations
-- Reference: https://github.com/noib3/nvim-cokeline
configure('cokeline', function(cokeline)
  cokeline.setup {
    mappings = { cycle_prev_next = false },
  } 
end)

-- Trouble plugin integrates with language servers to display errors
-- Reference: https://github.com/folke/trouble.nvim
configure('trouble', function(trouble)
  trouble.setup {
    auto_close = true, 
    signs = {
        error = "error",
        warning = "warn",
        hint = "hint",
        information = "info"
    },
  }
end)

-- Todo Comments plugin integrates with trouble and telescope to surface left over tasks
-- Reference: https://github.com/folke/todo-comments.nvim 
configure('todo-comments', function(todo_comments)
  todo_comments.setup {
    keywords = {
      TODO = { icon = "!!", color = "error" },
    },
  }
end)

