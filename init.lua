require('mrshortcut.globals')
require('mrshortcut.base')
require('mrshortcut.highlights')
require('mrshortcut.maps')
require('mrshortcut.bootstrap')
require('mrshortcut.plugins')

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has('macunix')
local is_linux = has('linux')
local is_win = has('win32')

if is_mac or is_linux then
  require('mrshortcut.macos')
end

if is_win then
  require('mrshortcut.windows')
end

ide.colorscheme = 'solarized'
ide.auto_save = false
ide.langs = 'all'
ide.servers = {
  'tsserver',
  'sumneko_lua',
  'prismals',
  'graphql',
  'cssls',
  'cssmodules_ls',
  'html',
  'emmet_ls',
  'tailwindcss',
  'jsonls',
}
--[[
-- How to install formatters
-- command :MasonInstall prettier
--         :MasonInstall stylua
--]]
ide.formattings = {
  'prettier',
  'stylua',
}
ide.diagnostics = {
  'eslint',
  'phpcs',
}
ide.code_actions = {
  'eslint',
}
ide.hovers = {}
ide.completions = {}
