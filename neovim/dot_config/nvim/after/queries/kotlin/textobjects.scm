; extends
(call_suffix
  (_) @call.inner)

[
  (function_declaration
    (function_body) @method.inner)
  (getter
    (function_body) @method.inner)
  (setter
    (function_body) @method.inner)
  (primary_constructor)
] @method.outer

(primary_constructor) @method.inner
