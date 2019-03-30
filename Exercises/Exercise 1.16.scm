(define (square x) (* x x))
(define (even? n)
    (= (remainder n 2) 0))
(define (fast-expt b n)
  (let expt ((b b) (n n) (a 1))
    (cond ((= n 0) a)
          ((even? n) (expt (square b) (/ n 2) a))
          (else (expt b (- n 1) (* b a))))))