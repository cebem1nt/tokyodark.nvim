local config = require("tokyodark.config")
local utils = require("tokyodark.utils")

local palette = {
    black = "#363b54",
    bg0 = "#08080b",
    bg1 = "#1A1B2A",
    bg2 = "#212234",
    bg3 = "#353945",
    bg4 = "#4A5057",
    bg5 = "#282C34",
    bg_red = "#FE6D85",
    bg_green = "#98C379",
    bg_blue = "#9FBBF3",
    diff_red = "#773440",
    diff_green = "#587738",
    diff_blue = "#2A3A5A",
    diff_add = "#1E2326",
    diff_change = "#262B3D",
    diff_delete = "#281B27",
    diff_text = "#1C4474",
    fg = "#A0A8CD",
    red = "#f7768e",
    orange = "#ff9e64",
    yellow = "#e0af68",
    green = "#41a6b5",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    purple = "#A485DD",
    grey = "#acb0d0",
    none = "NONE",
}

local function gamma_correction(colors)
    local colors_corrected = {}
    for k, v in pairs(colors) do
        colors_corrected[k] = utils.color_gamma(v, config.gamma)
    end
    return colors_corrected
end

local custom_palette = type(config.custom_palette) == "function"
        and config.custom_palette(palette)
    or config.custom_palette

return gamma_correction(vim.tbl_extend("force", palette, custom_palette))
