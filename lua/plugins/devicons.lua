return {
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      -- Optional configuration for devicons
      require('nvim-web-devicons').setup({
        -- Default options
        override = {}, -- Customize specific icons if desired
        default = true, -- Use default icons if no match is found
      })
    end,
  },
}

