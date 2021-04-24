; Exercise 1.19: There is a clever algorithm for computing the Fibonacci numbers 
; in a logarithmic number of steps. Recall the transformation of the state 
; variables a and b in the fib-iter process of Section1.2.2:
; a <-- a + b  
; b <-- a. 
;
; Call this transformation T, and observe that applying T over and over again n 
; times, starting with 1 and 0, produces the pair Fib(n + 1) and Fib(n). In other
; words, the Fibonacci numbers are produced by applying T^n, the nth power of the 
; transformation T, starting with the pair (1, 0). Now consider T to be the special
; case of p = 0 and q = 1 in a family of transformations T_pq, where T_pq 
; transforms the pair(a,b) according to
; a <-- bq + aq + ap  
; b <-- bp + aq. 
;
; Show that if we apply such a transformation T_pq twice, the effect is the same as 
; using a single transformation T_p′q′ of the same form, and compute p′ and q′ in 
; terms of p and q. This gives us an explicit way to square these transformations, 
; and thus we can compute T^n using successive squaring, as in the fast-expt 
; procedure. Put this all together to complete the following procedure, which runs 
; in a logarithmic number of steps.

; ANSWER -------------------
; Applying the transformation T_pq once looks like this:
; a <-- bq + aq + ap and 
; b <-- bp + aq.
;
; Applying the transformation T_pq twice (via substitution) and then rearranging to preserve form:
; a <-- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p 
;     = b(2pq + q^2) + a(q^2 + q^2 + 2pq + p^2)
;     = b(2pq + q^2) + a(2pq + q^2) + a(q^2 + p^2).
; b <-- (bp + aq)p + (bq + aq + ap)q
;     = b(q^2 + p^2) + a(2pq + q^2).
;
; Now defining p' and q' so that T_p'q' = (T_pq)^2 like so:
; p'  = q^2 + p^2 and
; q'  = 2pq + q^2.
;
; In the special case of Fibonacci (p = 0, q = 1) we have
; p'  = 1 + 0^2         = 1 and
; q'  = 2*0*1 + 1^2     = 1.
;
; This makes sense because applying T once gives:
; a <-- a + b,
; b <-- a;
; 
; and applying T again gives:
; a <-- (a + b) + a = 2a + b = bq' + aq' + ap',
; b <-- (a + b)     = a + b  = bp' + aq',
; where p' = 1 and q' = 1.


(define (fib n) (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count) (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p))
                   (+ (* 2 p q) (* q q))
                   (/ count 2)))
(else (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
; Fib sequence goes like this: 
; F0	F1	F2	F3	F4	F5	F6	F7	F8	F9	F10	F11	F12	F13	F14	F15	F16
; 0	1	1	2	3	5	8	13	21	34	55	89	144	233	377	610	987
;
; my question: why is this diving counter by two rather than decrementing by two?
;
; We have T defined like this:
; a <-- a + b
; b <-- a
;
; so for T^2 (applying T twice) we have this:
; a <-- 2a + b
; b <-- a + b
;
; so for T^4 (applying T^2 twice) we have this:
; a <-- 5a + 3b 
; b <-- 3a + 2b
; 
; so for T^8 (applying T^4 twice) we have this:
; a <-- 34a + 21b
; b <-- 21a + 13b
; 
; THIS IS WRONG BELOW
; Now trying with a higher power of 2:
; (fib 8) 
;       start with a = 1, b = 0 (F_0 = b = 0) 
;       with a=1  b=0 counter=8, halve counter (=4) and do T^2 to skip 2
;       now  a=2  b=1 counter=4, halve counter (=2) and do T^4 to skip 4
;       now  a=13 b=8 counter=2, halve counter (=1) and so T^8 to skip 8
;       now  a=610 b=377 counter=1, decrement counter (=0) and 
;       
;       
