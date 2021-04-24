; Exercise 1.18
; Using the results of Exercise 1.16 and Exercise 1.17, 
; devise a procedure that generates an iterative process for multiplying 
; two integers in terms of adding, dou- bling, and halving and uses 
; a logarithmic number of steps

(define (double n) (* n 2))
(define (halve n) (/ n 2))
(define (mult_iter a b)
	(mult_iter_sub a b 0)
)
(define (mult_iter_sub a b c)
  	; invariance: a*b+c
	(cond
		((= b 0)
		 			c); because a*0+c = c 
		((even? b)
		 			(mult_iter_sub (double a) (halve b) c)); because a*b+c = 2a * b/2 + c 
	  	(else
	  	  			(mult_iter_sub a (- b 1) (+ c a))); because a*b+c = a * (b-1) + (c+a)
	)
)
