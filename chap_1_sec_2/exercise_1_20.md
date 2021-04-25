Exercise 1.20 (page 65)

Show process for (gcd 206 40)

Using the substitution method for normal order (Sec 1.1.5): 
"To apply a compound procedure to arguments, evaluate the body of 
the procedure with each formal parameter replaced by the 
corresponding argument."

(gcd 205 40)
--> (gcd 40 (remainder 206 40))         ; remainder calc 1
--> (gcd 6  (remainder 40 6))           ; remainder calc 2
--> (gcd 4  (remainder 6 4))            ; remainder calc 3
--> (gcd 2  (remainder 4 2))            ; remainder calc 4
--> (gcd 2  if(= 0 0) a (remainder 2 0))

In normal evaluation of (if ...) there are 4 remainder evaluations.
In applicative evaluation of (if ...) there are 5 remainder evaluations.
