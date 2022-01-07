" Auto-install vim-plug
"if empty(glob('$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim'))
  "silent !iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
  "autocmd VimEnter * PlugInstall
"endif



" Run :LspInstall <server>
	" Where <server> is LSP server from https://github.com/williamboman/nvim-lsp-installer
	" clangd, cssls, html, jsonls, jdtls, tsserver, pyright, sqls
" Update local servers in nvim-lsp-config setup
" Install fzf, ripgrep, LLVM
" Ensure python3-venv is installed
	" apt install --yes -- python3-venv
" Run :TSInstall <language>
	" Where <language> is language from https://github.com/nvim-treesitter/nvim-treesitter
	" c, cpp, css, html, java, javascript, json, python, typescript
" Add to .bashrc or .zshrc: 
	" alias nvim='nvim --startuptime /tmp/nvim-startuptime'



call plug#begin()

	" LSP
		Plug 'neovim/nvim-lspconfig'
		Plug 'williamboman/nvim-lsp-installer'
	" Completion
		Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
	" Syntax
		Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	" Terminal Integration
		Plug 'akinsho/toggleterm.nvim'
	" Registers
		Plug 'gennaro-tedesco/nvim-peekup'
	" Fuzzy Finding
		Plug 'nvim-lua/plenary.nvim'
		Plug 'nvim-telescope/telescope.nvim'
		Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
		Plug 'vijaymarupudi/nvim-fzf'
	" Color
		Plug 'xiyaowong/nvim-transparent'
		Plug 'folke/twilight.nvim'
		Plug 'sunjon/shade.nvim'
		Plug 'norcalli/nvim-colorizer.lua'
		Plug 'winston0410/cmd-parser.nvim'
		Plug 'winston0410/range-highlight.nvim'
	" Colorscheme
		Plug 'Mofiqul/vscode.nvim'
	" Utilities
		Plug 'famiu/bufdelete.nvim'
		Plug 'max397574/better-escape.nvim'
		Plug 'rcarriga/nvim-notify'
	" Icons
		Plug 'kyazdani42/nvim-web-devicons'
	" Debugging
		" Plug 'mfussenegger/nvim-dap'
		" Plug 'rcarriga/nvim-dap-ui'
		" Plug 'Pocco81/DAPInstall.nvim'
	" Tabline
		Plug 'romgrk/barbar.nvim'
	" Statusline
		Plug 'feline-nvim/feline.nvim'
	" Cursorline
		Plug 'yamatsum/nvim-cursorline'
	" Startup
		Plug 'glepnir/dashboard-nvim'
		Plug 'henriquehbr/nvim-startup.lua'
	" Indentation
		Plug 'lukas-reineke/indent-blankline.nvim'
	" File Explorer
		Plug 'kyazdani42/nvim-tree.lua'
	" Git
		Plug 'lewis6991/gitsigns.nvim'
		Plug 'ruifm/gitlinker.nvim'
		Plug 'rhysd/conflict-marker.vim'
		Plug 'tpope/vim-fugitive'
	" Commenting
		Plug 'numToStr/Comment.nvim'
		Plug 'folke/todo-comments.nvim'
		Plug 's1n7ax/nvim-comment-frame'
		Plug 'danymat/neogen'
	" Quick Fix
		Plug 'kevinhwang91/nvim-bqf'
	" Motion
		Plug 'ggandor/lightspeed.nvim'
		Plug 'tpope/vim-repeat'
	" Search
		Plug 'rktjmp/highlight-current-n.nvim'
	" Scrolling
		Plug 'karb94/neoscroll.nvim'
	" Editing Support
		Plug 'windwp/nvim-ts-autotag'
		Plug 'Pocco81/TrueZen.nvim'
		Plug 'romgrk/nvim-treesitter-context'
		Plug 'nacro90/numb.nvim'
		Plug 'abecodes/tabout.nvim'
		Plug 'semanticart/tag-peek.vim'
	" Formatting
		Plug 'sbdchd/neoformat'
	" Discord Presence
		Plug 'andweeb/presence.nvim'
	" Command Line
		Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
	" Sessions
		Plug 'rmagatti/auto-session'
	" Splits and Windows
		Plug 'sindrets/winshift.nvim'
		Plug 'beauwilliams/focus.nvim'
		Plug 'luukvbaal/stabilize.nvim'
		Plug 'https://gitlab.com/yorickpeterse/nvim-window.git'
	" Miscellaneous
		Plug 'jiangmiao/auto-pairs'
		Plug 'camspiers/animate.vim'
		Plug 'camspiers/lens.vim'
		Plug 'jremmen/vim-ripgrep'
		Plug 'mbbill/undotree'
		Plug 'tpope/vim-eunuch'
		Plug 'junegunn/vim-easy-align'
		Plug 'tpope/vim-surround'
		Plug 'maxbrunsfeld/vim-yankstack'

call plug#end()



" Settings
	set nocp
	set relativenumber number
	"set whichwrap += <,>,[,]
	set noerrorbells
	set nowrap
	set mouse+=a
	set hidden
	set cursorline
	set encoding=utf8
	set history=1000
	set clipboard=unnamedplus
	set termguicolors
	syntax on
	filetype plugin on
" Indentation Settings
	set shiftwidth=4
	set tabstop=4
	set expandtab
	set softtabstop=4
	set autoindent
	set smartindent
" System-wide Remaps
	inoremap jk <Esc>
	inoremap kj <Esc>
	noremap H ^
	noremap L $
	map <C-j> <C-d>
	map <C-k> <C-u>
	



" nvim-lspconfig setup
lua << EOF
	local nvim_lsp = require('lspconfig')

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer
	local on_attach = function(client, bufnr)
	  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

	  -- Enable completion triggered by <c-x><c-o>
	  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	  -- Mappings.
	  local opts = { noremap=true, silent=true }

	  -- See `:help vim.lsp.*` for documentation on any of the below functions
	  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
	  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
	  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
	  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
	  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

	end

	-- Use a loop to conveniently call 'setup' on multiple servers and
	-- map buffer local keybindings when the language server attaches
	local servers = { 'clangd', 'cssls', 'html', 'jsonls', 'jdtls', 'tsserver', 'pyright', 'sqls' }
	for _, lsp in ipairs(servers) do
	  nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
		  debounce_text_changes = 150,
		}
	  }
	end
EOF



" nvim-lsp-installer setup
lua << EOF
	local lsp_installer = require("nvim-lsp-installer")

	-- Register a handler that will be called for all installed servers.
	-- Alternatively, you may also register handlers on specific server instances instead (see example below).
	lsp_installer.on_server_ready(function(server)
		local opts = {}

		-- (optional) Customize the options passed to the server
		-- if server.name == "tsserver" then
		--     opts.root_dir = function() ... end
		-- end

		-- This setup() function is exactly the same as lspconfig's setup function.
		-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
		server:setup(opts)
	end)
EOF



" coc_nvim setup
let g:coq_settings = { 'auto_start': 'shut-up' }
lua << EOF
	local lsp = require "lspconfig"
	local coq = require "coq"
EOF
"coq_settings.clients.tabnine.enabled=true
"coq_settings.clients.snippets.warn=[]



" nvim-treesitter setup
lua << EOF
	require'nvim-treesitter.configs'.setup {
	  highlight = {
		enable = true,
		custom_captures = { },
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	  },
	}
	require'nvim-treesitter.configs'.setup {
	  indent = {
		enable = true
	  }
	}
	require 'nvim-treesitter.install'.compilers = { "clang" }
EOF



" toggleterm.nvim setup
lua << EOF
	-- TODO
	require("toggleterm").setup{
	  -- size can be a number or function which is passed the current terminal
	  --[[size = 20 | function(term)
		if term.direction == "horizontal" then
		  return 15
		elseif term.direction == "vertical" then
		  return vim.o.columns * 0.4
		end
	  end,--]]
	  open_mapping = [[<c-\>]],
	  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
	  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
	  hide_numbers = true, -- hide the number column in toggleterm buffers
	  shade_filetypes = {},
	  shade_terminals = true,
	  shading_factor = '<number>', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	  start_in_insert = true,
	  insert_mappings = true, -- whether or not the open mapping applies in insert mode
	  persist_size = true,
	  -- direction = 'vertical' | 'horizontal' | 'window' | 'float',
	  close_on_exit = true, -- close the terminal window when the process exits
	  shell = vim.o.shell, -- change the default shell
	  -- This field is only relevant if direction is set to 'float'
	  float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
		-- width = <value>,
		-- height = <value>,
		winblend = 3,
		highlights = {
		  border = "Normal",
		  background = "Normal",
		}
	  }
	}
EOF



" plenary.nvim setup
	lua local async = require "plenary.async"



" telescope.nvim setup
lua << EOF
	require('telescope').setup{
	  defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
		  i = {
			-- map actions.which_key to <C-h> (default: <C-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			["<C-h>"] = "which_key"
		  }
		}
	  },
	  pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	  },
	  extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
	  }
	}
EOF



" nvim-fzf setup
lua << EOF
	local fzf = require("fzf")
EOF



" telescope-fzf-native.nvim setup
lua << EOF
	-- You dont need to set any of these options. These are the default ones. Only
	-- the loading is important
	require('telescope').setup {
	  extensions = {
		fzf = {
		  fuzzy = true,                    -- false will only do exact matching
		  override_generic_sorter = true,  -- override the generic sorter
		  override_file_sorter = true,     -- override the file sorter
		  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
										   -- the default case_mode is "smart_case"
		}
	  }
	}
	-- To get fzf loaded and working with telescope, you need to call
	-- load_extension, somewhere after setup function:
	-- TODO
	-- require('telescope').load_extension('fzf')
EOF



" nvim-transparent setup
lua << EOF
	require("transparent").setup({
	  enable = true, -- boolean: enable transparent
	  extra_groups = { -- table/string: additional groups that should be clear
		-- In particular, when you set it to 'all', that means all avaliable groups

		-- example of akinsho/nvim-bufferline.lua
		-- "BufferLineTabClose",
		-- "BufferlineBufferSelected",
		-- "BufferLineFill",
		-- "BufferLineBackground",
		-- "BufferLineSeparator",
		-- "BufferLineIndicatorSelected",
	  },
	  exclude = {}, -- table: groups you don't want to clear
	})
EOF



" twilight.nvim setup
lua << EOF
	require("twilight").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
EOF



" shade.nvim setup
lua << EOF
	-- TODO
	--[[
	require'shade'.setup({
	  overlay_opacity = 50,
	  opacity_step = 1,
	  keys = {
		brightness_up    = '<C-Up>',
		brightness_down  = '<C-Down>',
		toggle           = '<Leader>s',
	  }
	})
	--]]
EOF



" nvim-colorizer.lua setup
	lua require'colorizer'.setup()



" range-highlight.nvim setup
	lua require'range-highlight'.setup{}



" vscode.nvim setup
	let g:vscode_style = "dark"
	let g:vscode_transparency = 1
	let g:vscode_italic_comment = 1
	colorscheme vscode



" better-escape.nvim setup
lua << EOF
	require("better_escape").setup {
		mapping = {"jk", "kj"}, -- a table with mappings to use
		timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
		clear_empty_lines = false, -- clear line after escaping if there is only whitespace
		keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
		-- example
		-- keys = function()
		--   return vim.fn.col '.' - 2 >= 1 and '<esc>l' or '<esc>'
		-- end,
	}
EOF



" nvim-notify setup
	lua vim.notify = require("notify")



" nvim-web-devicons setup
lua << EOF
	require'nvim-web-devicons'.setup {
	 -- your personnal icons can go here (to override)
	 -- you can specify color or cterm_color instead of specifying both of them
	 -- DevIcon will be appended to `name`
	 override = {
	  zsh = {
		icon = "",
		color = "#428850",
		cterm_color = "65",
		name = "Zsh"
	  }
	 };
	 -- globally enable default icons (default to false)
	 -- will get overriden by `get_icons` option
	 default = true;
	}
EOF



" barbar.nvim setup
	" Move to previous/next
	nnoremap <silent>    <A-,> :BufferPrevious<CR>
	nnoremap <silent>    <A-.> :BufferNext<CR>
	" Re-order to previous/next
	nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
	nnoremap <silent>    <A->> :BufferMoveNext<CR>
	" Goto buffer in position...
	nnoremap <silent>    <A-1> :BufferGoto 1<CR>
	nnoremap <silent>    <A-2> :BufferGoto 2<CR>
	nnoremap <silent>    <A-3> :BufferGoto 3<CR>
	nnoremap <silent>    <A-4> :BufferGoto 4<CR>
	nnoremap <silent>    <A-5> :BufferGoto 5<CR>
	nnoremap <silent>    <A-6> :BufferGoto 6<CR>
	nnoremap <silent>    <A-7> :BufferGoto 7<CR>
	nnoremap <silent>    <A-8> :BufferGoto 8<CR>
	nnoremap <silent>    <A-9> :BufferLast<CR>
	" Pin/unpin buffer
	nnoremap <silent>    <A-p> :BufferPin<CR>
	" Close buffer
	nnoremap <silent>    <A-c> :BufferClose<CR>
	" Wipeout buffer
	"                          :BufferWipeout<CR>
	" Close commands
	"                          :BufferCloseAllButCurrent<CR>
	"                          :BufferCloseAllButPinned<CR>
	"                          :BufferCloseBuffersLeft<CR>
	"                          :BufferCloseBuffersRight<CR>
	" Magic buffer-picking mode
	nnoremap <silent> <C-s>    :BufferPick<CR>
	" Sort automatically by...
	nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
	nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
	nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
	nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>

	" Other:
	" :BarbarEnable - enables barbar (enabled by default)
	" :BarbarDisable - very bad command, should never be used



" feline.nvim setup
	lua require('feline').setup()



" nvim-startup.lua setup
	"TODO
	"lua require 'nvim-startup'.setup()



" indent-blankline.nvim setup
lua << EOF
	vim.opt.list = true
	vim.opt.listchars:append("eol:↴")
	require("indent_blankline").setup {
		show_end_of_line = true,
		show_current_context = true,
		show_current_context_start = true,
	}
EOF



" nvim-tree.lua setup
lua << EOF
	require'nvim-tree'.setup {
	  disable_netrw       = true,
	  hijack_netrw        = true,
	  open_on_setup       = false,
	  ignore_ft_on_setup  = {},
	  auto_close          = false,
	  open_on_tab         = false,
	  hijack_cursor       = false,
	  update_cwd          = false,
	  update_to_buf_dir   = {
		enable = true,
		auto_open = true,
	  },
	  diagnostics = {
		enable = false,
		icons = {
		  hint = "",
		  info = "",
		  warning = "",
		  error = "",
		}
	  },
	  update_focused_file = {
		enable      = false,
		update_cwd  = false,
		ignore_list = {}
	  },
	  system_open = {
		cmd  = nil,
		args = {}
	  },
	  filters = {
		dotfiles = false,
		custom = {}
	  },
	  git = {
		enable = true,
		ignore = true,
		timeout = 500,
	  },
	  view = {
		width = 30,
		height = 30,
		hide_root_folder = false,
		side = 'left',
		auto_resize = false,
		mappings = {
		  custom_only = false,
		  list = {}
		},
		number = false,
		relativenumber = false,
		signcolumn = "yes"
	  },
	  trash = {
		cmd = "trash",
		require_confirm = true
	  }
	}
EOF



" gitsigns.nvim setup
	lua require('gitsigns').setup()
	set statusline+=%{get(b:,'gitsigns_status','')}



" gitlinker.nvim setup
	lua require"gitlinker".setup()



" conflict-marker.vim setup
	" disable the default highlight group
	let g:conflict_marker_highlight_group = ''

	" Include text after begin and end markers
	let g:conflict_marker_begin = '^<<<<<<< .*$'
	let g:conflict_marker_end   = '^>>>>>>> .*$'

	highlight ConflictMarkerBegin guibg=#2f7366
	highlight ConflictMarkerOurs guibg=#2e5049
	highlight ConflictMarkerTheirs guibg=#344f69
	highlight ConflictMarkerEnd guibg=#2f628e
	highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81



" Comment.nvim setup
	lua require('Comment').setup()



" todo-comments.nvim setup
lua << EOF
	require("todo-comments").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
EOF



" nvim-comment-frame setup
	lua require('nvim-comment-frame').setup()



" neogen setup
	lua require('neogen').setup()



" nvim-bqf setup
	"TODO
	"lua require('nvim-bqf').setup()



" neoscroll.nvim setup
	lua require('neoscroll').setup()



" nvim-ts-autotag setup
	lua require('nvim-ts-autotag').setup()



" TrueZen.nvim setup
lua << EOF
	local true_zen = require("true-zen")

	true_zen.setup({
		ui = {
			bottom = {
				laststatus = 0,
				ruler = false,
				showmode = false,
				showcmd = false,
				cmdheight = 1,
			},
			top = {
				showtabline = 0,
			},
			left = {
				number = false,
				relativenumber = false,
				signcolumn = "no",
			},
		},
		modes = {
			ataraxis = {
				left_padding = 32,
				right_padding = 32,
				top_padding = 1,
				bottom_padding = 1,
				ideal_writing_area_width = {0},
				auto_padding = true,
				keep_default_fold_fillchars = true,
				custom_bg = {"none", ""},
				bg_configuration = true,
				quit = "untoggle",
				ignore_floating_windows = true,
				affected_higroups = {
					NonText = true,
					FoldColumn = true,
					ColorColumn = true,
					VertSplit = true,
					StatusLine = true,
					StatusLineNC = true,
					SignColumn = true,
				},
			},
			focus = {
				margin_of_error = 5,
				focus_method = "experimental"
			},
		},
		integrations = {
			vim_gitgutter = false,
			galaxyline = false,
			tmux = false,
			gitsigns = false,
			nvim_bufferline = false,
			limelight = false,
			twilight = false,
			vim_airline = false,
			vim_powerline = false,
			vim_signify = false,
			express_line = false,
			lualine = false,
			lightline = false,
			feline = false
		},
		misc = {
			on_off_commands = false,
			ui_elements_commands = false,
			cursor_by_mode = false,
		}
	})
EOF



" nvim-treesitter-context setup
lua << EOF
	require'treesitter-context'.setup{
		enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
		throttle = true, -- Throttles plugin updates (may improve performance)
		max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
		patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
			-- For all filetypes
			-- Note that setting an entry here replaces all other patterns for this entry.
			-- By setting the 'default' entry below, you can control which nodes you want to
			-- appear in the context window.
			default = {
				'class',
				'function',
				'method',
				-- 'for', -- These won't appear in the context
				-- 'while',
				-- 'if',
				-- 'switch',
				-- 'case',
			},
			-- Example for a specific filetype.
			-- If a pattern is missing, *open a PR* so everyone can benefit.
			--   rust = {
			--       'impl_item',
			--   },
		},
	}
EOF



" numb.nvim setup
	lua require('numb').setup()



" tabout.nvim setup
	lua require('tabout').setup()



" presence.nvim setup
	let g:presence_auto_update         = 1
	let g:presence_neovim_image_text   = "The One True Text Editor"
	let g:presence_main_image          = "neovim"
	let g:presence_client_id           = "793271441293967371"
	"let g:presence_log_level
	let g:presence_debounce_timeout    = 10
	let g:presence_enable_line_number  = 0
	let g:presence_blacklist           = []
	let g:presence_buttons             = 1
	let g:presence_editing_text        = "Editing %s"
	let g:presence_file_explorer_text  = "Browsing %s"
	let g:presence_git_commit_text     = "Committing changes"
	let g:presence_plugin_manager_text = "Managing plugins"
	let g:presence_reading_text        = "Reading %s"
	let g:presence_workspace_text      = "Working on %s"
	let g:presence_line_number_text    = "Line %s out of %s"



" wilder.nvim
	call wilder#setup({
		 \ 'modes': [':', '/', '?'],
		 \ 'next_key': '<Tab>',
		 \ 'previous_key': '<S-Tab>',
		 \ 'accept_key': '<Down>',
		 \ 'reject_key': '<Up>',
		 \ })



" auto-session setup
	lua require('auto-session').setup()



" winshift.nvim setup
lua << EOF
	-- Lua
	require("winshift").setup({
	  highlight_moving_win = true,  -- Highlight the window being moved
	  focused_hl_group = "Visual",  -- The highlight group used for the moving window
	  moving_win_options = {
		-- These are local options applied to the moving window while it's
		-- being moved. They are unset when you leave Win-Move mode.
		wrap = false,
		cursorline = false,
		cursorcolumn = false,
		colorcolumn = "",
	  },
	  -- The window picker is used to select a window while swapping windows with
	  -- ':WinShift swap'.
	  -- A string of chars used as identifiers by the window picker.
	  window_picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
	  window_picker_ignore = {
		-- This table allows you to indicate to the window picker that a window
		-- should be ignored if its buffer matches any of the following criteria.
		filetype = {  -- List of ignored file types
		  "NvimTree",
		},
		buftype = {   -- List of ignored buftypes
		  "terminal",
		  "quickfix",
		},
		bufname = {   -- List of regex patterns matching ignored buffer names
		  [[.*foo/bar/baz\.qux]]
		},
	  },
	})
EOF



" focus.nvim setup
	lua require("focus").setup()



" stabilize.nvim setup
	lua require("stabilize").setup()



" nvim-window setup
lua << EOF
	require('nvim-window').setup({
	  -- The characters available for hinting windows.
	  chars = {
		'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o',
		'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'
	  },

	  -- A group to use for overwriting the Normal highlight group in the floating
	  -- window. This can be used to change the background color.
	  normal_hl = 'Normal',

	  -- The highlight group to apply to the line that contains the hint characters.
	  -- This is used to make them stand out more.
	  hint_hl = 'Bold',

	  -- The border style to use for the floating window.
	  border = 'single'
	})
EOF