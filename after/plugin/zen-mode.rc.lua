local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
}

vim.keymap.set('n', '<M-ñ>', '<cmd>ZenMode<cr>', { silent = true })
