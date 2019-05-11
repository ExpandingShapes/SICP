;recursive
;n, d - one argument prodedures
(define (cont-frac-recursive n d k)
  (define (helper i)
    (if (> i k)
        0
        (/ (n i) (+ (d i) (helper (+ i 1))))))
  (if (< k 1)
      "k must be 1 or greater"
      (helper 1)))

;iterative
;n, d - one argument procedures
(define (cont-frac-iterative n d k)
  (define (iter acc i)
    (if (< i 1)
        acc
        (iter (/ (n i) (+ (d i) acc)) (- i 1))))
  (if (< k 1)
      "k must be 1 or greater"
      (iter (/ (n k) (d k)) (- k 1))))
