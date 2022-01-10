(define (last-pair items)
    (if (null? (cdr items))
        (list (car items))
        (last-pair (cdr items))))

;test
(display (equal? (last-pair (list 0 1 2 3)) (list 3)))
(newline)
(display (equal? (last-pair (list 1)) (list 1)))
