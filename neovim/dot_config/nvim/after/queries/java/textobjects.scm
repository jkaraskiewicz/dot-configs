; extends

;; Functions/Methods
[
  (method_declaration
    body: (block) @function.inner)
  (constructor_declaration
    body: (block) @function.inner)
] @function.outer

;; Blocks (if, while, for, etc.)
[
  (if_statement
    consequence: (block) @block.inner)
  (while_statement
    body: (block) @block.inner)
  (for_statement
    body: (block) @block.inner)
  (enhanced_for_statement
    body: (block) @block.inner)
  (do_statement
    body: (block) @block.inner)
  (try_statement
    body: (block) @block.inner)
  (catch_clause
    body: (block) @block.inner)
] @block.outer

;; Return statements
(return_statement) @return.outer
(return_statement
  (_) @return.inner)

;; Function calls
(method_invocation) @call.outer
(method_invocation
  arguments: (argument_list) @call.inner)

;; Parameters
(formal_parameters
  (formal_parameter) @parameter.inner)

;; Fields
(field_declaration) @field.outer
