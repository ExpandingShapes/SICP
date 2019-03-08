(define (fun-recursive n)
  (if (< n 3)
  n
  (+ (fun-recursive (- n 1)) 
     (* 2 (fun-recursive (- n 2))) 
     (* 3 (fun-recursive (- n 3))))))
