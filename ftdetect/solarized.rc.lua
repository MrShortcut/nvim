if ide.colorscheme ~= 'solarized' then
  return
end

local status, solarized = pcall(require, 'solarized')

if not status then
  return
end

solarized.setup({
  theme = 'vim',
  mode = 'dark',
  transparent = false,
  highlights = function(colors, darken, blend)
    return {
      LineNr = { bg = solarized:is_transparent(colors.bg_alt) },
      CursorLineNr = { fg = colors.yellow, bg = darken(colors.yellow) },
      NormalNC = { link = 'Normal' },
      Pmenu = { fg = colors.fg, bg = colors.bg_alt, bold = true },
      PmenuSel = { fg = colors.content, bg = colors.bg_alt_invert, reverse = true, bold = true },
      PmenuSbar = { fg = colors.bg_alt_invert, bg = colors.fg, reverse = true, bold = true },
      PmenuThumb = { fg = colors.primary, bg = colors.bg, reverse = true, bold = true },
      DiagnosticVirtualTextError = { fg = colors.danger, bg = blend(colors.danger, colors.bg, 0.15) },
      DiagnosticVirtualTextWarn = { fg = colors.warning, bg = blend(colors.warning, colors.bg, 0.15) },
      DiagnosticVirtualTextInfo = { fg = colors.info, bg = blend(colors.info, colors.bg, 0.15) },
      DiagnosticVirtualTextHint = { fg = colors.hint, bg = blend(colors.hint, colors.bg, 0.15) },
      Statement = { fg = colors.green, bg = solarized:is_transparent(blend(colors.green, colors.bg, 0.15)) },
      PreProc = { fg = colors.orange, bg = solarized:is_transparent(blend(colors.orange, colors.bg, 0.15)) },
      Type = { fg = colors.yellow, bg = solarized:is_transparent(blend(colors.yellow, colors.bg, 0.15)) },
      Special = { fg = colors.red, bg = solarized:is_transparent(blend(colors.red, colors.bg, 0.15)) },
      SpecialKey = { fg = colors.red },
      CmpItemAbbrDeprecated = { fg = colors.secondary, strikethrough = true },
      CmpItemAbbrMatch = { fg = colors.yellow, reverse = true },
      CmpItemAbbrMatchFuzzy = { fg = colors.yellow, reverse = true },
      CmpItemKindFunction = { link = 'TSFunction' },
      CmpItemKindMethod = { link = 'TSMethod' },
      CmpItemKindConstructor = { link = 'TSConstructor' },
      CmpItemKindClass = { link = 'TSType' },
      CmpItemKindEnum = { link = 'TSConstant' },
      CmpItemKindEvent = { fg = colors.yellow },
      CmpItemKindInterface = { link = 'TSConstructor' },
      CmpItemKindStruct = { link = 'TSType' },
      CmpItemKindVariable = { link = 'TSVariableBuiltin' },
      CmpItemKindField = { link = 'TSProperty' },
      CmpItemKindProperty = { link = 'TSProperty' },
      CmpItemKindEnumMember = { link = 'TSConstBuiltin' },
      CmpItemKindConstant = { link = 'TSConstant' },
      CmpItemKindKeyword = { link = 'TSKeyword' },
      CmpItemKindModule = { link = 'TSFunction' },
      CmpItemKindValue = { fg = colors.fg },
      CmpItemKindUnit = { link = 'TSNumber' },
      CmpItemKindText = { link = 'TSString' },
      CmpItemKindSnippet = { fg = colors.fg },
      CmpItemKindFile = { fg = colors.fg },
      CmpItemKindFolder = { fg = colors.fg },
      CmpItemKindColor = { fg = colors.fg },
      CmpItemKindReference = { fg = colors.fg },
      CmpItemKindOperator = { link = 'TSOperator' },
      CmpItemKindTypeParameter = { fg = colors.violet },
    }
  end,
})

vim.cmd('colorscheme solarized')
