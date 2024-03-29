(define (list-ref items n)
(if (= n 0)
(car items)
(list-ref (cdr items) (- n 1))))
;length-1
(define (length items)
(if (null? items)
0
(+ 1 (length (cdr items)))))

;length-2
(define (length items)
(define (length-iter a count)
(if (null? a)
count
(length-iter (cdr a) (+ 1 count))))

(define (append list1 list2)
(if (null? list1)
list2
(cons (car list1) (append (cdr list1) list2))))
