 <script src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML" type="text/javascript"></script>
 **2.13**: Show that under the assumption of small
percentage tolerances there is a simple formula for the
approximate percentage tolerance of the product of two in
tervals in terms of the tolerances of the factors. You may
simplify the problem by assuming that all numbers are pos
itive.
After considerable work, Alyssa P. Hacker delivers her ﬁn-
ished system. Several years later, after she has forgotten all
about it, she gets a frenzied call from an irate user, Lem E.
Tweakit. It seems that Lem has noticed that the formula for
parallel resistors can be written in two algebraically
equivalent ways:
<div>
$$
\frac{R1 \times R2}{R1 + R2}
$$
 </div>
and
$$
\frac{1}{\frac{1}{R1} + \frac{2}{R2}}
$$
He has written the following two programs, each of which
computes the parallel-resistors formula diﬀerently:
```scheme
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
                
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
    one (add-interval (div-interval one r1)
                      (div-interval one r2)))))
```
Lem complains that Alyssa’s program gives diﬀerent an-
swers for the two ways of computing. This is a serious com
plaint.  
**Solution**: Let's take intervals A = [9.9, 10.1] and B = [19.92, 20.08] with centers in $$c_1 = 10$$, $$c_2 = 20$$ with tolerances $$t_1 = 1$$, $$t_2 = 0.4$$ respectively.
$$A \times B = [197.208, 202.808]$$ with resulting tolerancy $$t_{A \times B} = 1.4$$
Trying out multiplying various will lead us to an idea that tolerance of the product of two intervals is sum of the tolerances of individual intervals. Let's confirm whether it is right or wrong!
Again, we have intervals A and B but with no specific values.
We assume endpoints of the intervals contain positive numbers only.
As we know from 2.11 exercise solution, in this case the product of A and B will be [A's lower bound $$\times$$ B's lower bound, A's upper bound $$\times$$ B's upper bound]. In our terms,
<div>
$$
A \times B = [(c_A - \frac{c_A\cdot t_A}{100}) \times (c_B - \frac{c_B\cdot t_B}{100}),(c_A + \frac{c_A\cdot t_A}{100}) \times (c_B + \frac{c_B\cdot t_B}{100})]
=[c_A \times c_B(1 - \frac{c_A \cdot t_A + c_A \cdot t_B}{100} - \frac{c_A \cdot t_A + c_A \cdot t_B}{100},c_A \times c_B(1 + \frac{c_A \cdot t_A + c_A \cdot t_B}{100} + \frac{c_A \cdot t_A + c_A \cdot t_B}{100}))]
=c_A \times c_B[(1 - \frac{c_A \cdot t_A + c_A \cdot t_B}{100}), (1 + \frac{c_A \cdot t_A + c_A \cdot t_B}{100})]
$$
 </div>
It appears, $$c_A \cdot t_A$$ and $$c_B \cdot t_B$$ are small and $$\frac{c_A \cdot t_A \cdot c_B \cdot t_B}{100}$$ is significantly small. We can ignore it.
<div>
$$
A \times B = c_A \cdot c_B[(1 - \frac{c_A \cdot t_A + c_B \cdot t_B}{100}),(1+ \frac{c_A \cdot t_A + c_B \cdot t_B}{100})]
$$
 </div>
Thus, our assumption is right.

**2.14**: Demonstrate that Lem is right. Investigate
the behavior of the system on a variety of arithmetic ex-
pressions. Make some intervals A and B, and use them in
computing the expressions A/A and A/B. You will get the
most insight by using intervals whose width is a small per-
centage of the center value. Examine the results of the com-
putation in center-percent form (see Exercise 2.12).  
**Solution**: Let's take intervals whose width is a small percentage of the center value A = [99, 101], B = [98, 102]
Indeed, par1 and par2 give different results for $$\frac{A}{B}$$
[47.79, 52.29] and [49.25, 50.75]. The same intervals in center percent form:
$$50.04\pm4.5%$$ and $$50\pm1.5%$$.We see smaller widths of the interval calculations get more precise they are. The second result's tolerance is smaller which means par2 algorithm is more precise.
If we divide A by itself, we get intervals $$50.02\pm3$$ and $$50\pm1$$ depending on which par algorithm we chose while the result must be 1.
The problem is our implementation doesn't take identity into account. So, every time we introduce the same interval the system interprets it as a new one. This issue brings up some uncertainty.

**2.15**: Eva Lu Ator, another user, has also noticed
the diﬀerent intervals computed by diﬀerent but algebraically
equivalent expressions. She says that a formula to compute
with intervals using Alyssa’s system will produce tighter
error bounds if it can be written in such a form that no vari-
able that represents an uncertain number is repeated. Thus,
she says, par2 is a “better” program for parallel resistances
than par1. Is she right? Why?
**Solution**: Eva is totally right! First of all, we saw that par2 algorithm is more precise.
Second, the uncertainty brought up by introducing the same number isn't yield into the result in par2 as it is in par1.

**2.16**: Explain, in general, why equivalent alge-
braic expressions may lead to diﬀerent answers. Can you
devise an interval-arithmetic package that does not have
this shortcoming, or is this task impossible? (Warning: This
problem is very diﬃcult.)
**Solution**: To make algebraic expressions lead to same results we need to introduce concepts of identity element and inverse element.
IN PROGRESS

**2.22** Louis Reasoner tries to rewrite the first square-
list procedure of Exercise 2.21 so that it evolves an itera-
tive process:
```
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
```
Unfortunately, defining square-list this way produces the
answer list in the reverse order of the one desired. Why?
Louis then tries to fix his bug by interchanging the argu-
ments to cons:
```
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
```
**Solution**: 
The first algorithm reverses the resulting list because during its construction we
append each squared element to answer i. e . put it at the beggining. If only we put it at the end of answer, everything would be fine.
Intercharging the arguments to cons doesn't work because one should not pass cons a list and an element. It doesn't work as one might expect. cons don't expect it. Instead, cons treat list and element we passed as two elements and build a new pair (() . x_1) where x_1 is the first element of the initial list. So on for the remaining elements of the initial list.

**2.23**
The procedure for-each is similar to map. It takes as arguments a procedure and a list of elements. However, rather than forming a list of the results, for-each just applies the procedure to each of the elements in turn, from left to right. The values returned by applying the procedure to the elements are not used at all—for-each is used with procedures that perform an action, such as printing. For example, 
```
(for-each (lambda (x)
            (newline)
            (display x))
          (list 57 321 88))
>57
>321
>88
```
The value returned by the call to for-each (not illustrated above) can be something arbitrary, such as true. Give an implementation of for-each.

**Solution**: 
```
(define (for-each f xs)
  (if (null? xs)
      #t
      (begin 
      (f (car xs))
      (for-each f (cdr xs)))))
```

**2.24**
Suppose we evaluate the expression (list 1 (list 2 (list 3 4))). Give the result printed by the interpreter, the corresponding box-and-pointer structure, and the interpretation of this as a tree (as in Figure 2.6).

**Solution**:
Interpreter result - (1 (2 (3 4)))
IN PROGRESS

** 2.25 **:
Give combinations of cars and cdrs that
will pick 7 from each of the following lists:
(1 3 (5 7) 9)
((7))
(1 (2 (3 (4 (5 (6 7))))))

**Solution**:
```
(car (cdr (car (cdr (cdr a)))))
(car (car b))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr  c))))))))))))
```
** 2.26 **:
Suppose we define x and y to be two lists:
```
(define x (list 1 2 3))
(define y (list 4 5 6))
```
What result is printed by the interpreter in response to eval-
uating each of the following expressions:
```
(append x y)
(cons x y)
(list x y)
```

** Solution **:
`(append x y)
>(1 2 3 4 5 6)
`(cons x y)
>((1 2 3) 4 5 6)
`(list x y)
>((1 2 3) (4 5 6))

** 2.27 **:
Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well.
For example,
`(define x (list (list 1 2) (list 3 4)))
>x
>((1 2) (3 4))

>(reverse x)
>((3 4) (1 2))

>(deep-reverse x)
>((4 3) (2 1))

** Solution **:
```
(define (deep-reverse items)
  (define (iter old-items new-items)
      (cond ((null? old-items) new-items)
            ;we're on the last element
            ((null? (cdr old-items)) (cons (reverse (car old-items))
                                           new-items))
            (else (iter (cdr old-items) (cons (reverse (car old-items))
                                              new-items)))))
  (iter items '()))
```
