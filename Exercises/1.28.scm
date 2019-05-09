(define (square x) (* x x))

(define (non-trivial-sqrt? x n)
  (and (not (= x 1))
       (not (= x (- n 1)))
       (= (remainder (square x) n) 1)))

(define (zero-if-non-trivial-sqrt x n)
  (if (non-trivial-sqrt? x n) 0 x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (zero-if-non-trivial-sqrt
                             (expmod base (/ exp 2) m) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (cond ((= a n) #t)
          ((= (expmod a (- n 1) n) 1) (try-it (+ a 1)))
          (else #f)))
  (try-it 1))
