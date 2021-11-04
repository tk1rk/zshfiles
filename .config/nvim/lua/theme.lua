local material = require("material.colors")

local theme = {}

theme.loadSyntax = function()
  -- Syntax highlight groups

  local syntax = {
    Type = {fg = material.type}, -- int, long, char, etc.
    StorageClass = {fg = material.class or material.cyan}, -- static, register, volatile, etc.
    Structure = {fg = material.structure or material.puple}, -- struct, union, enum, etc.
    Constant = {fg = material.const or material.yellow}, -- any constant
    String = {fg = material.string or material.green, bg = material.none}, -- Any string
    Character = {fg = material.orange}, -- any character constant: 'c', '\n'
    Number = {fg = material.number or material.coral}, -- a number constant: 5
    Boolean = {fg = material.bool or material.orange, style = 'italic'}, -- a boolean constant: TRUE, false
    Float = {fg = material.float or material.number}, -- a floating point constant: 2.3e10
    Statement = {fg = material.statement or material.pink}, -- any statement
    Label = {fg = material.label or material.purple}, -- case, default, etc.
    Operator = {fg = material.operator or material.cyan}, -- sizeof", "+", "*", etc.
    Exception = {fg = material.purple2}, -- try, catch, throw
    PreProc = {fg = material.purple}, -- generic Preprocessor
    Include = {fg = material.blue}, -- preprocessor #include
    Define = {fg = material.pink}, -- preprocessor #define
    Macro = {fg = material.cyan}, -- same as Define
    Typedef = {fg = material.typedef or material.red}, -- A typedef
    PreCondit = {fg = material.paleblue}, -- preprocessor #if, #else, #endif, etc.
    Special = {fg = material.red}, -- any special symbol
    SpecialChar = {fg = material.pink}, -- special character in a constant
    Tag = {fg = material.lime}, -- you can use CTRL-] on this
    Delimiter = {fg = material.blue1}, -- character that needs attention like , or .
    SpecialComment = {fg = material.comments or material.gray}, -- special things inside a comment
    Debug = {fg = material.red}, -- debugging statements
    Underlined = {fg = material.link, bg = material.none, style = 'undercurl', sp = material.blue}, -- text that stands out, HTML links
    Ignore = {fg = material.disabled}, -- left blank, hidden
    Error = {fg = material.error, bg = material.none, style = 'bold,undercurl', sp = material.pink}, -- any erroneous construct
    Todo = {fg = material.yellow, bg = material.bg_alt or material.search_bg, style = 'bold,italic'}, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    htmlLink = {fg = material.link, style = "underline", sp = material.blue},
    htmlH1 = {fg = material.cyan, style = "bold"},
    htmlH2 = {fg = material.red, style = "bold"},
    htmlH3 = {fg = material.green, style = "bold"},
    htmlH4 = {fg = material.yellow, style = "bold"},
    htmlH5 = {fg = material.purple, style = "bold"},
    markdownH1 = {fg = material.cyan, style = "bold"},
    markdownH2 = {fg = material.red, style = "bold"},
    markdownH3 = {fg = material.green, style = "bold"},
    markdownH1Delimiter = {fg = material.cyan},
    markdownH2Delimiter = {fg = material.red},
    markdownH3Delimiter = {fg = material.green}
  }

  -- Options:

  -- Italic comments
  if vim.g.material_italic_comments == true then
    syntax.Comment = {fg = material.comments, bg = material.none, style = 'italic'} -- italic comments
  else
    syntax.Comment = {fg = material.comments} -- normal comments
  end

  -- Italic string
  if vim.g.material_italic_string == true then
    syntax.String.style = 'italic'
  end

  -- Italic Keywords
  if vim.g.material_italic_keywords == true then
    syntax.Conditional = {
      fg = material.condition or material.purple,
      bg = material.none,
      style = 'italic'
    } -- italic if, then, else, endif, switch, etc.
    syntax.Keyword = {
      fg = material.keyword or material.purple,
      bg = material.none,
      style = 'italic'
    } -- italic for, do, while, etc.
    syntax.Repeat = {
      fg = material.condition or material.purple,
      bg = material.none,
      style = 'italic'
    } -- italic any other keyword
  else
    syntax.Conditional = {fg = material.condition or material.purple} -- normal if, then, else, endif, switch, etc.
    syntax.Keyword = {fg = material.keyword or material.purple} -- normal for, do, while, etc.
    syntax.Repeat = {fg = material.purple} -- normal any other keyword
  end

  -- Italic Function names
  if vim.g.material_italic_functions == true then
    syntax.Function = {
      fg = material.func or material.blue,
      bg = material.none,
      style = 'italic,bold'
    } -- italic funtion names
  else
    syntax.Function = {fg = material.func or material.blue, style = 'bold'} -- normal function names
  end

  if vim.g.material_italic_variables == true then
    syntax.Identifier = {fg = material.variable, bg = material.none, style = 'italic'}; -- any variable name
  else
    syntax.Identifier = {fg = material.variable}; -- any variable name
  end

  return syntax

end

theme.loadEditor = function()
  -- Editor highlight groups

  local editor = {
    NormalFloat = {fg = material.fg, bg = material.floating}, -- normal text and background color for floating windows
    FloatBorder = {fg = material.comments, bg = material.less_active},
    FloatShadow = {bg = material.black, blend = 36},
    FloatShadowThrough = {bg = material.black, blend = 66},
    ColorColumn = {fg = material.none, bg = material.active}, --  used for the columns set with 'colorcolumn'
    Conceal = {fg = material.disabled}, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor = {fg = material.cursor, bg = material.none, style = 'reverse'}, -- the character under the cursor
    CursorIM = {fg = material.cursor, bg = material.none, style = 'reverse'}, -- like Cursor, but used when in IME mode
    Directory = {fg = material.directory or material.blue, bg = material.none}, -- directory names (and other special names in listings)
    DiffAdd = {fg = material.green, bg = material.none, style = 'undercurl', sp = material.active}, -- diff mode: Added line
    DiffChange = {
      fg = material.orange,
      bg = material.none,
      style = 'undercurl,reverse',
      sp = material.red
    }, --  diff mode: Changed line
    DiffDelete = {fg = material.red, bg = material.none, style = 'reverse'}, -- diff mode: Deleted line
    DiffText = {fg = material.yellow, bg = material.none, style = 'reverse'}, -- diff mode: Changed text within a changed line
    EndOfBuffer = {fg = material.disabled}, -- ~ lines at the end of a buffer
    ErrorMsg = {fg = material.error}, -- error messages
    Folded = {fg = material.link, bg = material.none, style = 'bold'},
    FoldColumn = {fg = material.blue},
    IncSearch = {fg = material.white, bg = material.highlight, style = 'bold,reverse'},
    LineNr = {fg = material.line_numbers},
    CursorLineNr = {fg = material.accent},
    MatchParen = {
      fg = material.yellow,
      bg = material.active or material.none,
      style = 'bold,underline'
    },
    ModeMsg = {fg = material.accent},
    MoreMsg = {fg = material.accent},
    NonText = {fg = material.disabled},
    Pmenu = {fg = material.text, bg = material.contrast},
    PmenuSel = {
      fg = material.accent,
      bg = material.more_active or material.active,
      style = 'bold,italic'
    },
    PmenuSbar = {fg = material.text, bg = material.contrast},
    PmenuThumb = {fg = material.fg, bg = material.accent},
    Question = {fg = material.green},
    QuickFixLine = {fg = material.highlight, bg = material.white, style = 'reverse'},
    qfLineNr = {fg = material.highlight, bg = material.white, style = 'reverse'},
    Search = {
      fg = material.search_fg or material.highlight,
      bg = material.search_bg or material.yellow,
      style = 'reverse'
    },
    SpecialKey = {fg = material.purple},
    SpellBad = {fg = material.orange, bg = material.none, style = 'undercurl', sp = material.red},
    SpellCap = {fg = material.blue, bg = material.none, style = 'undercurl', sp = material.violet},
    SpellLocal = {fg = material.cyan, bg = material.none, style = 'undercurl'},
    SpellRare = {
      fg = material.purple,
      bg = material.none,
      style = 'undercurl',
      sp = material.darkred
    },
    StatusLine = {fg = material.accent, bg = material.active},
    StatusLineNC = {fg = material.text, bg = material.less_active},
    StatusLineTerm = {fg = material.fg, bg = material.active},
    StatusLineTermNC = {fg = material.text, bg = material.less_active},
    TabLineFill = {fg = material.fg},
    TablineSel = {fg = material.bg, bg = material.accent},
    Tabline = {fg = material.fg},
    Title = {fg = material.title, bg = material.none, style = 'bold'},
    Visual = {fg = material.none, bg = material.selection},
    VisualNOS = {fg = material.none, bg = material.selection},
    WarningMsg = {fg = material.yellow},
    WildMenu = {fg = material.orange, bg = material.none, style = 'bold'},
    CursorColumn = {fg = material.none, bg = material.active},
    CursorLine = {fg = material.none, bg = material.active},
    ToolbarLine = {fg = material.fg, bg = material.bg_alt},
    ToolbarButton = {fg = material.fg, bg = material.none, style = 'bold'},
    NormalMode = {fg = material.accent, bg = material.bg, style = 'reverse'},
    InsertMode = {fg = material.green, bg = material.none, style = 'reverse'},
    ReplacelMode = {fg = material.red, bg = material.none, style = 'reverse'},
    VisualMode = {fg = material.purple, bg = material.none, style = 'reverse'},
    CommandMode = {fg = material.gray, bg = material.none, style = 'reverse'},
    Warnings = {fg = material.yellow},

    healthError = {fg = material.error},
    healthSuccess = {fg = material.green},
    healthWarning = {fg = material.yellow},

    -- Dashboard
    DashboardShortCut = {fg = material.red},
    DashboardHeader = {fg = material.comments},
    DashboardCenter = {fg = material.accent},
    DashboardFooter = {fg = material.green, style = "italic"}

  }

  -- Options:

  -- Set transparent background
  if vim.g.material_disable_background == true then
    editor.Normal = {fg = material.fg, bg = material.none} -- normal text and background color
    editor.SignColumn = {fg = material.fg, bg = material.none}
  else
    editor.Normal = {fg = material.fg, bg = material.bg} -- normal text and background color
    editor.SignColumn = {fg = material.fg, bg = material.bg}
  end

  -- Remove window split borders
  if vim.g.material_borders == true then
    editor.VertSplit = {fg = material.border} -- the column separating vertically split windows
  else
    editor.VertSplit = {fg = material.bg} -- the column separating vertically split windows
  end

  -- Set End of Buffer lines (~)
  if vim.g.material_hide_eob == true then
    editor.EndOfBuffer = {fg = material.bg} -- ~ lines at the end of a buffer
  else
    editor.EndOfBuffer = {fg = material.disabled} -- ~ lines at the end of a buffer
  end

  return editor
end

theme.loadTerminal = function()

  vim.g.terminal_color_0 = material.black
  vim.g.terminal_color_1 = material.red
  vim.g.terminal_color_2 = material.green
  vim.g.terminal_color_3 = material.yellow
  vim.g.terminal_color_4 = material.blue
  vim.g.terminal_color_5 = material.purple
  vim.g.terminal_color_6 = material.cyan
  vim.g.terminal_color_7 = material.white
  vim.g.terminal_color_8 = material.gray
  vim.g.terminal_color_9 = material.red
  vim.g.terminal_color_10 = material.green
  vim.g.terminal_color_11 = material.yellow
  vim.g.terminal_color_12 = material.blue
  vim.g.terminal_color_13 = material.purple
  vim.g.terminal_color_14 = material.cyan
  vim.g.terminal_color_15 = material.white

end

theme.loadTreeSitter = function()
  -- TreeSitter highlight groups

  local treesitter = {
    TSAnnotation = {fg = material.red}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    TSAttribute = {fg = material.yellow}, -- (unstable) TODO: docs
    TSBoolean = {fg = material.bool or material.coral, style = 'italic'}, -- For booleans.
    TSCharacter = {fg = material.char or material.orange}, -- For characters.
    TSConstructor = {fg = material.purple}, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
    TSConstant = {fg = material.const or material.yellow}, -- For constants
    TSConstBuiltin = {fg = material.const or material.red}, -- For constant that are built in the language: `nil` in Lua.
    TSConstMacro = {fg = material.red}, -- For constants that are defined by macros: `NULL` in C.
    TSError = {fg = material.error}, -- For syntax/parser errors.
    TSException = {fg = material.red3}, -- For exception related keywords.
    TSField = {fg = material.variable or material.blue1}, -- For fields.
    TSFloat = {fg = material.float or material.red}, -- For floats.
    TSFuncMacro = {fg = material.blue}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    TSInclude = {fg = material.cyan}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.

    TSDefinitionUsage = {
      fg = material.accent or material.salmon,
      style = 'bold,undercurl',
      sp = 'white'
    }, -- used for highlighting "read" references

    TSDefinition = {fg = material.keyword or "yellow", style = 'bold,undercurl', sp = 'red'}, -- used for highlighting "write" references
    TSLabel = {fg = material.green1}, -- For labels: `label:` in C and `:label:` in Lua.
    TSNamespace = {fg = material.yellow1}, -- For identifiers referring to modules and namespaces.
    TSNumber = {fg = material.number or material.yellow2}, -- For all numbers
    TSOperator = {fg = material.operator or material.cyan}, -- For any operator: `+`, but also `->` and `*` in C.
    TSParameter = {fg = material.parameter or material.blue2}, -- For parameters of a function.
    TSParameterReference = {fg = material.paleblue}, -- For references to parameters of a function.
    TSProperty = {fg = material.field or material.blue1}, -- Same as `TSField`.
    TSPunctDelimiter = {fg = material.cyan}, -- For delimiters ie: `.`
    TSPunctBracket = {fg = material.bracket or material.pink2}, -- For brackets and parens.
    TSPunctSpecial = {fg = material.punctutation or material.purple1}, -- For special punctutation that does not fall in the catagories before.
    TSString = {fg = material.string or material.green}, -- For strings.
    TSStringRegex = {fg = material.pink2}, -- For regexes.
    TSStringEscape = {fg = material.disabled}, -- For escape characters within a string.
    TSSymbol = {fg = material.symbol or material.yellow}, -- For identifiers referring to symbols or atoms.
    TSType = {fg = material.type}, -- For types.
    TSTypeBuiltin = {fg = material.purple1, style = 'bold'}, -- For builtin types.
    TSTag = {fg = material.red1}, -- Tags like html tag names.
    TSTagDelimiter = {fg = material.yellow2}, -- Tag delimiter like `<` `>` `/`
    TSText = {fg = material.text}, -- For strings considered text in a markup language.
    TSTextReference = {fg = material.bg_alt}, -- FIXME
    TSEmphasis = {fg = material.paleblue}, -- For text to be represented with emphasis.
    TSUnderline = {fg = material.fg, bg = material.none, style = 'underline'}, -- For text to be represented with an underline.
    TSStrike = {fg = material.gray}, -- For strikethrough text.
    TSCurrentScope = {bg = material.less_active or material.active},
    TSTitle = {fg = material.title, bg = material.none, style = 'bold'}, -- Text that is part of a title.
    TSLiteral = {fg = material.fg}, -- Literal text.
    TSURI = {fg = material.link} -- Any URI like a link or email.
    -- TSNone =                    { },    -- TODO: docs
  }

  -- Options:

  -- Italic comments
  if vim.g.material_italic_comments == true then
    treesitter.TSComment = {fg = material.comments, bg = material.none, style = 'italic'} -- For comment blocks.
  else
    treesitter.TSComment = {fg = material.comments} -- For comment blocks.
  end

  if vim.g.material_italic_keywords == true then
    treesitter.TSConditional = {fg = material.condition or material.purple, style = 'italic'} -- For keywords related to conditionnals.
    treesitter.TSKeyword = {fg = material.keyword or material.purple, style = 'italic,bold'} -- For keywords that don't fall in previous categories.
    treesitter.TSRepeat = {fg = material.condition or material.purple, style = 'italic,bold'} -- For keywords related to loops.
    treesitter.TSKeywordFunction = {
      fg = material.keyword_func or material.keyword or material.purple,
      style = 'italic,bold'
    } -- For keywords used to define a fuction.
  else
    treesitter.TSConditional = {fg = material.condition or material.purple} -- For keywords related to conditionnals.
    treesitter.TSKeyword = {fg = material.keyword or material.purple, style = 'bold'} -- For keywords that don't fall in previous categories.
    treesitter.TSRepeat = {fg = material.condition or material.purple, style = 'bold'} -- For keywords related to loops.
    treesitter.TSKeywordFunction = {
      fg = material.keyword_func or material.keyword or material.purple,
      style = 'bold'
    } -- For keywords used to define a fuction.
  end

  if vim.g.material_italic_functions == true then
    treesitter.TSFunction = {fg = material.func or material.blue, style = 'italic,bold'} -- For fuction (calls and definitions).
    treesitter.TSMethod = {
      fg = material.method or material.func or material.blue,
      style = 'italic,bold'
    } -- For method calls and definitions.
    treesitter.TSFuncBuiltin = {fg = material.func or material.cyan, style = 'italic,bold'} -- For builtin functions: `table.insert` in Lua.
  else
    treesitter.TSFunction = {fg = material.func or material.blue, style = 'bold'} -- For fuction (calls and definitions).
    treesitter.TSMethod = {fg = material.method or material.blue, style = 'bold'} -- For method calls and definitions.
    treesitter.TSFuncBuiltin = {fg = material.func or material.cyan, style = 'bold'} -- For builtin functions: `table.insert` in Lua.
  end

  if vim.g.material_italic_variables == true then
    treesitter.TSVariable = {fg = material.variable, style = 'italic'} -- Any variable name that does not have another highlight.
    treesitter.TSVariableBuiltin = {fg = material.variable, style = 'italic'} -- Variable names that are defined by the languages, like `this` or `self`.
  else
    treesitter.TSVariable = {fg = material.variable} -- Any variable name that does not have another highlight.
    treesitter.TSVariableBuiltin = {fg = material.variable} -- Variable names that are defined by the languages, like `this` or `self`.
  end

  if vim.g.material_italic_strings == true then
    treesitter.TSString.style = 'italic' -- For strings.
  end

  return treesitter

end

theme.loadLSP = function()
  -- Lsp highlight groups

  local lsp = {
    DiagnosticError = {fg = material.error}, -- used for "Error" diagnostic virtual text
    DiagnosticSignError = {fg = material.error}, -- used for "Error" diagnostic signs in sign column
    DiagnosticFloatingError = {fg = material.error}, -- used for "Error" diagnostic messages in the diagnostics float
    DiagnosticVirtualTextError = {fg = material.error}, -- Virtual text "Error"
    DiagnosticUnderlineError = {style = 'undercurl', sp = material.error}, -- used to underline "Error" diagnostics.
    DiagnosticWarn = {fg = material.yellow}, -- used for "Warning" diagnostic signs in sign column
    DiagnosticSignWarn = {fg = material.yellow}, -- used for "Warning" diagnostic signs in sign column
    DiagnosticFloatingWarn = {fg = material.yellow}, -- used for "Warning" diagnostic messages in the diagnostics float
    DiagnosticVirtualTextWarn = {fg = material.yellow}, -- Virtual text "Warning"
    DiagnosticUnderlineWarn = {style = 'undercurl', sp = material.yellow}, -- used to underline "Warning" diagnostics.
    DiagnosticInfo = {fg = material.paleblue}, -- used for "Information" diagnostic virtual text
    DiagnosticSignInfo = {fg = material.paleblue}, -- used for "Information" diagnostic signs in sign column
    DiagnosticFloatingInfo = {fg = material.paleblue}, -- used for "Information" diagnostic messages in the diagnostics float
    DiagnosticVirtualTextInfo = {fg = material.paleblue}, -- Virtual text "Information"
    DiagnosticUnderlineInfo = {style = 'undercurl', sp = material.paleblue}, -- used to underline "Information" diagnostics.
    DiagnosticDefaultHint = {fg = material.link}, -- used for "Hint" diagnostic virtual text
    DiagnosticSignHint = {fg = material.link}, -- used for "Hint" diagnostic signs in sign column
    DiagnosticUnderlineHint = {style = 'undercurl', sp = material.paleblue}, -- used to underline "Hint" diagnostics.

    LspDiagnosticsDefaultError = {fg = material.error}, -- used for "Error" diagnostic virtual text
    LspDiagnosticsSignError = {fg = material.error}, -- used for "Error" diagnostic signs in sign column
    LspDiagnosticsFloatingError = {fg = material.error}, -- used for "Error" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextError = {fg = material.error}, -- Virtual text "Error"
    LspDiagnosticsUnderlineError = {style = 'undercurl', sp = material.error}, -- used to underline "Error" diagnostics.
    LspDiagnosticsDefaultWarning = {fg = material.yellow}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsSignWarning = {fg = material.yellow}, -- used for "Warning" diagnostic signs in sign column
    LspDiagnosticsFloatingWarning = {fg = material.yellow}, -- used for "Warning" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextWarning = {fg = material.yellow}, -- Virtual text "Warning"
    LspDiagnosticsUnderlineWarning = {style = 'undercurl', sp = material.yellow}, -- used to underline "Warning" diagnostics.
    LspDiagnosticsDefaultInformation = {fg = material.paleblue}, -- used for "Information" diagnostic virtual text
    LspDiagnosticsSignInformation = {fg = material.paleblue}, -- used for "Information" diagnostic signs in sign column
    LspDiagnosticsFloatingInformation = {fg = material.paleblue}, -- used for "Information" diagnostic messages in the diagnostics float
    LspDiagnosticsVirtualTextInformation = {fg = material.paleblue}, -- Virtual text "Information"
    LspDiagnosticsUnderlineInformation = {style = 'undercurl', sp = material.paleblue}, -- used to underline "Information" diagnostics.
    LspDiagnosticsDefaultHint = {fg = material.link}, -- used for "Hint" diagnostic virtual text
    LspDiagnosticsSignHint = {fg = material.link}, -- used for "Hint" diagnostic signs in sign column
    LspDiagnosticsUnderlineHint = {style = 'undercurl', sp = material.paleblue}, -- used to underline "Hint" diagnostics.
    LspReferenceText = {style = 'bold,italic,undercurl', sp = 'yellow'}, -- used for highlighting "text" references
    LspReferenceRead = {
      -- fg = material.accent or material.salmon,
      style = 'bold,italic,undercurl',
      sp = 'lime'
    }, -- used for highlighting "read" references
    LspReferenceWrite = {
      fg = material.keyword or "yellow",
      bg = material.highlight,
      style = 'bold,italic,undercurl',
      sp = 'red2'
    }, -- used for highlighting "write" references
    LspSignatureActiveParameter = {
      fg = material.search_fg or material.yellow,
      bg = material.search_bg or material.highlight,
      style = 'bold,italic,undercurl',
      sp = 'violet'
    }
  }

  return lsp

end

theme.loadPlugins = function()
  -- Plugins highlight groups

  local plugins = {

    -- LspTrouble
    LspTroubleText = {fg = material.text},
    LspTroubleCount = {fg = material.purple, bg = material.active},
    LspTroubleNormal = {fg = material.fg, bg = material.sidebar},

    -- Nvim-Compe
    CompeDocumentation = {fg = material.text, bg = material.contrast},

    -- Diff
    diffAdded = {fg = material.green},
    diffRemoved = {fg = material.red},
    diffChanged = {fg = material.blue},
    diffOldFile = {fg = material.text},
    diffNewFile = {fg = material.title},
    diffFile = {fg = material.gray},
    diffLine = {fg = material.cyan},
    diffIndexLine = {fg = material.purple},

    -- Neogit
    NeogitBranch = {fg = material.paleblue},
    NeogitRemote = {fg = material.purple},
    NeogitHunkHeader = {fg = material.fg, bg = material.highlight},
    NeogitHunkHeaderHighlight = {fg = material.blue, bg = material.contrast},
    NeogitDiffContextHighlight = {fg = material.text, bg = material.contrast},
    NeogitDiffDeleteHighlight = {fg = material.red},
    NeogitDiffAddHighlight = {fg = material.green},

    -- GitGutter
    GitGutterAdd = {fg = material.green}, -- diff mode: Added line |diff.txt|
    GitGutterChange = {fg = material.blue}, -- diff mode: Changed line |diff.txt|
    GitGutterDelete = {fg = material.red}, -- diff mode: Deleted line |diff.txt|

    -- GitSigns
    GitSignsAdd = {fg = material.green}, -- diff mode: Added line |diff.txt|
    GitSignsAddNr = {fg = material.green}, -- diff mode: Added line |diff.txt|
    GitSignsAddLn = {fg = material.green}, -- diff mode: Added line |diff.txt|
    GitSignsChange = {fg = material.blue}, -- diff mode: Changed line |diff.txt|
    GitSignsChangeNr = {fg = material.blue}, -- diff mode: Changed line |diff.txt|
    GitSignsChangeLn = {fg = material.blue}, -- diff mode: Changed line |diff.txt|
    GitSignsDelete = {fg = material.red}, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteNr = {fg = material.red}, -- diff mode: Deleted line |diff.txt|
    GitSignsDeleteLn = {fg = material.red}, -- diff mode: Deleted line |diff.txt|

    -- Telescope
    TelescopeNormal = {fg = material.fg, bg = material.bg},
    TelescopePromptBorder = {fg = material.cyan},
    TelescopeResultsBorder = {fg = material.purple},
    TelescopePreviewBorder = {fg = material.green},
    TelescopeSelectionCaret = {fg = material.purple},
    TelescopeSelection = {fg = material.purple, bg = material.active},
    TelescopeMatching = {fg = material.cyan},

    -- NvimTree
    NvimTreeRootFolder = {fg = material.title, style = "italic"},
    NvimTreeFolderName = {fg = material.text},
    NvimTreeFolderIcon = {fg = material.accent},
    NvimTreeEmptyFolderName = {fg = material.disabled},
    NvimTreeOpenedFolderName = {fg = material.accent, style = "italic"},
    NvimTreeIndentMarker = {fg = material.disabled},
    NvimTreeGitDirty = {fg = material.blue},
    NvimTreeGitNew = {fg = material.lime},
    NvimTreeGitStaged = {fg = material.comments},
    NvimTreeGitDeleted = {fg = material.red},
    NvimTreeOpenedFile = {fg = material.accent},
    NvimTreeImageFile = {fg = material.yellow},
    NvimTreeMarkdownFile = {fg = material.pink},
    NvimTreeExecFile = {fg = material.green},
    NvimTreeSpecialFile = {fg = material.purple, style = "underline"},
    LspDiagnosticsError = {fg = material.error},
    LspDiagnosticsWarning = {fg = material.yellow},
    LspDiagnosticsInformation = {fg = material.paleblue},
    LspDiagnosticsHint = {fg = material.purple},

    -- WhichKey
    WhichKey = {fg = material.accent, style = 'bold'},
    WhichKeyGroup = {fg = material.text},
    WhichKeyDesc = {fg = material.blue, style = 'italic'},
    WhichKeySeperator = {fg = material.fg},
    WhichKeyFloating = {bg = material.floating},
    WhichKeyFloat = {bg = material.floating},

    -- LspSaga
    DiagnosticError = {fg = material.error},
    DiagnosticWarning = {fg = material.yellow},
    DiagnosticInformation = {fg = material.paleblue},
    DiagnosticHint = {fg = material.purple},
    DiagnosticTruncateLine = {fg = material.fg},
    LspFloatWinNormal = {bg = material.contrast},
    LspFloatWinBorder = {fg = material.purple},
    LspSagaBorderTitle = {fg = material.cyan},
    LspSagaHoverBorder = {fg = material.paleblue},
    LspSagaRenameBorder = {fg = material.green},
    LspSagaDefPreviewBorder = {fg = material.green},
    LspSagaCodeActionBorder = {fg = material.blue},
    LspSagaFinderSelection = {fg = material.green},
    LspSagaCodeActionTitle = {fg = material.paleblue},
    LspSagaCodeActionContent = {fg = material.purple},
    LspSagaSignatureHelpBorder = {fg = material.pink},
    ReferencesCount = {fg = material.purple},
    DefinitionCount = {fg = material.purple},
    DefinitionIcon = {fg = material.blue},
    ReferencesIcon = {fg = material.blue},
    TargetWord = {fg = material.cyan},

    -- BufferLine
    BufferLineIndicatorSelected = {fg = material.accent},
    BufferLineFill = {bg = material.bg_alt},

    -- Sneak
    Sneak = {fg = material.bg, bg = material.accent},
    SneakScope = {bg = material.selection},

    -- Indent Blankline
    IndentBlanklineChar = {fg = material.highlight},
    IndentBlanklineContextChar = {fg = material.func or material.sky, style = 'bold'},

    -- Nvim dap
    DapBreakpoint = {fg = material.red},
    DapStopped = {fg = material.green},

    -- Hop
    HopNextKey = {fg = material.accent, style = 'bold'},
    HopNextKey1 = {fg = material.purple, style = 'bold'},
    HopNextKey2 = {fg = material.blue},
    HopUnmatched = {fg = material.comments},

    -- Fern
    FernBranchText = {fg = material.blue}
  }

  -- Options:

  -- Disable nvim-tree background
  if vim.g.material_disable_background == true then
    plugins.NvimTreeNormal = {fg = material.fg, bg = material.none}
  else
    plugins.NvimTreeNormal = {fg = material.fg, bg = material.sidebar}
  end

  return plugins

end

return theme
