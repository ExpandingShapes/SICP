;recursive process
(define (fun-recursive n)
  (if (< n 3)
  n
  (+ (fun-recursive (- n 1)) 
     (* 2 (fun-recursive (- n 2))) 
     (* 3 (fun-recursive (- n 3))))))

;iterative process
(define (fun-iterative n)
  (define (iter n a b c)
    (if (< n 3)
        n
        (+ (iter (- n 1) b c (+ a b c)) 
           (* 2 (iter (- n 2) b c (+ a b c))) 
           (* 3 (iter (- n 3) b c (+ a b c))))))
  (iter n 0 1 2))
