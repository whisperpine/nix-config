; extends

((self) @variable.builtin
  (#set! priority 150))

((identifier) @constant
  (#lua-match? @constant "^[A-Z][A-Z%d_]*$")
  (#set! priority 150))
