local status, mason = pcall(require, 'mason-lspconfig')

if not status then
  return
end

mason.setup({
  automatic_installation = true,
})
