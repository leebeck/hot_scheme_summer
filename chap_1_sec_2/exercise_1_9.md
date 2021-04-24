**Exercise 1.9**: 
Each of the following two procedures defines a method for adding two positive integers in terms of the procedures inc, which increments its argument by 1, and dec, which decrements its argument by 1.

(define (+ a b)
(if (= a 0) b (inc (+ (dec a) b))))
(define (+ a b)
(if (= a 0) b (+ (dec a) (inc b))))

Using the substitution model, illustrate the process generated by each procedure in evaluating (+ 4 5). Are these processes iterative or recursive?

**Solution**:
For the first definition:
(+ 4 5)
--> (if (= 4 0) 5 (inc (+ (dec 4) 5))))
--> (if (= 4 0) 5 (inc (+ 3 5))))
--> (if (= 4 0) 5 (inc ((if (= 3 0) 5 (inc (+ (dec 3) 5)))))))
--> (if (= 4 0) 5 (inc ((if (= 3 0) 5 (inc (+ 2 5)))))))
--> (if (= 4 0) 5 (inc ((if (= 3 0) 5 (inc ((if (= 2 0) 5 (inc (+ (dec 2) 5)))))))))))
--> (if (= 4 0) 5 (inc ((if (= 3 0) 5 (inc ((if (= 2 0) 5 (inc (+ 1 5)))))))))))
--> (if (= 4 0) 5 (inc ((if (= 3 0) 5 (inc ((if (= 2 0) 5 (inc ((if (= 1 0) 5 (inc (+ (dec 1) 5)))))))))))))))
--> (if (= 4 0) 5 (inc ((if (= 3 0) 5 (inc ((if (= 2 0) 5 (inc ((if (= 1 0) 5 (inc (+ 0 5)))))))))))))))
--> (if (= 4 0) 5 (inc ((if (= 3 0) 5 (inc ((if (= 2 0) 5 (inc ((if (= 1 0) 5 (inc ((if (= 0 0) 5 (inc (+ (dec 0) 5)))))))))))))))))))
--> (if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 (inc ((if TRUE 5 (...)))))))))))))))))))
(unclear to me if "substitition model" continues indefinitely, but I use "..." to indicate further evaluation inconsequential)
--> (if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 (inc 5))))))))))
--> (if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 6))))))))))
--> (if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 (inc 6))))))))
--> (if FALSE 5 (inc ((if FALSE 5 (inc ((if FALSE 5 7)))))))
--> (if FALSE 5 (inc ((if FALSE 5 (inc 7)))))
--> (if FALSE 5 (inc ((if FALSE 5 8))))
--> (if FALSE 5 (inc 8))
--> (if FALSE 5 (9))
--> 9