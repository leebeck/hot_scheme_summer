; Exercise 1.16
; Design a procedure that evolves an iterative exponentiation process that 
; uses successive squaring and uses a logarithmic number of steps, as does
; fast-expt.

; expt requires O(n) steps and O(n) space
(define 
	(expt b n) 
	(if 
	  (= n 0)
      1
      (* b (expt b (- n 1)))
     )
)

; fast-expt requires O(log n) steps and O(log n) space
(define (square n) (* n n))
(define 
  	(fast-expt b n) 
	(cond 
    	((= n 0) 	
    	 	1) ; b^0 = 1
		((even? n) 
		 	(square (fast-expt b (/ n 2)))) ; b^(2k) = (b^k)^2
	  	(else 
	  	  	(* b (fast-expt b (- n 1)))) ; b^(2k+1) = b * (b^k)^2
	)
)


(define (expt_alt b n)
	(expt_iter 1 b n)
)
(define (expt_iter a b n)
  	(cond
  	  	((= n 0) 
  	  	 	a) ; b^0 = 1
  	  	((even? n) 
  	  	 	(expt_iter a (square b) (/ n 2)))
  	  	 (else
  	  	   	(expt_iter (* a b) b (- n 1)))
  	)
)
  	  	 
	; a*b^n should be invariant from state to state
	; transformations:
	; 					a <-- a*b
	;					b <-- b-1
	;					n <-- n/2
	
