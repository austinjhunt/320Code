

(define (make_list_of_size n e)
  
   (if (not (equal? n 0)) (cons e (make_list_of_size (- n 1) e)) ()))
   
    
(make_list_of_size 4 'r)
(make_list_of_size 3 '(1 a))




; testing foldr; foldr can be used to "summarize" or pull together a list through a single function, like adding: 
(define qux (list 1 2 3 4 5 ) ) 
(foldr + 0 qux ) ; format: (foldr (function to perform; adding all elements of list together) (starting value) (list) )

                                                        ;use foldr to count 0s in passed list
(define (zeros simpleList)
  (foldr  
   (lambda (element zeroCounter)                        ; define procedure to be used to "fold" the list; could use lambda or define independent function, as shown below; need counter
   (if (zero? element) (+ 1 zeroCounter) zeroCounter))
   0                                                    ;counter to start at 0 
   simpleList)                                          ; list to "fold"
  )

(zeros '(1 2 3 0 4 40 0 8 48 2 0 3 0 1)) ; should return 4
(zeros null); should return 0
(zeros '(000000000)) ; should return 1
(zeros '(0 10 01)) ; should return 1


; dependent functions ; newZeros depends on countZero (incrementer) 

(define (countZero element counter)
  (if (equal? 0 element) (+ 1 counter) counter)) 

(define (newZeros simpleList)
  (foldr
   (countZero (element 0))
   0
   simpleList))

(zeros '(1 2 3 0 4 40 0 8 48 2 0 3 0 1 0 0 0 0 0 0 0 0 0 0))
(zeros null) 

;now have two defined functions above for counting zeros in list, one with lambda function, one with function dependency




(define (power a b)
  (if (zero? b) 1
      (cond
        [(> b 0) (* a (power a (- b 1)))]
        [(< b 0) (* (/ 1 a) (power a (+ b 1 )))]
        )
      ))
    


(power 2 -3)
(power 3 -4)
(power 4 -2)
(power 0 1)
(power 0 0 )
(power 5 10) 




(define (myremove list atom)
  (if (null? list) null
      (if (eqv? atom (car list)) (myremove (cdr list) atom) (cons (car list) (myremove (cdr list) atom)))))
          
         

   
(myremove '(x h x e l x l x o x h o w a x r x e y x o u x ? (x h x e l l x o x) x) 'x )
(myremove '(no 911 no was no an no inside no job no) 'no)
(myremove '(i delete wanna delete go delete fast ) 'delete)











(define (largest list)
  (cond
    ((null? list) null) ; return null list if null/empty
    ((null? (cdr list)) (car list)) ;if only one element, return that element
    ((< (car list) (car (cdr list))) (largest (cdr list))) ; if current element less than next element, call largest on next portion of list
    (else (largest (cons (car list) (cdr (cdr list))))))) ; if current element >= next element, then next element
; is not max, so call (largest) on list with current element and rest of list beyond the next element (i.e. compare current element with element after next) 

(largest '(-100 -99 -233 -2 -1 0 -40)) 
(largest '(1 3 5 6 8 10 1 ) )
(largest '())
(largest null)
(largest '(45 67 84 54 30 100 3 -1 5 -67 78 94 33 101 99 104 0 42 36 86 -10504 38 89))



