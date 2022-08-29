local Ide = {}

function Ide:new()
  local t = {}

  self.colorscheme = nil
  self.auto_save = nil
  self.servers = nil
  self.langs = nil
  self.formattings = nil
  self.diagnostics = nil
  self.completions = nil
  self.code_actions = nil
  self.hovers = nil

  self.__index = self
  setmetatable(t, self)

  return t
end

_G.ide = Ide:new()
