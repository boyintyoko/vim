require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", ";", ":", { desc = "CMD enter command mode" })
