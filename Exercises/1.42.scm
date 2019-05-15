(define (compose f g) (lambda (x) (f (g x))))

;usage:
;((compose square inc) 6)
