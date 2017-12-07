
(car '(P H W)) ;;: P 
(cdr '(B K P H)) ; (K P H) 
(car '((A B) (C D)))  ;(A B) 
(cdr '((A B) (C D)))  ;((C D)) 
(car (cdr '((A B) (C D)))) ; (C D) 
(cdr (car '((A B) (C D)))) ; (B) 
(cdr (car (cdr '((A B) (C D))))); (D) 
(car (cdr (car'((A B) (C D))))); B

(car (cdr (car (cdr '((A B) (C D) (E F)))))); ;D
(car (car (cdr (cdr '((A B) (C D) (E F)))))) ;E
(car (car (cdr '(cdr ((A B) (C D) (E F))))))  ;(A B) 
;(car (car '(cdr (cdr ((A B) (C D) (E F)))))); C or CDR; error car 'cdr doesnt work
(car '(car (cdr (cdr ((A B) (C D) (E F)))))); CAR 
'(car (car (cdr (cdr ((A B) (C D) (E F)))))) ;(CAR (CAR (CDR (CDR ((A B) (C D) (E F)))))) 

; extract pear 
(caddr '(APPLE ORANGE PEAR GRAPEFRUIT))
(caadr '((APPLE ORANGE) (PEAR GRAPEFRUIT)))
(car (caddar'(((APPLE) (ORANGE) (PEAR) (GRAPEFRUIT)))))
(car(caaddr '(APPLE (ORANGE)  (  (PEAR)   (((GRAPEFRUIT))))  )))
(caaddr '((((APPLE))) ((ORANGE)) (PEAR) GRAPEFRUIT))
(cadar '((((APPLE) ORANGE) PEAR) GRAPEFRUIT))


;Complete the following functional programming exercises using Scheme:

;Write a tail-recursive function to compute the length of an arbitrary list.

(define (getLenHelp mylst len)
  (if (null? mylst) len (getLenHelp (cdr mylst) (+ 1 len))))
  

(define (getLen mylst)
  (getLenHelp mylst 0 ))

 (require racket/trace)
(trace getLenHelp)
(getLen '(1 2 3 4 5 6 8 9 0 1) ) 


;Write a function that computes the maximum and minimum of a list of integers.
(define (getMaxHelper mylst max)
  (if (null? mylst) max
      (cond
        ((null? max) (getMaxHelper mylst (car mylst)))
        ((> max (car mylst)) (getMaxHelper (cdr mylst) max))
        ((<= max (car mylst)) (getMaxHelper (cdr mylst) (car mylst))))))
(define (getMax mylst)
  (getMaxHelper mylst null) ) 

(trace getMaxHelper)
(getMax '(0 1 -4 10 -466 11 93 24 1 0 -4 47))

(define (getMinHelper mylst min)
  (if (null? mylst) min
      (cond
        ((null? min) (getMinHelper mylst (car mylst)))
        ((< min (car mylst)) (getMinHelper (cdr mylst) min))
        ((>= min (car mylst)) (getMinHelper (cdr mylst) (car mylst))))))
(define (getMin mylst)
  (getMinHelper mylst null) ) 

(trace getMaxHelper)
(getMin '(0 1 -4 10 -46 -47 -45 01 11 93 24 1 0 -4 47))




;Write Mergesort for a list of integers.
(define (merge half1 half2) 
  (if (null? half1) half2 ; if half1 is null return half2 
      (if (null? half2) half1 ;else if half2 is null return half1
          (if (< (car half1) (car half2)) ; if neither of them are null do ur thang; if first of left less than first of right 
              (cons (car half1) (merge (cdr half1) half2)) ; then return list with first of left, and the result of calling merge on (cdr left) and (right)
              (cons (car half2) (merge (cdr half2) half1)))))) ; else return list with first of right and result of calling merge on (cdr right) and (left)
;split helper functions
(define (odd mylst) ; successively calls on cddr mylst, generates a list half of odd length if there are an odd num of elements
  (if (null? mylst) '()
      (if (null? (cdr mylst)) (list (car mylst))
          (cons (car mylst) (odd (cddr mylst)))))); basically create list with first, third, fifth etc elements


(define (even mylst); successively calls on cddr mylst, generates a list half of even length 
  (if (null? mylst) '() ; if list is empty, return list
      (if (null? (cdr mylst)) '() ; if one element in list, return empty, odd will take care of this 
                 (cons (cadr mylst) (even (cddr mylst)))))); basically create list with second, 4th, 6th etc elements
      
;; Exp. (split '(a b c d e f g h i)) ==> ((a c e g i)(b d f h))
(define (split mylst)
	(cons (odd mylst) (cons (even mylst) `())))   ; append odd length and even length halves   

;; Exp. (mergesort '(8 1 3 9 6 5 7 2 4 10)) ==> (1 2 3 4 5 6 7 8 9 10)
(define (mergesort2 mylst)
	(if (null? mylst) mylst
		(if (null? (cdr mylst)) mylst ; one element
			(merge ; merge sorted halves
				(mergesort2 (car (split mylst))) ; merge sort first half 
				(mergesort2 (cadr (split mylst))))))) ; merge sort second half

;(trace merge)
;(trace mergesort2)
;(trace split)
;(trace even)
;(trace odd)

(mergesort2 '(4 0 7 83 1 3 5 3 -1 6 -23 -4 9 19 24 5 37)) 

;Define a Scheme function make_list_of_size that takes as parameters an integer n and an expression e and
;constructs a list consisting of n copies of e. Thus (make_list_of_size 4 'x) would yield as its return value the list (x x x x).
;Similarly (make_list_of_size 3 '(1 a)) would yield as its return value ((1 a) (1 a) (1 a))

(define (make_list_of_size_helper currentval finalN expression lst)
  (if (eqv? finalN 0) '()
      (if (< currentval finalN) (make_list_of_size_helper (+ 1 currentval) finalN expression (cons expression lst)) lst)))
(define (makeListofSize n e)
  (make_list_of_size_helper 0 n e '()) )

(trace makeListofSize)
(trace make_list_of_size_helper)
(makeListofSize 10 '(1 a))
(makeListofSize 0 '(1 a))
(makeListofSize 1 '(1 a))



;Define a Scheme function zeros that returns the number of zeros in a given simple list of numbers ("simple list" means no lists within lists, etc.)
(define (zerosHelper mylst numzeros)
  (if (null? mylst) numzeros
      (if (eqv? (car mylst) 0) (zerosHelper (cdr mylst) (+ 1 numzeros)) (zerosHelper (cdr mylst) numzeros))))
(trace zerosHelper)

(define (zeros mylst)
  (zerosHelper mylst 0) ) 
(zeros '(1 1 1 1 1 10 0 1 0 2 3 0 4 01 013 00))
;Define a Scheme function power that takes two numeric atoms a and b, where b is an integer, and returns a raised to the b power.  Note, 0 and negative integers are valid values for b.
(define (powerHelper a b currentiterations value)
  (if (eqv? 0 b) 1
      (if (eqv? 1 b) a
          (if (< currentiterations (- b 1)) (powerHelper a b (+ 1 currentiterations) (* value a)) value))))
(define (power a b)
  (powerHelper a b 0 a))

(trace powerHelper)

(power 2 8) 
  


;Define a Scheme function remove that takes a list and an atom as parameters and returns a list that is identical to the given one except with all top-level instances of the given atom deleted.  Thus, (remove '(1 2 a (a b) a 3) 'a) would return the list '(1 2 (a b) 3).

;(define (removeH mylst myatom newlst)
;  (if (null? mylst) newlst
;      (if (eqv? (car mylst) myatom) (removeH (cdr mylst) myatom newlst)
;          (removeH (cdr mylst) myatom (list newlst (car mylst))))))
;(define (removeAtom mylst atom)
;  (removeH mylst atom '()))

;(trace removeH)

;(removeAtom '(1 1 1 2 3 4 -1 4 5 82 473 4 293 6 gf a 16 23 -13 1 45 2 3 2 88) 2)



;Define a Scheme function largest that takes a simple list of numbers as a parameter (possibly empty) and returns the largest value in this list.  If the given list is empty, return the empty list.




;Write a function that increments each element of LIS by one, and return that as a new list
(define (incrementAll LIS)
  (map (lambda (n) (+ 1 n)) LIS))

(trace incrementAll)
(incrementAll '(1 2 3 4 5 6 7 8 9 10)) 

  
;Write a function that sums the numbers from 1 to n

(define (sum1toN n m currentsum )
  (if (eqv? 0 n) 0
      (if (eqv? 1 n) 1
          (if (eqv? n m) (+ n currentsum)
              (sum1toN n (+ 1 m) (+ currentsum m))))))
(trace sum1toN)
; don't input negatives! 
(sum1toN 6 1 0)

;Write a function that sums all the elements in a list
(define (sumList mylst sum)
  (if (null? mylst) sum
      (sumList (cdr mylst) (+ sum (car mylst)))))

(trace sumList)
(sumList '(1 2 3 4 5) 0 )
  
;Write a function that swaps the first two elements in a list.

(define (swapFirstTwo myLst)
  (cons (cadr myLst) (cons (car myLst) (cddr myLst))))
(trace swapFirstTwo)
(swapFirstTwo '(1 2 3 4 5))
      

;Then try to make each function tail-recursive and prove it to yourself with trace. If you can’t make something tail recursive, why not?