return {
  get_floating_window = function (width, height)
    
    -- local buf = vim.api.nvim_create_buf(true, true)
    local ui = vim.api.nvim_list_uis()
    print(ui[1])
    -- local window = vim.api.nvim_open_win(buf, 1, {
    --   relative = 'editor',
    --   width = width,
    --   height = height, 
    --   col = (ui.width/2) - (width/2),
    --   row = (ui.height/2) - (height/2),
    --   anchor = 'NW',
    --   style = 'minimal',
    --   border = 'rounded'
    -- })
  end
}
