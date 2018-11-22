#lang racket

(define tlist '(A B C D E F G H))
(define Alpha '((#\A #\a ".- ") (#\B #\b "-... ") (#\C #\c "-.-. ")
                (#\D #\d "-.. ") (#\E #\e ". ") (#\F #\f "..-. ")
                (#\G #\g "--. ") (#\H #\h ".... ") (#\I #\i ".. ")
                (#\J #\j ".--- ") (#\K #\k "-.- ") (#\L #\l ".-.. ")
                (#\M #\m "-- ") (#\N #\n "-. ") (#\O #\o "--- ")
                (#\P #\p ".--. ") (#\Q #\q "--.- ") (#\R #\r ".-. ")
                (#\S #\s "... ") (#\T #\t "- ") (#\U #\u "..- ")
                (#\V #\v "...- ") (#\W #\w ".-- ") (#\X #\x "-..- ")
                (#\Y #\y "-.-- ") (#\Z #\z "--.. ") (#\space #\space " ")))
(define upper (map first Alpha))
(define lower (map second Alpha))
(define mcode (map last Alpha))


; To find if it's a member or not
(define member? (λ (c d) (cond
                         ((empty? d) #f)
                         ((equal? c (first d)) #t)
                         (#t (member? c (rest d))))))

; To find position in a list
(define pos1? (λ (e f g) (cond
                          ((empty? f) g)
                          ((not (equal? e (first f))) (pos1? e (rest f) (+ g 1)))
                          ((equal? e (first f)) g)
                          (#t (pos1? e (rest f) g)))))
(define pos? (λ (h i) (pos1? h i 0)))


; Recursion for single member morse code
(define morse2 (λ (j) (list-ref mcode (pos? j
                                            (cond
                                              ((member? j upper) upper)
                                              ((member? j lower) lower))))))

; Recursion for string Morse code
(define morse1 (λ (k) (cond
                       ((string? k)
                        (map morse2 (string->list k)))
                       (#t "INVALID INPUT"))))


;Using for loop to get the letters printed out
;lst->morse
(define morse (λ (l)
                  (for ([i (morse1 l)])
                    (printf i))))

