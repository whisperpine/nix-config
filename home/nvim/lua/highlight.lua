-- This file customizes highlight groups.
-- For color themes, refer to "./chadrc.lua".

local hl = vim.api.nvim_set_hl

----- Common -----
hl(0, "DiagnosticUnnecessary", { link = "" })
hl(0, "DiagnosticUnderlineHint", { underdotted = true })
hl(0, "DiagnosticUnderlineWarn", { underdotted = true })
hl(0, "DiagnosticUnnecessary", { underdotted = true })
hl(0, "DiagnosticUnderlineError", { bg = "#633131", underdotted = true })
-- hl(0, "DiagnosticUnderlineError", { bg = "#cc6666", fg = "#202020" })

----- Nix -----
hl(0, "@lsp.type.operator.nix", { link = "" })
hl(0, "@lsp.type.property.nix", { link = "" })
hl(0, "@lsp.typemod.function.builtin.nix", { link = "@function.builtin" })

----- Lua -----
hl(0, "@lsp.type.variable.lua", { link = "" })
hl(0, "@lsp.mod.global.lua", { link = "@module" })
hl(0, "@lsp.type.function.lua", { link = "@function" })
hl(0, "@lsp.typemod.function.defaultLibrary.lua", { link = "@function.builtin" })

----- Python -----
hl(0, "@lsp.type.builtinConstant.python", { link = "@constant" })
hl(0, "@lsp.type.variable.python", { link = "" })
hl(0, "@lsp.type.string.python", { link = "" })
hl(0, "@lsp.type.decorator.python", { link = "" })

----- Dockerfile -----
hl(0, "@lsp.type.macro.dockerfile", { link = "Special" })
hl(0, "@lsp.type.property.dockerfile", { link = "@variable" })
hl(0, "@lsp.type.variable.dockerfile", { link = "" })

----- TypeScript ------
hl(0, "@lsp.type.class.typescript", { link = "" })
hl(0, "@lsp.type.variable.typescript", { link = "" })
hl(0, "@lsp.typemod.property.static.typescript", { link = "@constant" })
hl(0, "@lsp.typemod.variable.defaultLibrary.typescript", { link = "@function.builtin" })

----- JavaScript ------
hl(0, "@lsp.type.class.javascript", { link = "" })
hl(0, "@lsp.type.variable.javascript", { link = "" })
hl(0, "@lsp.typemod.property.static.javascript", { link = "@constant" })
hl(0, "@lsp.typemod.variable.defaultLibrary.javascript", { link = "@function.builtin" })

----- Markdown ------
hl(0, "@lsp.type.class.markdown", { link = "" })

----- Terraform ------
hl(0, "@none.hcl", { link = "@operator" })
hl(0, "@lsp.type.type.terraform", { link = "" })
hl(0, "@lsp.type.variable.terraform", { link = "" })
hl(0, "@lsp.type.enumMember.terraform", { link = "@variable" })
hl(0, "@lsp.mod.defaultLibrary.terraform", { link = "@constant" })
hl(0, "@lsp.type.keyword.terraform", { link = "" })
hl(0, "@lsp.type.parameter.terraform", { link = "" })
hl(0, "@lsp.type.function.terraform", { link = "" })
-- For "terraform-test" filetype.
hl(0, "@lsp.type.type.terraform-test", { link = "" })
hl(0, "@lsp.type.parameter.terraform-test", { link = "" })

----- Ansible ------
hl(0, "@lsp.type.keyword.yaml.ansible", { link = "" })

----- Typst ------
hl(0, "@lsp.type.pol.typst", { link = "@variable" })

----- Rust -----
hl(0, "@character.rust", { link = "@string" })
hl(0, "@lsp.type.keyword.rust", { link = "" })
hl(0, "@lsp.type.decorator.rust", { link = "" })
hl(0, "@lsp.type.punctuation.rust", { link = "@punctuation" })
hl(0, "@lsp.type.builtinAttribute.rust", { link = "@function.builtin" }) -- e.g. #[cfg_attr(..)]
hl(0, "@lsp.typemod.parameter.mutable.rust", { underline = true }) -- e.g. (mut var, ...)
hl(0, "@lsp.typemod.method.mutable.rust", { underline = true }) -- e.g. fn (&mut self, ...)
hl(0, "@lsp.typemod.variable.mutable.rust", { underline = true }) -- mut var, &mut var
hl(0, "@lsp.typemod.operator.mutable.rust", { underline = true }) -- e.g. +=, -=
hl(0, "@lsp.typemod.arithmetic.mutable.rust", { underline = true })
hl(0, "@lsp.type.interface.rust", { fg = "#f0795b" }) -- trait
hl(0, "@lsp.type.derive.rust", { link = "@lsp.type.interface.rust" })
hl(0, "@lsp.typemod.typeAlias.associated.rust", { link = "@variable.builtin" })
hl(0, "@lsp.type.lifetime.rust", { link = "Special" })
hl(0, "@lsp.type.selfKeyword.rust", { link = "@variable.builtin" }) -- self
hl(0, "@lsp.type.selfTypeKeyword.rust", { link = "@type" }) -- Self
-- Rust injected semantic tokens (in code blocks of docstring).
hl(0, "@lsp.typemod.keyword.injected.rust", { link = "@keyword" }) -- keyword in comments
hl(0, "@lsp.typemod.const.injected.rust", { link = "@variable" }) -- code blocks in comments
hl(0, "@lsp.typemod.generic.injected.rust", { link = "@variable" })
hl(0, "@lsp.typemod.attributeBracket.injected.rust", { link = "@punctuation" })
hl(0, "@lsp.typemod.typeAlias.injected.rust", { link = "@type" })
hl(0, "@lsp.typemod.builtinType.injected.rust", { link = "@type" })
hl(0, "@lsp.typemod.arithmetic.injected.rust", { link = "@operator" })
