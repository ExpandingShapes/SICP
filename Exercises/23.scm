(define (for-each f xs)
  (cond ((null? xs) #t)
        (else (f (car xs))
              (for-each f (cdr xs)))))

;test
(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
;57
;321
;88
