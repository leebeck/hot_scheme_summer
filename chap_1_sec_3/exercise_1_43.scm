; adapting http://community.schemewiki.org/?sicp-ex-1.43

(define (square n) (* n n))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

; > ((repeated square 2) 5)
; 625
