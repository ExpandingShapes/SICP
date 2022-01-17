(define nil '())

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))

(display (map abs (list -10 2.5 -11.6 17)))
(newline)
(display (map (lambda (x) (* x x)) (list 1 2 3 4)))
