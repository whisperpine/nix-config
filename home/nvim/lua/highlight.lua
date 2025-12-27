-- This file customizes highlight groups.
-- For color themes, refer to "./chadrc.lua".

local hl = vim.api.nvim_set_hl

-- Common --
hl(0, "DiagnosticUnnecessary", { link = "" })
hl(0, "DiagnosticUnderlineHint", { underdotted = true })
hl(0, "DiagnosticUnderlineWarn", { underdotted = true })
hl(0, "DiagnosticUnnecessary", { underdotted = true })
hl(0, "DiagnosticUnderlineError", { bg = "#cc6666", foreground = "#202020" })

-- Lua --
hl(0, "@lsp.type.variable.lua", { link = "" })
hl(0, "@lsp.mod.global.lua", { link = "@module" })
hl(0, "@lsp.type.function.lua", { link = "@function" })
hl(0, "@lsp.typemod.function.defaultLibrary.lua", { link = "@function.builtin" })

-- Python --
hl(0, "@lsp.type.variable.python", { link = "" })
hl(0, "@lsp.type.class.python", { link = "" })

-- TypeScript ---

hl(0, "@lsp.type.class.typescript", { link = "" })
hl(0, "@lsp.type.variable.typescript", { link = "" })
hl(0, "@lsp.typemod.property.static.typescript", { link = "@constant" })

-- Rust --
hl(0, "@lsp.type.keyword.rust", { link = "" })
hl(0, "@lsp.type.decorator.rust", { link = "" })
hl(0, "@lsp.type.punctuation.rust", { link = "@punctuation" })
hl(0, "@lsp.type.builtinAttribute.rust", { link = "@function.builtin" }) -- e.g. #[cfg_attr(..)]
hl(0, "@lsp.typemod.keyword.injected.rust", { link = "@keyword" }) -- keyword in comments
hl(0, "@lsp.typemod.const.injected.rust", { link = "@variable" }) -- code blocks in comments
hl(0, "@lsp.typemod.parameter.mutable.rust", { underline = true }) -- e.g. (mut var, ...)
hl(0, "@lsp.typemod.method.mutable.rust", { underline = true }) -- e.g. fn (&mut self, ...)
hl(0, "@lsp.typemod.variable.mutable.rust", { underline = true }) -- mut var, &mut var
hl(0, "@lsp.typemod.operator.mutable.rust", { underline = true }) -- e.g. +=, -=
hl(0, "@lsp.mod.controlFlow.rust", { link = "@keyword" }) -- e.g. for, in, ?
hl(0, "@lsp.type.interface.rust", { fg = "#f08368" }) -- trait
hl(0, "@lsp.type.derive.rust", { link = "@lsp.type.interface.rust" })
hl(0, "@lsp.typemod.typeAlias.associated.rust", { link = "@variable.builtin" })
