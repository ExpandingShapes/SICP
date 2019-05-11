(define (square x) (* x x))

(define (cont-frac-iterative n d k)
  (define (iter acc i)
    (if (< i 1)
        acc
        (iter (/ (n i) (- (d i) acc)) (- i 1))))
  (if (< k 1)
      "k must be 1 or greater"
      (iter (/ (n k) (d k)) (- k 1))))

;x is in radians
(define (tan-cf x k)
  (define (n x i)
    (if (> i 1)
        (square x)
        x))
  (define (d i)
    (if (> i 1)
        (+ (d (- i 1)) 2)
        1.0))
  (cont-frac-iterative (lambda (i) (n x i)) d k))
