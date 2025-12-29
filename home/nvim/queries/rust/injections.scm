; sqlx::query!(r#" SELECT ... "#, ...)
(macro_invocation
  macro:
    [
      (scoped_identifier
        path: (identifier) @_path
        name: (identifier) @_name)
      (identifier) @_name
    ]
  (#eq? @_path "sqlx")
  (#any-of? @_name "query" "query_as" "query_unchecked" "query_scalar" "query_as_unchecked")
  (token_tree
    . (raw_string_literal
        (string_content) @injection.content))
  (#set! injection.language "sql"))

; sqlx::query!("SELECT ...", ...)
(macro_invocation
  macro:
    [
      (scoped_identifier
        path: (identifier) @_path
        name: (identifier) @_name)
      (identifier) @_name
    ]
  (#eq? @_path "sqlx")
  (#any-of? @_name "query" "query_as" "query_unchecked")
  (token_tree
    . (string_literal
        (string_content) @injection.content))
  (#set! injection.language "sql"))
