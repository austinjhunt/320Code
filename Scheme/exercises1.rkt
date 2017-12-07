(car '(P H W)) ; 1 

(cdr '(B K P H) ) ;2 

(car '((A B) (C D))) ;3 

(cdr '((A B) (C D))) ;4

(car (cdr '((A B) (C D )))) ;5 

(cdr (car '((A B) (C D)))) ;6 

(cdr (car (cdr '((A B) (C D))))) ;7 

(car (cdr (car '((A B) (C D))))) ;8 E






(car (cdr (car (cdr '((A B) (C D) (E F)))))) ;1 

(car (car (cdr (cdr '((A B) (C D) (E F)))))) ;2 

(car (car (cdr '(cdr ((A B) (C D) (E F)))))) ;3 

;(car (car '(cdr (cdr ((A B) (C D) (E F)))))) ;4 

(car '(car (cdr (cdr ((A B) (C D) (E F)))))) ;5 

'(car (car (cdr (cdr ((A B) (C D) (E F))))));6 





    (car (cdr (car (cdr '((A B) (C D) (E F))))))
    (car (car (cdr (cdr '((A B) (C D) (E F))))))
    (car (car (cdr '(cdr ((A B) (C D) (E F))))))
   
    (car '(car (cdr (cdr ((A B) (C D) (E F))))))
    '(car (car (cdr (cdr ((A B) (C D) (E F))))))
