; extends

;; Functions
[
  (function_declaration
    body: (_) @function.inner)
  (function_definition
    body: (_) @function.inner)
] @function.outer

;; Blocks (if, while, for, repeat)
[
  (if_statement
    (_) @block.inner)
  (while_statement
    (_) @block.inner)
  (for_statement
    (_) @block.inner)
  (repeat_statement
    (_) @block.inner)
] @block.outer

;; Return statements
(return_statement) @return.outer
(return_statement
  (_) @return.inner)

;; Function calls
(function_call) @call.outer
(function_call
  arguments: (arguments) @call.inner)

;; Parameters
(parameters
  (identifier) @parameter.inner)

;; Table fields
(field) @field.outer
