; Exercise 1.12
; Write a procedure that computes elements of Pascal’s triangle by means of a recursive process
(define (pt row col)
	(
	  if	(or (= col 1) (= col row))
	  		1							; 1s along first and last column
	  		(+ 
	  		  (pt (- row 1) (- col 1))
	  		  (pt (- row 1) (+ col 0))
	  		)
	)
)
