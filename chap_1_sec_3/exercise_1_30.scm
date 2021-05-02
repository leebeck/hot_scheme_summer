(define (cube n) (* n n n))
#|
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
|#

(define (sum term a next b)
  ; define iteration procedure as follows
  (define (iter a result) ; iterate using left bound and cumulative result
    (if (> a b) ; if left bound exceeds right bound, you've passed finish line
        result ; return cumulative result
        ; otherwise, apply term to current a and add to previous cumulative result; repeat for next a
        (iter (next a) (+ result (term a)))))
  ; given above iteration procedure, apply to args by starting with left bound of a and cumulative result of zero
  (iter a 0) 
  )

(define (integral f a b dx)
  (define (add-dx x)
    (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b) dx))

; adapting http://community.schemewiki.org/?sicp-ex-1.29
(define (integral-simp f a b n)
  (define h (/ (- b a) n))
  (define (next x) (+ x (* 2 h))) ; add 2h (for odd subscript and for even subscripts)
  (* (/ h 3.0) (+ (f a) ; first term
                  (* 4.0 (sum f (+ a h)       next b))
                  (* 2.0 (sum f (+ a (* 2 h)) next (- b h)))
                  (f b))))
                        
