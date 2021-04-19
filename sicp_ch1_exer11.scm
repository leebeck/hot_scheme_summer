; Exercise 1.11
; write procedure that computes f by means of recursive process
(define (f_rp n) 
		(cond ((< n 3) n)
					(else (+ 	(* 1 (f (- n 1))) 
										(* 2 (f (- n 2)))
										(* 3 (f (- n 3)))))))
; because this is tail-recursion we can use state variables to transform into iterative process 
; procedure that computes f by means of iterative process
(define (f_ip n)
  ; initialize a, b, c with f(2)=2, f(1)=1, f(0)=0
  (f-iter 2 1 0 n))
(define (f-iter a b c count)
  (if 	(= count 0)
    	c
		; tranform  a 		<-- 1a + 2b + 3c
		; 			b 		<-- a
		; 			c 		<-- b
		; 			count 	<-- count-1
		(f-iter 
			(+ (* 1 a) (* 2 b) (* 3 c) ); a <-- a + 2b + 3c
			a 							; b <-- a
			b							; c <-- b
			(- count 1)					; count <-- count-1
		)
    )
 )
