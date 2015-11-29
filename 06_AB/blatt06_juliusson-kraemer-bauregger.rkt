#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

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


;##### Aufgabe 2.1 #####

(define (insertion-sort ord xs xs_sorted)
  (if (empty? xs)
      xs_sorted
      (insertion-sort ord (cdr xs)
                      (let-values ([(xs_in xs_out) (partition (lambda (x)(ord x (car xs))) xs_sorted)])
                        (append xs_in (list (car xs)) xs_out)))))

;##### Aufgabe 2.2 #####

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
          (quick-sort ord-faulty (cdr xs_notord)))))))


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