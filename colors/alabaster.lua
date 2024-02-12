vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "alabaster"

local theme
---@diagnostic disable: undefined-global
if vim.o.background == "dark" then
	local bg = "#000022"
	local punct_fg = "#708b8d"
	local white = "#ffffff"
	local fg = "#ffffcc"
	local type_fg = "#00ff33"
	local def_fg = fg
	local const_fg = "#cc8bc9"
	local active = "#cd974b"
	local string_fg = "#aaaa00"
	local darker_fg = "#7d7d7d"
	local diffadd = "#6abf40"
	local diffdelete = "#d2322d"
	local diffchange = "#ec8013"
	local statusline = "#162022"
	local comment = "#888888"
	local dim_comment = "#666666"
	local mistake = {
		fg = "#c33c33",
		bg = "#2b1d1e",
	}
	local error = "#c55ccc"
	local warn = "#f4b371"
	local hint = "#8ebeec"
	local info = "#88cc66"
	local ansi = {
		black = "#333333",
		blue = "#71aed7",
		brightyellow = "#dfdf8e",
		cyan = "#47bea9",
		green = "#00ff00",
		magenta = "#cc8bc9",
		red = "#c33c33",
		white = "#ffffff",
		yellow = "#cd974b",
	}

	visual_bg = "#cccccc"
	visual_bg = "#000000"
	local comment_fg = vim.g.alabaster_dim_comments and dim_comment or comment
	local pmenu_bg = bg
	local float_bg = vim.g.alabaster_floatborder and bg or pmenu_bg
	local floatborder = { bg = bg, fg = "#333333" }
	theme = {
		cBlock = { fg = ansi.green, bold = 1 },
		Comment = { fg = comment_fg },
		SpecialComment = { fg = comment_fg },
		ColorColumn = { bg = "#000044" },
		Conceal = { fg = "#b0b0b0" },
		Cursor = { bg = active, fg = "#000000" },
		-- lCursor      { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
		-- CursorIM     { }, -- like Cursor, but used when in IME mode |CursorIM|
		CursorColumn = { fg = fg, bg = "#E2EEEE" },
		CursorLine = { bg = "#182325" },
		Directory = { fg = ansi.blue },
		DiffAdd = { bg = "#244032", fg = "#56d364" },
		DiffDelete = { bg = "#462c32", fg = "#f85149" },
		DiffText = { fg = "#341a00", bg = "#fff987" },
		DiffChange = { bg = "#341a00", fg = "#e3b341" },
		EndOfBuffer = { fg = "#354c50" },
		-- TermCursor   { }, -- cursor in a focused terminal
		TermCursorNC = { fg = bg, bg = fg },
		ErrorMsg = { fg = error, bg = mistake.bg },
		VertSplit = { fg = "#2b3d40" },
		Folded = { bg = "#182325", fg = "#7d7d7d" },
		FoldColumn = { bg = bg, fg = "#4d4d4d" },
		SignColumn = {},
		IncSearch = { bg = ansi.yellow, fg = bg },
		-- Substitute   { }, -- |:substitute| replacement text highlighting
		LineNr = { fg = "#5c5c5c" },
		CursorLineNr = { fg = ansi.blue, bold = 1 },
		MatchParen = { underline = 1, sp = active },
		-- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea      { }, -- Area for messages and cmdline
		-- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg = { fg = ansi.green, bold = 1 },
		NonText = { fg = "#696969" },
		Normal = { bg = bg, fg = fg },
		NormalFloat = { bg = float_bg },
		-- NormalNC     { }, -- normal text in non-current windows
		FloatBorder = floatborder,
		Pmenu = { bg = pmenu_bg },
		PmenuSel = { bg = "#354c50" },
		PmenuSbar = { bg = "#212f31" },
		PmenuThumb = { bg = "#47666b" },
		Question = { fg = diffadd },
		QuickFixLine = { bg = "#182325" },
		Search = { bg = "#354c50" },
		SpecialKey = { fg = ansi.cyan },
		SpellBad = { undercurl = 1, sp = ansi.red },
		SpellCap = { undercurl = 1, sp = ansi.blue },
		SpellLocal = { undercurl = 1, sp = ansi.cyan },
		SpellRare = { undercurl = 1, sp = ansi.magenta },
		StatusLine = { bg = statusline, fg = fg },
		StatusLineNC = { bg = statusline, fg = "#9f9f9f" },
		TabLine = { bg = statusline, fg = "#7d7d7d" },
		TabLineFill = { bg = statusline },
		TabLineSel = { bg = statusline, fg = ansi.blue },
		Title = { fg = const_fg },
		Visual = { fg = visual_fg, bg = visual_bg },
		VisualNOS = { bg = visual_bg },
		WarningMsg = { fg = "#e1ad4c" },
		WildMenu = { bg = "#354c50" },
		WinBar = { bg = bg, fg = ansi.white, bold = true },
		WinBarNC = { bg = bg, fg = "#7d7d7d" },

		--- SYNTAX I: TS groups link to these
		Constant = { fg = const_fg },
		String = { fg = string_fg },
		Character = { fg = const_fg },
		Number = { fg = const_fg },
		Boolean = { fg = const_fg },
		Float = { fg = const_fg },
		Operator = { fg = punct_fg },

		--- SYNTAX II: TS groups have their own definition, the below are defined to have somewhat working hl w/o treesitter
		Identifier = { fg = fg },
		Function = { fg = def_fg },
		Statement = { fg = ansi.green, bold = 1 },
		Conditional = { fg = ansi.green, bold = 1 },
		Repeat = { fg = ansi.green, bold = 1 },
		Label = { fg = ansi.green },
		Keyword = { fg = ansi.green },
		Exception = { fg = ansi.white },
		PreProc = { fg = ansi.white },
		Include = { fg = ansi.white },
		Define = { fg = ansi.white },
		Macro = { fg = white },
		PreCondit = { fg = ansi.white },
		Type = { fg = type_fg },
		StorageClass = { fg = ansi.white },
		Structure = Type,
		Typedef = { fg = def_fg },

		Special = { fg = ansi.yellow },
		-- TODO better color than diffchange, try reddish
		-- SpecialChar = { fg = diffchange }, --  special character in a constant
		-- Tag            { }, --    you can use CTRL-] on this
		-- Delimiter      { },
		debugPc = { bg = "#0f2534" },
		debugBreakpoint = { bg = "#b33229" },
		helpHyperTextJump = { fg = ansi.magenta },
		helpSectionDelim = { fg = ansi.magenta },
		helpExample = { fg = ansi.cyan },
		helpCommand = { fg = ansi.cyan },
		helpHeadline = { fg = ansi.blue },
		helpHeader = { fg = ansi.magenta },

		Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
		Italic = { italic = 1 },

		-- ("Ignore", below, may be invisible...)
		-- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

		Error = { bg = mistake.bg, fg = error },

		Todo = { bg = "#d0d058", fg = bg },

		--- Diagnostic
		LspReferenceText = { bg = "#253437" },
		LspReferenceRead = { bg = "#253437" },
		LspReferenceWrite = { bg = "#253437", underline = 1, sp = active },
		LspCodeLens = { fg = "#5c5c5c" },
		LspCodeLensSeparator = { fg = "#5c5c5c" },

		--- Diagnostic
		DiagnosticError = { fg = error },
		DiagnosticWarn = { fg = warn },
		DiagnosticHint = { fg = hint },
		DiagnosticInfo = { fg = info },
		DiagnosticVirtualTextError = { bg = "#350B0B", fg = "#D1503A" },
		DiagnosticVirtualTextWarn = { bg = "#3F240A", fg = "#C8935D" },
		DiagnosticVirtualTextHint = { bg = "#1D2B37", fg = "#7E9CB9" },
		DiagnosticVirtualTextInfo = { bg = "#162C0B", fg = "#7BAC62" },

		--- Gitsigns
		GitSignsAdd = { fg = diffadd },
		GitSignsChange = { fg = diffchange },
		GitSignsDelete = { fg = diffdelete },
		--- Telescope
		TelescopeBorder = { fg = "#2b3d40" },
		TelescopeMatching = { fg = "#f09942" },
		TelescopeMultiSelection = { fg = ansi.magenta },
		TelescopePromptPrefix = { fg = ansi.blue },
		TelescopeSelectionCaret = { fg = mistake.fg },
		TelescopeTitle = { fg = ansi.brightyellow },
		TelescopeResultsTitle = { fg = ansi.yellow },
		--- Startify
		StartifyBracket = { fg = darker_fg },
		StartifyFile = { fg = ansi.white },
		StartifySection = { fg = ansi.green },
		StartifySlash = { fg = "#4e6e75" },
		StartifyPath = { fg = "#4e6e75" },
		--- checkhealth
		healthSuccess = { fg = ansi.green, bg = bg },
		--- cmp
		CmpItemMenuDefault = { fg = ansi.magenta },
		-- Languages
		--- asm
		asmDirective = { fg = def_fg },
		nasmLabel = { link = "AlabasterDefinition" },
	}
else
	-- colors
	local bg = "#cccccc"
	local fg = "#000000"
	local active = "#ffbc5d"
	local comment = "#555555"
	local mistake = {
		fg = "#c33c33",
		bg = "#f8b28f",
	}
	theme = {
		Normal = { bg = bg, fg = fg },
		MatchParen = { underline = 1, sp = active },
		Comment = { fg = comment },
		ColorColumn = { bg = "#ffffff" },
		Conceal = { fg = "#b0b0b0" },
		Cursor = { bg = "#007acc", fg = "#bfdbfe" },
		cBlock = { bold = 1 },
		WinBar = { bold = true },
		Conditional = { bold = 1 },
		Repeat = { bold = 1 },
		Keyword = { bold = 1 },
		MoreMsg = { bold = 1 },
		CursorLineNr = { bold = 1 },
		Visual = { bg = "#bfdbfe" },
		CursorColumn = { fg = fg, bg = "#E2EEEE" },
		CursorLine = { bg = "#E2EEEE" },
		Todo = { bg = "#FFDEAA" },
		LineNr = { fg = "#7d7c7c" },
		DiffAdd = { bg = "#ADFFB7", fg = "#0A7816" },
		DiffDelete = { bg = "#F8B28F", fg = "#872C28" },
		DiffText = { fg = "#fff987", bg = "#876004" },
		DiffChange = { bg = "#fff987", fg = "#341a00" },
		Underlined = { underline = 1 }, -- (preferred) text that stands out, HTML links
		Italic = { italic = 1 },
		Error = { bg = mistake.bg, fg = mistake.fg },
		TermCursorNC = { fg = bg, bg = fg },
		IncSearch = { bg = active, fg = fg },
		NormalFloat = { bg = float_bg },
	}
end

-- hlmap

for k, v in pairs(theme) do
	vim.api.nvim_set_hl(0, k, v)
end

-- vi:nowrap
