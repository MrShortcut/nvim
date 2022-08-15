local status, prettier = pcall(require, "prettier")
if (not status) then return end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    "CSS",
    "JavaScript",
    "javascriptreact",
    "TypeScript",
    "typescriptreact",
    "json",
    "SCSS",
    "HTML",
    "JSX",
  }
}
      

