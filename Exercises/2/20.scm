(define (same-parity x . xs)
  (let ((rem (remainder x 2)))
    (define (iter xs-filtered xs)
      (cond ((null? xs) xs-filtered)
            ((= rem (remainder (car xs) 2))
             (iter (append xs-filtered (list (car xs))) (cdr xs)))
            (else (iter xs-filtered (cdr xs)))))
    (iter (list x) xs)))

;tests
(display (same-parity 1 2 3 4 5 6 7))
(newline)
(display (same-parity 2 3 4 5 6 7))
