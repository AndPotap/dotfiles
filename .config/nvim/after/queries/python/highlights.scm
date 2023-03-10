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

;((identifier) @bp (#match? @bp "breakpoint\(\)"))
;(argument_list) @arg (#eq? @arg "()")

(call
  function: (identifier) @bp (#eq? @bp "breakpoint")
  arguments: (argument_list) @bpargs (#eq? @bpargs "()")
)
;(expression_statement (call) @bp (#match? @bp "breakpoint"))

; This change in the highlights file worked like a marvel!
;["[" "]" "{" "}"] @punctuation.bracket
;["(" ")" "[" "]" "{" "}"] @punctuation.bracket

;"return" @bp

; The below matched on TSPlaygroundToggle but does not color the parenthesis
;(expression_statement (call) @bp (#match? @bp "breakpoint"))
