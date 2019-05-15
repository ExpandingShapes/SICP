(define (double f) (lambda (x) (f (f x))))
;usage:
;((double inc) 4)
