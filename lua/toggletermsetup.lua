
require"toggleterm".setup{
  open_mapping = [[<c-\>]],
  shade_terminal = false,
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.35
    end
  end,
  float_opts = {
    border = 'curved' -- 'single' | 'double' | 'shadow' | 'curved' |
  },
}


local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })

function _lazygit_toggle()
  lazygit:toggle()
end

