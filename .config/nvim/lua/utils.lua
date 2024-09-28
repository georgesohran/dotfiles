return {
  get_floating_text_window = function (width, height, text_lines)
    local buf = vim.api.nvim_create_buf(false, true)

    local ui = vim.api.nvim_list_uis()[1]

    local window = vim.api.nvim_open_win(buf, 1, {
      relative = 'editor',
      width = width,
      height = height,
      col = (ui.width/2) - (width/2),
      row = (ui.height/2) - (height/2),
      anchor = 'NW',
      style = 'minimal',
      border = 'rounded'
    })

    local offset = 0
    for i = 1, #text_lines do
      offset = offset + 1
      vim.api.nvim_buf_set_text(buf, offset, 1, offset, string.len(text_lines[i]), text_lines[i])
    end

 end
}
