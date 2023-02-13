local _M = {
  terminal = 'kitty',
  floatingTerminal = 'alacritty',
  editor   = 'nvim',
}

_M.editor_cmd = _M.terminal .. ' -e ' .. _M.editor
_M.manual_cmd = _M.terminal .. ' -e man awesome'

return _M
