return {
  -- Mini Notify
  {
    'echasnovski/mini.notify',
    version = '*',
    config = function()
      require('mini.notify').setup({
        -- Your custom configuration for mini.notify
	view = 'default',
	animation = 'slide',
	timeout = 2000,
      })
      end,
  },
  -- Mini Tabline
  {
    'echasnovski/mini.tabline',
    version = '*',
    config = function()
      require('mini.tabline').setup({
        -- Your custom configuration for mini.tabline
	-- write something to fix ti
	show_filename = true,
	show_icons = true,
	set_vim_settings = true,
      })
    end,
  },
  -- Mini Starter
  {
    'echasnovski/mini.starter',
    version = '*',
    config = function()
      require('mini.starter').setup({
      -- No need to copy this inside `setup()`. Will be used automatically.
		{
		  -- Whether to open starter buffer on VimEnter. Not opened if Neovim was
		  -- started with intent to show something else.
		  autoopen = true,

		  -- Whether to evaluate action of single active item
		  evaluate_single = false,
		  -- Items to be displayed. Should be an array with the following elements:
		  -- - Item: table with <action>, <name>, and <section> keys.
		  -- - Function: should return one of these three categories.
		  -- - Array: elements of these three types (i.e. item, array, function).
		  -- If `nil` (default), default items will be used (see |mini.starter|).
		  items = {
		    -- require("mini.starter").sections.builtin_actions(),
		    require("mini.starter").sections.recent_files(5, true, false),
			},
 
		  -- Show 10 recent files

		  -- Header to be displayed before items. Converted to single string via
		  -- `tostring` (use `\n` to display several lines). If function, it is
		  -- evaluated first. If `nil` (default), polite greeting will be used.
		  header = nil,

		  -- Footer to be displayed after items. Converted to single string via
		  -- `tostring` (use `\n` to display several lines). If function, it is
		  -- evaluated first. If `nil` (default), default usage help will be shown.
		  footer = nil,

		  -- Array  of functions to be applied consecutively to initial content.
		  -- Each function should take and return content for 'Starter' buffer (see
		  -- |mini.starter| and |MiniStarter.content| for more details).
		  content_hooks = {
		    require('mini.starter').gen_hook.adding_bullet(),
		    require('mini.starter').gen_hook.indexing('all', { silent = true }),
		    function(content)
		      vim.api.nvim_buf_set_keymap(
		        0,
		        'n',
		        'q',
		        ':q<CR>',
		        { noremap = true, silent = true }
		      )
		      return content
		    end,
		  },

		  -- Characters to update query. Each character will have special buffer
		  -- mapping overriding your global ones. Be careful to not add `:` as it
		  -- allows you to go into command mode.
		  query_updaters = 'abcdefghijklmnopqrstuvwxyz0123456789_-.',

		  -- Whether to disable showing non-error feedback
		  silent = false,
		}
        -- Your custom configuration for mini.starter
      })
    end,
  },
-- Mini Icons
{
  'echasnovski/mini.icons',
  version = '*',
  config = function()
    require('mini.icons').setup()
  end,
},

-- Mini Animate
{
  'echasnovski/mini.animate',
  version = '*',
  config = function()
    require('mini.animate').setup({
      scroll = {
        enable = false,
      },
    })
  end,
},

-- Mini Test
{ 'echasnovski/mini.test', version = '*' },

-- Mini Trailspace
{ 'echasnovski/mini.trailspace', version = '*' },

-- Mini Visits
{ 'echasnovski/mini.visits', version = '*' },

-- Mini Files
{
  'echasnovski/mini.files',
  version = '*',
  config = function()
    require('mini.files').setup({
      -- Customization of shown content
      content = {
        -- Predicate for which file system entries to show
        filter = nil,
        -- What prefix to show to the left of file system entry
        prefix = nil,
        -- In which order to show file system entries
        sort = nil,
      },

      -- Module mappings created only inside explorer.
      -- Use `''` (empty string) to not create one.
      mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = 'L',
        go_out      = 'h',
        go_out_plus = 'H',
        mark_goto   = "'",
        mark_set    = 'm',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=',
        trim_left   = '<',
        trim_right  = '>',
	-- tab switching
	next_window = '<Tab>',
	prev_window = '<S_Tab>',
      },

      -- General options
      options = {
        -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true,
        -- Whether to use for editing directories
        use_as_default_explorer = true,
      },

      -- Customization of explorer windows
      windows = {
        -- Maximum number of windows to show side by side
        max_number = math.huge,
        -- Whether to show preview of file/directory under cursor
        preview = false,
        -- Width of focused window
        width_focus = 50,
        -- Width of non-focused window
        width_nofocus = 15,
        -- Width of preview window
        width_preview = 25,
      },
    })
  end,
}

}
