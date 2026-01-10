; extends

(arg_instruction
  .
  (unquoted_string) @constant
  (#set! priority 101))

(env_instruction
  (env_pair
    .
    (unquoted_string) @constant
    (#set! priority 101)))

(expose_instruction
  (expose_port) @number
  (#set! priority 150))
