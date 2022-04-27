(define (for-each f xs)
  (if (null? xs)
      #t
      (begin 
      (f (car xs))
      (for-each f (cdr xs)))))
