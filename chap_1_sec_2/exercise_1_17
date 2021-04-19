; Exercise 1.17
; Now suppose we include, together with addition, operations double, 
; which doubles an integer, and halve, which divides an (even) integer
; by 2. Using these, design a multiplication procedure analogous to
; fast-expt that uses a logarithmic number of steps.

; multiply using a number of steps that is linear in b
(define (mult_linear a b)
	(if (= b 0)
	  0
	  (+ a  (mult_linear a (- b 1)))
	)
)

; multiply using a number of steps that is logarithmic in b
(define (double n) (* n 2))
(define (halve n ) (/ n 2))
(define (mult_log a b)
	(cond 
	  ((= b 0)
	  		0)
	  ((even? b)
	   		(double (mult_linear a (halve b))))
	  (else
	    	(+ a (mult_linear a (- b 1))))
	)
)

