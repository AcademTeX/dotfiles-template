local utils = require("utils") 

-- Floaterm plugin provides a floating terminal
-- References: https://github.com/voldikss/vim-floaterm
vim.g.floaterm_gitcommit='floaterm'
vim.g.floaterm_width=0.8
vim.g.floaterm_height=0.8
vim.g.floaterm_autoclose=2
vim.g.floaterm_title="┤ Terminal ($1 / $2) ├"
vim.g.floaterm_opener="vsplit"
vim.cmd [[ 
  hi Floaterm guibg=black
  hi FloatermBorder guifg=NONE guibg=cyan
]]

-- Telescope is a plugin that provides nice search and fuzzy find functionality for NeoVim
-- References: https://github.com/nvim-telescope/telescope.nvim 
configure('telescope', function(telescope) 
  telescope.setup {
    pickers = { 
      buffers = {
        theme = 'dropdown',
        sort_lastused = true, 
        sort_mru = true, 
        show_all_buffers = true, 
        ignore_current_buffer = true, 
      },
      find_files = { hidden = true },
    },
  }
end) 

-- Keybindings for using telescope quickly for common uses

function git_or_find_files()
  local utils = require('telescope.utils')
  local builtin = require('telescope.builtin') 

  local is_git_dir = utils.get_os_command_output({'git', 'rev-parse', '--git-dir'})

  if is_git_dir[1] then 
    builtin.git_files()
  else 
    builtin.find_files()
  end
end

