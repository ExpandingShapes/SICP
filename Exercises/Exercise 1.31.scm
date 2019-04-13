(define (identity x) x)
(define (square x) (* x x))

(define (inc x) (+ x 1))
(define (inc-2 x) (+ x 2))

(define (product-recursive term a next b)
  (if (> a b)
      1
      (* (term a) (product-recursive term (next a) next b))))

(define (product-iterative term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (product-iterative identity 2 inc n))

;(2*2*4*4*...*n)/(1*1*3*3*...*n)
(define (pi-approximation n)
  (* 4 (/ (product-iterative square 2 inc-2 n)
          (/ (product-iterative square 1 inc-2 n) n))))
