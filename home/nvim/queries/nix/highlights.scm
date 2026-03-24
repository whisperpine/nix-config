; extends

(apply_expression
  function: (variable_expression
    name: (identifier) @function.call)
    (#set! priority 150))

(binding
  attrpath: (attrpath
    attr: (identifier) @function)
  expression: (function_expression)
  (#set! priority 150))
