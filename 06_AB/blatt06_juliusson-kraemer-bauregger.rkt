#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

(require 2htdp/image)
(require lang/posn)

;##### Aufgabe 1 #####

;##kopfstueck##
; lineare Rekursion: Ja, das Rekursionsergebnis wird durch cons mit dem ersten Listenelement gepaart.
; Baum-Rekursion: Nein, es gibt nur einen rekursiven Aufruf.
; geschachtelte Rekursion: Nein, es werden keine rekursiven Funktionsaufrufe als Argument übergeben.
; direkte Rekursion: Ja, da linear und repetetiv.
; indirekte Rekursion: Nein, es wird keine andere rekursive Funktion aufgerufen.

;##endstueck##
; lineare Rekursion: Nein, das Rekursionsergebnis wird nicht verrechnet, da die Funktion entfernt.
; Baum-Rekursion: Nein, es gibt nur einen rekursiven Aufruf.
; geschachtelte Rekursion: Nein, es werden keine rekursiven Funktionsaufrufe als Argument übergeben.
; direkte Rekursion: Ja, da repetitive Rekursion (ruft sich erneut mit verändertem Parameter auf)
; indirekte Rekursion: Nein, es wird keine andere rekursive Funktion aufgerufen.

;##merge##
; lineare Rekursion: Ja, das Rekursionsergebnis wird durch cons mit cx/cy gepaart.
; Baum-Rekursion: Nein, es gibt zwar 2 rekursive Aufrufe als Teil einer Condition, es wird jedoch immer nur einer ausgeführt.
; geschachtelte Rekursion: Nein, es werden kein Funktionsaufruf als Argument übergeben.
; direkte Rekursion: Ja, da linear.
; indirekte Rekursion: Nein, es wird keine andere rekursive Funktion aufgerufen.

;##merge-sort##
; lineare Rekursion: Nein, das Rekursionsergebnis wird nicht verrechnet
; Baum-Rekursion: Ja, da im Aufruf von merge 2 Aufrufe von merge-sort auftauchen.
; geschachtelte Rekursion: Ja, da die merge-sort Aufrufe Argumente des Aufrufs von merge sind.
; direkte Rekursion: Nein, da der erneute Aufruf bei der Ausführung von merge statfindet.
; indirekte Rekursion: Ja, da merge aufgerufen wird und merge durch die als Argumente übergebenen Funktionsaufrufe wieder merge-sort aufruft.


;##### Aufgabe 2 #####

;##### 2.2

; First try - does not work
; Please do not evaluate
;
; Throws an arity mismatch, why?
;
;   ord: function to order elements
;   xs: list to sort
(define (quick-sort-faulty ord xs)
  (if (empty? xs)
      xs
      ;we get an arity mismatch here, why?
      ;partition returns two lists and the lambda function takes two arguments
      (call-with-values
       (partition (lambda (element)
                    (ord element (car xs))) xs)       
       (lambda (xs_ord xs_notord)
         (append
          (quick-sort-faulty ord xs_ord)
          (list (car xs_notord))
          (quick-sort-faulty ord (cdr xs_notord)))))))


; Sort the given list with quick sort
;   ord: function to order elements
;   xs: list to sort
(define (quick-sort ord xs)
  (if (empty? xs)
      xs
      ;partition the list by pivot (which is the first element of the given list)
      (let-values ([(xs_in xs_out) (partition (lambda (x)(ord x (car xs))) xs)])
        (append (quick-sort ord xs_in)
                (list (car xs_out))               ;the pivot is still the first element in xs_out
                (quick-sort ord (cdr xs_out)))))) ;remove pivot and sort the rest


;##### 2.1

; Sort the given list with insertion sort
;   ord: function to order elements
;   xs: list to sort
;   xs_sorted: recursion/call function with '()
(define (insertion-sort ord xs xs_sorted)
  (if (empty? xs)
      xs_sorted
      (insertion-sort ord (cdr xs)
                      (let-values ([(xs_in xs_out) (partition (lambda (x)(ord x (car xs))) xs_sorted)])
                        (append xs_in (list (car xs)) xs_out)))))


;##### 2.3

;Some images
(define icons
  (list
   (star-polygon 35 5 2 "solid" "gold")
   (ellipse 44 44 "solid" "red")
   (rectangle 38 38 "solid" "blue")
   (isosceles-triangle 45 65 "solid" "darkgreen")))

;Some more images
(define icons2
  (list
   (isosceles-triangle 40 80 "solid" "darkgreen")
   (ellipse 44 44 "solid" "red")
   (rectangle 15 15 "outline" "red")
   (star-polygon 35 5 2 "solid" "gold")
   (rectangle 38 38 "solid" "blue")
   (isosceles-triangle 45 65 "solid" "darkgreen")
   (star-polygon 35 5 2 "solid" "gold")
   (isosceles-triangle 50 50 "solid" "darkgreen")))


;comparison functions

;use as ord in insertion/quick sort
;  img_small: one picture (if it is smaller, the function returns #t)
;  img_big: another picture (if it is bigger, the function returns #t)
(define (sort-width-asc img_small img_big)
  (< (image-width img_small) (image-width img_big)))

;use as ord in insertion/quick sort
;  img_small: one picture (if it is smaller, the function returns #t)
;  img_big: another picture (if it is bigger, the function returns #t)
(define (sort-width-desc img_big img_small)
  (< (image-width img_small) (image-width img_big)))

;use as ord in insertion/quick sort
;  img_small: one picture (if it is smaller, the function returns #t)
;  img_big: another picture (if it is bigger, the function returns #t)
(define (sort-height-asc img_small img_big)
  (< (image-height img_small) (image-height img_big)))

;use as ord in insertion/quick sort
;  img_small: one picture (if it is smaller, the function returns #t)
;  img_big: another picture (if it is bigger, the function returns #t)
(define (sort-height-desc img_big img_small)
  (< (image-height img_small) (image-height img_big)))


;Sort pictures by height
;(quick-sort sort-height-desc icons2)

;Sort pictures by width
;(insertion-sort sort-width-asc icons '())


;##### Aufgabe 3 #####

;Erschafft kleine Koch-Schneeflöckchen 
(define (koch-schneeflocke)
  (above
   (beside
    (rotate 60 (koch-curve 3))
    (rotate 300 (koch-curve 3)))
   (rotate 180 (koch-curve 3))))

;Erschafft rekursiv durch viele kleine quadrate eine Koch Kurve
(define (koch-curve n)
  (cond
    [(zero? n) (square 1 "solid" "black")]
    [else
     (beside/align "bottom"
                   (koch-curve (- n 1))
                   (rotate 60 (koch-curve (- n 1)))
                   (rotate -60 (koch-curve (- n 1)))
                   (koch-curve (- n 1)))]))

;Erschafft n zufällig verteilte Schneflocken auf einen von n abhängigen Raum
(define (schneeflocken n)
  (place-images/align
   (make-list n (koch-schneeflocke))
   (make-list n (make-posn (random(* 50 n)) (random(* 50 n))))
   ; generiert leider eine random nummer und diese mal in eine liste
   ; und leider nicht n verschiedene random nummern
   "right"
   "bottom"
   (rectangle (* 100 n) (* 100 n) "solid" "LightCyan") ))