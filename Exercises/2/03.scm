(define (make-rectangle upper-segment lower-segment) (cons upper-segment lower-segment))
()

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
;Test. Point (30, 15) must be returned
(print-point (midpoint-segment (make-segment (make-point 10 20)
                                             (make-point 50 10))))
