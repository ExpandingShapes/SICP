(define (cont-frac-iterative n d k)
  (define (iter acc i)
    (if (< i 1)
        acc
        (iter (/ (n i) (+ (d i) acc)) (- i 1))))
  (if (< k 1)
      "k must be 1 or greater"
      (iter (/ (n k) (d k)) (- k 1))))

(define (calculate-e k)
  (define (d i)
    (cond ((= i 1) 1)
          ((= i 2) 2)
          ((or (= (remainder i 3) 0)
               (= (remainder (- i 1) 3) 0))
           1)
          (else (+ (d (- i 3)) 2))))
  (+ (cont-frac-iterative (lambda (i) 1.0) d k) 2))
