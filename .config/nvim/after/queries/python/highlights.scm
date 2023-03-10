; extends

; Module docstring
(module . (expression_statement (string) @comment))

; Class docstring
(class_definition
  body: (block . (expression_statement (string) @comment)))

; Function/method docstring
(function_definition
  body: (block . (expression_statement (string) @comment)))

; Attribute docstring
((expression_statement (assignment)) . (expression_statement (string) @comment))

((identifier) @bp (#match? @bp "breakpoint\(\)"))

;"return" @bp

; The below matched on TSPlaygroundToggle but does not color the parenthesis
;(expression_statement (call) @bp (#match? @bp "breakpoint"))
