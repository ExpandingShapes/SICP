(define (square x) (* x x))
(define (even? n) (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (carmichael-numbers-test n)
  (define (carmichael-numbers-test-iter n a)
    (cond ((and (= (remainder (fast-expt a n) n) (remainder a n)) (> a 0))
           (carmichael-numbers-test-iter n (- a 1)))
          ((and (= (remainder (fast-expt a n) n) (remainder a n)) (< a 1))
           "I guess it's prime")
          (else "I thinkl it's composite")))
  (carmichael-numbers-test-iter n (- n 1)))
