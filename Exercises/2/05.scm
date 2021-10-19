(define (divides-by-2? x) (= (remainder x 2) 0))
(define (divides-by-3? x) (= (remainder x 3) 0))
(define (pow a b)
  (define (iter acc b)
    (if (= b 1)
        acc
        (iter (* acc a) (- b 1))))
    
    (if (= b 0) 1 (iter a b)))

(define (cons a b)
    (* (pow 2 a) (pow 3 b)))

(define (car p)
  (define (iter acc p)
    (if (divides-by-2? p)
        (iter (+ acc 1) (/ p 2))
        acc))
    (iter 0 p))

(define (cdr p)
  (define (iter acc p)
    (if (divides-by-3? p)
        (iter (+ acc 1) (/ p 3))
        acc))
    (iter 0 p))

;Testing
;must be 108
(display (cons 2 3))
(newline)
;must be 2
(display (car 108))
(newline)
;must be 3
(display (cdr 108))
