
(require racket/trace)

(define (getLength lst)
  (getLength2 lst 0))

(define (getLength2 lst count)
  (if (null? lst) count
     ( getLength2 (cdr lst) (+ count 1) ) ) ) 

(getLength '(1 2 3 3 2 1 0 1 2))
(getLength '())
(getLength '(1) )
(getLength '(12 3 45 ) )




(define (getMax lst)
  (cond 
    ((null? lst) null)
    ((null? (cdr lst)) (car lst))
    ((< (car lst) (cadr lst)) (getMax (cdr lst)))
    (else
     (getMax (cons (car lst) (cddr lst))))))


(define (getMin lst)
  (cond
    ((null? lst) null)
    ((null? (cdr lst)) (car lst))
    ((> (car lst) (cadr lst)) (getMin (cdr lst))) ; a b c d e f ; a > b ; can b be min? yes
    (else
     (getMin (cons (car lst) (cddr lst))))))

(define (get_min_and_max lst)
 (list "max:" (getMax lst) "min:" (getMin lst)))



(get_min_and_max '(56 32 45 27 100 87 56 34 233 8 82 1 0 83028 99 145 342 000 184 -499 -562 0 13 45 67 83 27 65 16 9000000 10000 34 30404))

(get_min_and_max '(1 3 0 -4 -3 4 0100 20 30 -48 3 7 10))






(define (split lst )
  (splitThis lst 0 null))



(define (splitThis lst counter firstHalf )
   
      (if (<= counter (/ (getLength lst) 2))
         ( splitThis (cdr lst) (+ counter 1) (cons (car lst) firstHalf ) ) (cons  (cons (car lst) firstHalf ) (cons (cdr lst) () )) ))

(split '(1 2 3 4 5 6 7 8 9 10) ) 
;(define (splitAll lst)
;; (if (equal? (getLength (list(car lst))) 1) lst 
; (map (lambda (element) (splitThis element 0  null)))))

; Dr. Anderson, Correct me if I'm wrong, but: I know the merge sort involves splitting a list in halves recursively until you have one list
; of sublists that are all of length one; SO since you already start with a list of independent elements, they don't need to be recursively split
; up, right? Because all that would do is just add parentheses to the elements. 
; DONT NEED TO SPLIT;
 ;method that merges two lists in sorted order, to be used in the merge sort when sorting pairs instead of atoms
(define (mergeTwoLists lstA1 lstB1 lstA2 lstB2 subMaster)
  (cond
    ((and (null? lstA2) (null? lstB2)) subMaster)
    ((and (null? lstB2) (and(not(null? (car lstA2)))(null? (cdr lstA2)))) (cons subMaster (car lstA2)))
    ((and (null? lstA2) (and(not(null? (car lstB2)))(null? (cdr lstB2)))) (cons subMaster (car lstB2)))
    ((null? lstB2) (mergeTwoLists lstA1 lstB1 (cdr lstA2) lstB2 (cons subMaster (car lstA2))))
    ((null? lstA2) (mergeTwoLists lstA1 lstB1 lstA2 (cdr lstB2) (cons subMaster (car lstB2))))      
    ((<= (car lstA2) (car lstB2)) (mergeTwoLists lstA1 lstB1 lstA2 (cdr lstB2) subMaster))
    ((> (car lstA2) (car lstB2)) (mergeTwoLists lstA1 lstB1 (cdr lstA2) lstB2 subMaster))))



; needed a method to sort the first sublist in master from mergeSort function; first element in master may be unsorted at the
;time that parameters switch values 
(define (basicSort sublst sublst2 sorted)
  (cond
    ((or(null? sublst2)(null? sublst)) (basicSort sorted sorted null))
    ((null? (cdr sublst)) (cons sorted (car sublst)))
    ((>= (car sublst) (cadr sublst)) (basicSort (cons (car sublst) (cddr sublst)) (cdr sublst2) (cons sorted (cadr sublst)))
         (basicSort (cdr sublst) (cdr sublst2)  (cons sorted (car sublst)))))) 


; So, what I do here is go through the list making pairwise comparisons initially, and adding the sorted PAIRS to a "master list", which
; I then pass in as the initial list to merge each pair of pairs into a sorted list, and this continues until the master list is a sorted
;list of every element from initial list (same length -> stop
                                                                               
(define (mergeSort initlst masterlst)
  (cond
    ((null? initlst)
       (basicSort (car masterlst) (car masterlst) null)
       (display masterlst)
       (mergeSort masterlst null))
    ((null? (cdr initlst)) (car initlst))
    ((equal? (getLength initlst) (getLength masterlst)) masterlst)
    ((not(pair? (car initlst)))
     ((< (car initlst) (cadr initlst)) (mergeSort (cddr initlst) (cons(cons (cadr initlst)  (car initlst)) masterlst))) ;; it gives me
     ; an error here about passing in a pair to the < function but it shouldn't be calling this function since i'm asking it to check
     ; the type of the element first (it's a pair, so it should do the functions below)
     (mergeSort (cddr initlst) (cons(cons(car initlst) (cadr initlst)) masterlst)))
    ((or (pair? (car initlst)) (list? (car initlst)))
     (mergeSort (cddr initlst) (cons masterlst (mergeTwoLists (car initlst) (cadr initlst) (car initlst) (cadr initlst) null))))))

     ;Dr. Anderson,
;I'm fairly confident that this is close to working, I just don't understand why it's not type-checking correctly
;before trying to perform operations. What am I missing?
; So far it only creates the master list with the sorted pairs, but I need to proceed with merging the sublists.
     
(trace mergeSort) 
(mergeSort '(10 9 8 7 6 5 4 3 1 2 ) null) 

  
;(splitThis '( 1 2 3 4 5 6 7 8 9 10 ) 0 null )

 

        
     
     




   