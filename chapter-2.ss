;; ex 2.1
(define power
  (lambda (base exponent)
    (if (= exponent 0)
        1
        (* (power base (- exponent 1))
           base))))

;; ex 2.2
(define factorial
  (lambda (n)
    (if (= n 1)
        1
        (* (factorial (- n 1))
           n))))
;; Base case: (factorial 1) termintates with the value 1 because of the evaluation rule for if.
;;            because 1!=1, (factorial 1) computes the correct value.
;;
;; Inductive hypothesis: Assume that (factorial k) terminates with the value k! for all k in the range 1<=k<n
;;
;; Inductive step: Consider (factorial n) which will terminate if (factorial (- n 1)) does and will have the same value
;;                 as (* (factorial (- n 1)) n).  As 0<=n-1<n, we can assume the inductive hypothesis that
;;                 (factorial (- n 1)) does terminate with the value (n-1)!  Therefore (* (factorial (- n 1)) n)
;;                 evaluates to n*(n-1)! == n!, and we can see that (factorial n) terminates with the correct value for
;;                 any arbitrary positive nonzero n, under the inductive hypothesis of correct operation for smaller
;;                 arguments.
;;
;; Conclusion: Therefore, by mathematical induction on n, (factorial n) terminates with the value n! for any positive
;;             nonzero integer n.

;; ex 2.3
;;(define square ; another version that doesn't work
;;  (lambda (n)
;;    (if (= n 0)
;;        0
;;        (+ (square (- n 2))
;;           (- (* 4 n) 4)))))
;; The proof runs into issues for (square n) when n is odd.  When (square (- n 2)) this can cause (square k) to be
;; called where k<0.  In this case square will not terminate.

;; ex 2.4
;; (square (/ n 2)) We can assume to get (n/2)^2 or n^2/4.  Seeing this we simply need to multiply by 4 to get to n^2
(define square
  (lambda (n)
    (if (= n 0)
        0
        (if (even? n)
            (*
             (square (/ n 2))
             4)
            (+ (square (- n 1))
               (- (+ n n) 1))))))