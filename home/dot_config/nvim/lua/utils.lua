local keymap_opts = { noremap = true, silent = true }
local keymap_nvim = vim.api.nvim_set_keymap

function keymap(modes, map_keys, mapped_to) 
  for _, mode in ipairs(modes) do 
    keymap_nvim(mode, map_keys, mapped_to, keymap_opts)
  end 
end 

local opts = { noremap = true, silent = true } 
function nmap(keys_to_bind, cmd_bind_to, wk_label)
  keymap_nvim('n', keys_to_bind, cmd_bind_to, keymap_opts)  
end

function imap(keys_to_bind, cmb_bind_to, wk_label)
  keymap_nvim('i', keys_to_bind, cmd_bind_to, opts) 
end

function vmap(keys_to_bind, cmb_bind_to, wk_label)
  keymap_nvim('v', keys_to_bind, cmd_bind_to, opts) 
end

function tmap(keys_to_bind, cmb_bind_to, wk_label)
  keymap_nvim('t', keys_to_bind, cmd_bind_to, opts) 
end

-- These utils use folke/which-key.nvim plugin to do bindings for all aspects of the configuration.
-- This has two distinct advantages:
--     1. Bindings are implemented consistently w.r.t options across the board (e.g. noremap)
--     2. Bindings automatically come with helper text via which_key that allows you to see 
--         what you're actuallying doing when you run a command
--
-- Reference: https://github.com/folke/which-key.nvim

local which_key_ok, which_key = pcall(require, "which-key") 
if not which_key_ok then 
  error("Unable to load reuqired module: which_key")
end

local setup = {
  plugins = { spelling = { enabled = true, suggestions = 20 } },
  presets = { windows = false },
  window = { position = "top" },
  ignore_missing = true,
}
which_key.setup(setup)

function leader(mappings)
  which_key.register(mappings, { prefix = "<leader>"})
end


function configure(pkg_name, configuration_callback, throw_error)
  throw_error = throw_error or true
  local pkg_load_ok, pkg = pcall(require, pkg_name)
  if not pkg_load_ok then 
    if throw_error then 
      error("Unable to load requested package: " .. pkg_name)
    else 
      return
    end
  end 
  configuration_callback(pkg)
end

