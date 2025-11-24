; extends

;; Function calls
(call_suffix) @call.outer
(call_suffix
  (_) @call.inner)

;; Functions/Methods
[
  (function_declaration
    (function_body) @function.inner)
  (getter
    (function_body) @function.inner)
  (setter
    (function_body) @function.inner)
] @function.outer

;; Primary constructor
(primary_constructor) @function.outer
(primary_constructor) @function.inner

;; Blocks (if, when, while, for, etc.)
[
  (if_expression
    (control_structure_body) @block.inner)
  (when_expression
    (when_entry) @block.inner)
  (while_statement
    (control_structure_body) @block.inner)
  (for_statement
    (control_structure_body) @block.inner)
  (do_while_statement
    (control_structure_body) @block.inner)
] @block.outer

;; Return statements
(return_expression) @return.outer
(return_expression
  (_) @return.inner)

;; Parameters
(parameter) @parameter.inner

;; Fields/Properties
(property_declaration) @field.outer
