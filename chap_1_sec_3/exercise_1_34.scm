(define (square n) (* n n))

(define (f g) (g 2))

#| result: 
> (f square)
4
> (f f)
Error: application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 2
|#

; I found this error a bit confusing, would have thought it would simply hang as it endlessly recurs.

