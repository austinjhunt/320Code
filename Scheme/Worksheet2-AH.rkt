(require racket/trace)

;used later
(define (getLength lst)
  (getLength2 lst 0))

(define (getLength2 lst count)
  (if (null? lst) count
     ( getLength2 (cdr lst) (+ count 1) ) ) ) 
;1. Write a function that increments each element of LIS by one, and return that as a new list

(define (incrementList LIS)
  (map (lambda (element) (+ 1 element)) LIS) )
;(trace incrementList)
(incrementList '(1 2 3 4 5 6 7 9 0 1) )
(incrementList '(-1 -2 -3 4 8 0 1 00 0000 ) )


; 2 Write a function that sums the numbers from 1 to n
; only works on positive numbers 

(define (sumToNwrk N total)
  (if (zero? N) total
      (sumToNwrk (- N 1) (+ total N))))
(define (sumToN N)
  (sumToNwrk N 0) )

;(trace sumToNwrk)

(sumToN 0)
(sumToN 1)
(sumToN 2)
(sumToN 3)
(sumToN 4)
(sumToN 5)
(sumToN 6)
(sumToN 7)
(sumToN 8)
(sumToN 9)
(sumToN 10)

;Write a quicksort function


     

; need helper method to split list into 3 parts; after comparing, elements are either <, > or = to pivot
(define (split3waysWrk pivot lst lst1 lst2 lst3)
  (cond
    ((null? lst) (list lst1 lst2 lst3))
    ((< (car lst) pivot) (split3waysWrk pivot (cdr lst) (cons (car lst) lst1) lst2 lst3))
    ((> (car lst) pivot) (split3waysWrk pivot (cdr lst) lst1 lst2 (cons (car lst) lst3)))
    ((equal? (car lst) pivot) (split3waysWrk pivot (cdr lst) lst1 (cons (car lst) lst2 ) lst3))))

(define (split3ways pivot lst)
  (if (and (null? (cddr lst)) (not (null? (cdr lst)))) ; if two elements
      (if (< (car lst) (cadr lst)) (list (list(car lst)) (cdr lst))
          (list (cdr lst) (list(car lst))))
      
  (split3waysWrk pivot lst null null null)))

(split3ways 6 '(7 8 0 1 2 3 6 7 3 6 5 9 0 1 ))



;(define (splitUp bool lst )
;  (cond
;    ((null? lst) lst)
;;    ((bool (car lst)) (cons (car lst) (splitUp bool (cdr lst))))
;    (else (splitUp bool (cdr lst)))))
;
;(define (qkSort lst)
;  (cond
 ;   ((null? lst) lst)
    ;(else (let ((pivot (car lst)))
            ;j(append (append (qkSort (splitUp (lambda (x) (< x pivot)) lst))
               ;             (splitUp (lambda (x) (= x pivot)) lst))
   ;                 (qkSort (splitUp (lambda (x) (> x pivot )) lst)))))))


(define (qkSort lst accumList)
  (cond
    ((null? lst) lst)
    (else
       (split3ways (car lst) lst))))
;I have a splitter method and I want to recursively call this method on each sublist that's returned but I don't know how.      
      

    
(trace qkSort)
(qkSort  '(7 8 0 1 2 3 6 7 3 6 5 9 0 1) null)




;4 Write a function that sums up all elements in a list, use foldr

(define (sumList lst)
  (foldr
   (lambda (element total)
     (+ total element) )
   0
   lst))
(trace sumList)
(sumList '(1 2 3 5 0 1 9 ) )
(sumList '(-4 -4 -4))
(sumList '(-3 0 1 2 3 ))
(sumList '(-1 2 -1))




;5 Write a function that counts all the atoms in a list where the list can have nested lists (e.g. '(1 (2 (3)) (5)) has 4 atoms in it, so the function would return 4

(define (countAtomsWrk outerlst counter original1 original2)
  (cond
    ((and (null? outerlst) (not(null? original1)) ) (countAtomsWrk (append original1 original2) counter null null))
    ((and (null? outerlst) (not(null? original2)) ) (countAtomsWrk (append original1 original2) counter null null))
    ((null? outerlst) counter)
    ((list? (car outerlst)) (countAtomsWrk (car outerlst) counter (append original1 original2) (cdr outerlst)))
    (else
     (countAtomsWrk (cdr outerlst) (+ 1 counter ) original1 original2))))

(define (countAtoms lst)
  (countAtomsWrk lst 0 null null)) 


(trace countAtomsWrk) 
(countAtoms '(1 (2 (3)) (5)))
(countAtoms '(1 2 3 4))
(countAtoms '(1 (2 (3 (4)))5 6 (8 9)))
(countAtoms '(1 (2) (3 4 (5 (6 ( 8 9 ) ) 6 ) ) 3 )) 
; 6 Write a function that takes two lists, returns -1 if both are null, returns length of longest if otherwise


(define (compareLists lst1 lst2 )
  (if (and (null? lst1 ) (null? lst2)) -1
      (if (< (getLength lst1) (getLength lst2)) (getLength lst2) (getLength lst1))))

(trace getLength)
(compareLists '() '())
(compareLists null null)
(compareLists '(1 2 3) '(1 2 3) )
(compareLists '(1 2 3) '(1 2 3 4))
(compareLists '(1 2 3 4) '(1 2 3))

;7. Write a function that swaps the first two elements in a list

(define (swapFirstTwo lst)
  (cond
    ((null? lst) lst)
    ((null? (cdr lst)) (car lst))
    (else
     (append (cons (cadr lst) (cons(car lst) ())) (cddr lst)))))



(trace swapFirstTwo)
(swapFirstTwo '(1 2 3 4 5 ) )
(swapFirstTwo '(1))
(swapFirstTwo ())
(swapFirstTwo '())
(swapFirstTwo '(1 2))
(swapFirstTwo '((1 2 ) (3 4) 5 6 7 8 9 ))


;8 Try to make each of these functions tail recursive


;1 increment list, tail recursive      
(define (incList2.1 firstPart lst )
  (if (null? lst) firstPart
       (if (list? firstPart) (incList2.1 (append firstPart (cons (+ 1 (car lst)) ()))  (cdr lst) ) (incList2.1 (append firstPart (+ 1 (car lst))) (cdr lst)))))

(define (incList lst)
  (incList2.1 null lst))

;(trace incList)
(incList '(1 2 3 4 5 6 7 8 9 0) )
(incList '(-1 -2 -3 -4 9 10) )

;2 sumtoN already tail recursive

;3

;4 tail recursive sumlist
(define (tailSumListWrk lst total)
  (if(null? lst) total
     (tailSumListWrk (cdr lst) (+ total (car lst)))))

(define (tailSumList lst)
  (tailSumListWrk lst 0) )

(trace tailSumListWrk)
(tailSumList '(1 2 3 4 5 6 7 8 9 10 11 12))


; 5 count atoms already tail recursive 

;6 I don't know how you would (or if you could) implement the compareLists method tail-recursively

;7 Swapfirst2 tail recursive

(define (swapFirstTwoWrk inputlst newlst)
  (cond
    ((null? inputlst) inputlst)
    ((null? (cdr inputlst)) (car inputlst))
    ((not(null? newlst)) newlst)
    (else(
     swapFirstTwoWrk inputlst (append (cons (cadr inputlst) (cons(car inputlst) ())) (cddr inputlst))))))

(define (swapFirstTwo lst)
  (swapFirstTwoWrk lst null))

(trace swapFirstTwoWrk)
(swapFirstTwo '((1 2 3) (4 5 6) 7 8 9 10 11 12))
(swapFirstTwo '(1 2 3))
     
    
     
      