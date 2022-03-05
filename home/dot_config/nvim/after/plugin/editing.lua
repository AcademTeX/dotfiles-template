local utils = require("utils")

-- vim-auto-save plugin removes the need to save and instead saves buffers continuously
-- Reference: https://github.com/907th/vim-auto-save
vim.g.auto_save=1
vim.g.auto_save_silent=1
vim.g.auto_save_events={ "InsertLeave", "TextChanged", "CursorHold" }

