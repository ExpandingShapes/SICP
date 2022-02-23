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
$$
\frac{R1 \times R2}{R1 + R2}
$$
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
$$
A \times B = [(c_A - \frac{c_A\cdot t_A}{100}) \times (c_B - \frac{c_B\cdot t_B}{100}),(c_A + \frac{c_A\cdot t_A}{100}) \times (c_B + \frac{c_B\cdot t_B}{100})]
=[c_A \times c_B(1 - \frac{c_A \cdot t_A + c_A \cdot t_B}{100} - \frac{c_A \cdot t_A + c_A \cdot t_B}{100},c_A \times c_B(1 + \frac{c_A \cdot t_A + c_A \cdot t_B}{100} + \frac{c_A \cdot t_A + c_A \cdot t_B}{100}))]
=c_A \times c_B[(1 - \frac{c_A \cdot t_A + c_A \cdot t_B}{100}), (1 + \frac{c_A \cdot t_A + c_A \cdot t_B}{100})]
$$
It appears, $c_A \cdot t_A$ and $c_B \cdot t_B$ are small and $\frac{c_A \cdot t_A \cdot c_B \cdot t_B}{100}$ is significantly small. We can ignore it.
$$
A \times B = c_A \cdot c_B[(1 - \frac{c_A \cdot t_A + c_B \cdot t_B}{100}),(1+ \frac{c_A \cdot t_A + c_B \cdot t_B}{100})]
$$
Thus, our assumption is right.
