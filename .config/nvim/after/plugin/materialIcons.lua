local web_devicons_ok, web_devicons = pcall(require, 'nvim-web-devicons')
local material_icon_ok, material_icon = pcall(require, 'nvim-material-icon')

if web_devicons_ok and material_icon_ok then
  material_icon.setup({
    override = {
    },
  })
  web_devicons.setup({
    override = material_icon.get_icons(),
  })
end
