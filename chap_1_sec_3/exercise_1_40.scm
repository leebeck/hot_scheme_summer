(define (cubic a b c)
  (lambda (x) (+
                (* x x x)
                (* a x x)
                (* b x)
                c)))
; note: got an error on first attempt due to wrapping sum function in another pair of parenthesis
