;For this representation, verify that (car (cons x y)) yields x for any objects x and y.
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

;Testing
(define my-pair (cons (car (cons 0 1)) (cdr (cons 2 3))))
;must be 0
(display (car my-pair))

(newline)

;must be 3
(display (cdr my-pair))
