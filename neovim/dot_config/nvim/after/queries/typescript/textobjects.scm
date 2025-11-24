; extends

;; Functions/Methods
[
  (function_declaration
    body: (statement_block) @function.inner)
  (method_definition
    body: (statement_block) @function.inner)
  (arrow_function
    body: (_) @function.inner)
  (function_expression
    body: (statement_block) @function.inner)
] @function.outer

;; Blocks (if, while, for, etc.)
[
  (if_statement
    consequence: (statement_block) @block.inner)
  (while_statement
    body: (statement_block) @block.inner)
  (for_statement
    body: (statement_block) @block.inner)
  (for_in_statement
    body: (statement_block) @block.inner)
  (do_statement
    body: (statement_block) @block.inner)
  (try_statement
    body: (statement_block) @block.inner)
  (catch_clause
    body: (statement_block) @block.inner)
  (switch_case
    (_) @block.inner)
] @block.outer

;; Return statements
(return_statement) @return.outer
(return_statement
  (_) @return.inner)

;; Function calls
(call_expression) @call.outer
(call_expression
  arguments: (arguments) @call.inner)

;; Parameters
(formal_parameters
  (required_parameter) @parameter.inner)
(formal_parameters
  (optional_parameter) @parameter.inner)

;; Fields/Properties
(field_definition) @field.outer
(public_field_definition) @field.outer
