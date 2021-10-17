(define (make-rectangle-1 upper-segment lower-segment) (cons upper-segment lower-segment))
(define (make-rectangle-2 left-segment right-segment) (cons left-segment right-segment))

(define (make-segment start end) (cons start end))
(define (start-segment segment) (car segment))
(define (end-segment segment) (cdr segment))

(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))

(define (area-rectangle rectangle) ())
(define (perimeter-rectangle rectangle) ())
