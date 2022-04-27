(define (reverse items)
  (define (iter old-items new-items)
    (if (null? old-items) new-items
        (iter (cdr old-items) (cons (car old-items) new-items))))
  (iter items '()))

(define (deep-reverse items)
  (define (iter old-items new-items)
      (cond ((null? old-items) new-items)
            ;we're on the last element
            ((null? (cdr old-items)) (cons (reverse (car old-items))
                                           new-items))
            (else (iter (cdr old-items) (cons (reverse (car old-items))
                                              new-items)))))
  (iter items '()))

;tests
(define x (list (list 1 2) (list 3 4)))
(display x)
;((1 2) (3 4))
(newline)
(display (reverse x))
;((3 4) (1 2))
(newline)
(display (deep-reverse x))
;((4 3) (2 1))
