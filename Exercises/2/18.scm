(define (reverse items)
  (define (iter old-items new-items)
    (if (null? old-items)
        new-items
        (iter (cdr old-items) (cons (car old-items) new-items))))
  (iter items '()))

;tests
(display (reverse (list 1 4 9 16 25)))
(newline)
(display (reverse '()))
