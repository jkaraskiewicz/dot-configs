;; Functions
(function_item
  body: (block) @function.inner) @function.outer

;; Methods (in impl blocks)
(function_signature_item
  body: (block) @function.inner) @function.outer

;; Closures
(closure_expression
  body: (_) @function.inner) @function.outer

;; Structs
(struct_item
  body: (field_declaration_list) @struct.inner) @struct.outer

;; Enums
(enum_item
  body: (enum_variant_list) @enum.inner) @enum.outer

;; Impl blocks
(impl_item
  body: (declaration_list) @impl.inner) @impl.outer

;; Trait definitions
(trait_item
  body: (declaration_list) @trait.inner) @trait.outer

;; Code blocks (if, while, for, loop, match)
[
  (if_expression
    consequence: (block) @block.inner)
  (while_expression
    body: (block) @block.inner)
  (for_expression
    body: (block) @block.inner)
  (loop_expression
    body: (block) @block.inner)
  (match_expression
    body: (match_block) @block.inner)
] @block.outer

;; Match arms as blocks
(match_arm
  value: (_) @block.inner) @block.outer

;; Return statements
(return_expression) @return.outer
(return_expression
  (_) @return.inner)

;; Function parameters
(parameters
  (parameter
    pattern: (_) @parameter.inner))

;; Closure parameters
(closure_parameters
  (parameter) @parameter.inner)

;; Struct fields
(field_declaration) @field.outer

;; Function/method calls
(call_expression) @call.outer
(call_expression
  arguments: (arguments) @call.inner)

;; Method calls
(method_call_expression) @call.outer
(method_call_expression
  arguments: (arguments) @call.inner)
