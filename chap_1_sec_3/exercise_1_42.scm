#|
Let f and д be two one-argument functions. e composition f aer д is defined to be the function x 􏰀→ f (д(x )). Define a procedure compose that implements com- position. For example, if inc is a procedure that adds 1 to its argument,
((compose square inc) 6) 49
|#

(define (compose f g) (lambda (x) (f (g x))))
