;; Folding untuk direktif Blade
((directive_start) @start
    (directive_end) @end.after
    (#set! role block))

;; Folding untuk bracket
((bracket_start) @start
    (bracket_end) @end
    (#set! role block))
