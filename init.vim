" Complete Setup
	" For some reason only works well with terminal version
	" Install vim-plug for Neovim
		" Pull from https://github.com/junegunn/vim-plug
	" Run :LspInstall <server>
		" Where <server> is LSP server from https://github.com/williamboman/nvim-lsp-installer
		" clangd, cssls, html, jsonls, jdtls, tsserver, pyright, sqlls, gopls
		" Might need to use x64 native tools command prompt for VS 2017 cmd to open nvim and install
	" Update local servers in nvim-lsp-config setup
	" Install fzf, ripgrep, LLVM
	" Ensure python3-venv is installed
		" apt install --yes -- python3-venv
	" Run :TSInstall <language>
		" Where <language> is language from https://github.com/nvim-treesitter/nvim-treesitter
		" c, cpp, css, html, java, javascript, json, python, typescript, go
		" If errors with '*.so ... is not a valid Win32 Application', might need to start up
			"'x64 Native Tools Command Prompt (VS)' and reinstall with TSInstall, then run TSUpdate
			" (Reference https://github.com/nvim-treesitter/nvim-treesitter/issues/438)
	" Install Inconsolata Nerd Font to computer (if not already)
		" From https://www.nerdfonts.com/font-downloads
	" Add to .bashrc or .zshrc: 
		" alias nvim='nvim --startuptime C:/temp/nvim-startuptime'



call plug#begin()

	" LSP
		Plug 'neovim/nvim-lspconfig'
		Plug 'williamboman/nvim-lsp-installer'
		Plug 'folke/trouble.nvim'
		Plug 'folke/lsp-colors.nvim'
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
		" Plug 'xiyaowong/nvim-transparent'
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
		" Plug 'akinsho/bufferline.nvim'
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
		"Plug 'rmagatti/auto-session'
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
		Plug 'paretje/nvim-man'

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
	"inoremap jk <Esc>
	"inoremap kj <Esc>
	noremap H ^
	noremap L $
	map <C-j> <C-d>
	map <C-k> <C-u>
	let g:mapleader = "\<Space>"
	autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>
" Folding settings
	set foldmethod=manual
	set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend))
	set fillchars=fold:\ 
	set foldnestmax=3
	set foldminlines=1
	au BufWinLeave *.cpp mkview!
	au BufWinEnter *.cpp silent! loadview
	"au BufWinLeave, BufLeave ?* mkview
	"au BufWinEnter, BufEnter ?* silent loadview
	"au BufWinLeave ?* mkview!
	"au BufWinEnter ?* silent! loadview





" nvim-lspconfig setup
lua << EOF
	local nvim_lsp = require('lspconfig')
	local lsp = vim.lsp
	local handlers = lsp.handlers
	local pop_opts = { border = "rounded", max_width = 80 }
	handlers["textDocument/hover"] = lsp.with(handlers.hover, pop_opts)
	handlers["textDocument/signatureHelp"] = lsp.with(handlers.signature_help, pop_opts)

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
	  --[[
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
	  --]]
	end

	-- Use a loop to conveniently call 'setup' on multiple servers and
	-- map buffer local keybindings when the language server attaches
	local servers = { 'clangd', 'cssls', 'html', 'jsonls', 'jdtls', 'tsserver', 'pyright', 'sqlls', 'gopls' }
	for _, lsp in ipairs(servers) do
	  nvim_lsp[lsp].setup {
		on_attach = on_attach,
		flags = {
		  debounce_text_changes = 150,
		}
	  }
	end
	vim.o.updatetime = 250
	vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
EOF
nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>



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
	lsp_installer.settings({
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗"
			}
		}
	})
EOF



" trouble.nvim setup
lua require("trouble").setup{}
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>



" lsp-colors.nvim setup
lua << EOF
	require("lsp-colors").setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981"
})
EOF



" coc_nvim setup
let g:coq_settings = { 'auto_start': 'shut-up' }
lua << EOF
	local lspconfig = require('lspconfig')
	local coq = require "coq"
	local servers = { 'clangd', 'cssls', 'html', 'jsonls', 'jdtls', 'tsserver', 'pyright', 'sqlls', 'gopls' }
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
		}))
	end
EOF
"coq_settings.clients.tabnine.enabled=true



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
	--require 'nvim-treesitter.install'.compilers = { "clang" }
EOF



" toggleterm.nvim setup
" set
let g:toggleterm_terminal_mapping = '<C-t>'
" or manually...
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
tnoremap kj <C-\><C-n>
tnoremap <C-w> <C-\><C-n><C-w>
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>



" plenary.nvim setup
	lua local async = require "plenary.async"



" telescope.nvim setup
lua << EOF
	  require("telescope").setup{
	  defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
		  i = {
			-- map actions.which_key to <C-h> (default: <C-/>)
			-- actions.which_key shows the mappings for your picker,
			-- e.g. git_{create, delete, ...}_branch for the git_branches picker
			["<C-h>"] = "which_key",
		  },
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
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>



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
	--[[
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
	--]]
EOF
" Disables transparency by default
"let g:transparent_enabled = v:false
"nnoremap <F6> :TransparentToggle<CR>



" twilight.nvim setup
lua << EOF
	require("twilight").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
EOF
nnoremap <silent><leader>tt <cmd>Twilight<cr>
" Enables Twilight on startup
"autocmd VimEnter * TwilightEnable



" shade.nvim setup
lua << EOF
	require'shade'.setup({
	  overlay_opacity = 50,
	  opacity_step = 1,
	  keys = {
		brightness_up    = '<C-Up>',
		brightness_down  = '<C-Down>',
		toggle           = '<Leader>ts',
	  }
	})
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
lua << EOF
	require("notify").setup({
	  -- Animation style (see below for details)
	  stages = "fade_in_slide_out",

	  -- Function called when a new window is opened, use for changing win settings/config
	  on_open = nil,

	  -- Function called when a window is closed
	  on_close = nil,

	  -- Render function for notifications. See notify-render()
	  render = "default",

	  -- Default timeout for notifications
	  timeout = 3000,

	  -- For stages that change opacity this is treated as the highlight behind the window
	  -- Set this to either a highlight group, an RGB hex value e.g. "#000000" or a function returning an RGB code for dynamic values
	  background_colour = "Normal",

	  -- Minimum width for notification windows
	  minimum_width = 50,

	  -- Icons for the different levels
	  icons = {
		ERROR = "",
		WARN = "",
		INFO = "",
		DEBUG = "",
		TRACE = "✎",
	  },
	})
	vim.notify = require("notify")
	vim.notify = function(msg, log_level, _opts)
		if msg:match("exit code") then
			return
		end
		if log_level == vim.log.levels.ERROR then
			vim.api.nvim_err_writeln(msg)
		else
			vim.api.nvim_echo({{msg}}, true, {})
		end
	end
EOF
lua require("notify")("Welcome, Sexiest Man In The Universe")



" barbar.nvim setup
	" Move to previous/next
	nnoremap <silent><C-f><C-h> :BufferPrevious<CR>
	nnoremap <silent><C-f><C-l> :BufferNext<CR>
	" Re-order to previous/next
	nnoremap <silent><C-f><C-f><C-h> :BufferMovePrevious<CR>
	nnoremap <silent><C-f><C-f><C-l> :BufferMoveNext<CR>
	" Goto buffer in position...
	nnoremap <silent><C-f>1 :BufferGoto 1<CR>
	nnoremap <silent><C-f>2 :BufferGoto 2<CR>
	nnoremap <silent><C-f>3 :BufferGoto 3<CR>
	nnoremap <silent><C-f>4 :BufferGoto 4<CR>
	nnoremap <silent><C-f>5 :BufferGoto 5<CR>
	nnoremap <silent><C-f>6 :BufferGoto 6<CR>
	nnoremap <silent><C-f>7 :BufferGoto 7<CR>
	nnoremap <silent><C-f>8 :BufferGoto 8<CR>
	nnoremap <silent><C-f>9 :BufferLast<CR>
	" Pin/unpin buffer
	nnoremap <silent><C-f><C-p> :BufferPin<CR>
	" Close buffer
	nnoremap <silent><C-f><C-w> :BufferClose<CR>
	nnoremap <silent><C-f><C-q> :BufferClose!<CR>
	" Wipeout buffer
	"                          :BufferWipeout<CR>
	" Close commands
	"                          :BufferCloseAllButCurrent<CR>
	"                          :BufferCloseAllButPinned<CR>
	"                          :BufferCloseBuffersLeft<CR>
	"                          :BufferCloseBuffersRight<CR>
	" Magic buffer-picking mode
	nnoremap <silent><C-f><C-s> :BufferPick<CR>
	" Sort automatically by...
	" nnoremap <silent> <Space>bb :BufferOrderByBufferNumber<CR>
	" nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
	" nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
	" nnoremap <silent> <Space>bw :BufferOrderByWindowNumber<CR>
	" Other:
	" :BarbarEnable - enables barbar (enabled by default)
	" :BarbarDisable - very bad command, should never be used	



" feline.nvim setup
	lua require('feline').setup()



" nvim-startup.lua setup
let g:nvim_startup_file='C:/temp/nvim-startuptime'
lua << EOF
	require 'nvim-startup'.setup {
		startup_file = 'C:/temp/nvim-startuptime', -- sets startup log path (string)
	}
EOF



" dashboard-nvim setup
	let g:dashboard_default_executive = 'telescope'
	let g:dashboard_custom_header = [
	\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
	\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
	\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
	\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
	\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
	\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
	\]



" indent-blankline.nvim setup
lua << EOF
	vim.opt.list = true
	vim.opt.listchars:append("eol:↴")
	require("indent_blankline").setup {
		show_end_of_line = true,
	}
EOF
let g:indent_blankline_use_treesitter = v:true
let g:indent_blankline_filetype_exclude = ['dashboard']



" nvim-tree.lua setup
nnoremap <silent><C-n> :NvimTreeToggle<CR>
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
	require("todo-comments").setup{}
EOF



" nvim-comment-frame setup
	lua require('nvim-comment-frame').setup()



" neogen setup
	lua require('neogen').setup()



" nvim-bqf setup
	"TODO
	"lua require('nvim-bqf').setup()



" neoscroll.nvim setup
	"lua require('neoscroll').setup()



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
	call wilder#set_option('renderer', wilder#popupmenu_renderer({
		 \ 'highlighter': wilder#basic_highlighter(),
		 \ 'pumblend': 20,
		 \ 'highlights': { 'accent': wilder#make_hl('WilderAccent', 'Pmenu', [{}, {}, {'foreground': '#0D6FFF'}]), },
		 \ }))



" auto-session setup
	"lua require('auto-session').setup()



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



" nvim-web-devicons setup
lua << EOF
	require'nvim-web-devicons'.setup {
	 -- your personnal icons can go here (to override)
	 -- you can specify color or cterm_color instead of specifying both of them
	 -- DevIcon will be appended to `name`
	 --[[
	 override = {
	  zsh = {
		icon = "",
		color = "#428850",
		cterm_color = "65",
		name = "Zsh"
	  }
	 };
	 --]]
	 -- globally enable default icons (default to false)
	 -- will get overriden by `get_icons` option
	 default = true;
	}
EOF



" undotree setup
	nnoremap <F5> :UndotreeToggle<CR>



" highlight-current-n setup
	nmap n <Plug>(highlight-current-n-n)
	nmap N <Plug>(highlight-current-n-N)





" - Make LSP Errors/Warnings display differently
" - Configure all COQ stuff
" - notifications
" 	- hihglight normal thing is annoying
" 	- maybe less intrusive
" - Telescope keymappings
" - Telescope FZF Native loading doesn't work
" - Transparent Doesn't Work
" - Indent highlight thing is red?
" - VSCode colorscheme for other buffers/tabline/stuff
" - DAP stuff you skipped
" - Barbar doesn't show/work
" - Customize feline.nvim?
" - startup time only works with terminal
" - maybe delete auto session
" - weird thing where you make for loop then {|} press enter
" - undotree toggle weird 'buffer' thing below
" - autocomplete popup looks bad
" - TODO comment highlighting doesn't work
" - if transparent doesn't work, disable it for less black background
" - highlight current n highlight color change
" - disable twilight in dashboard
" - add more nvim tree keybinds to instructions
" - Neovim folds
" - filetree too wide
" - filetree doesn't move tab bar
" - linting doesn't work for js?