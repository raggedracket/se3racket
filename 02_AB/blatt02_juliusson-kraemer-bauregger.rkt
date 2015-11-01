#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

;##### Aufgabe 1 - #####
(define miau 'Plueschi)
(define katze miau)
(define tiger 'miau)

(define (welcherNameGiltWo PersonA PersonB)
	(let
 		(
			(PersonA 'Sam)
 			(PersonC PersonA)
 		)
    PersonC)
)

(define xs1 '(0 2 3 miau katze))
(define xs2 (list miau katze))
(define xs3 (cons katze miau))

;# 1.01 miau
; Evaluiert auf das Symbol Plueschi, da so definiert (define miau 'Plueschi)
;
; -> 'Plueschi

;# 1.02 katze
; Evaluiert auch zu 'Plueschi, da katze als der Wert von miau definiert ist und miau auf 'Plueschi zeigt
;
; -> 'Plueschi

;# 1.03 tiger
; Evaluiert zu 'miau, da laut Def. tiger auf das Symbol "miau" zeigt
;
; -> 'miau

;# 1.04 (quote katze)
; (quote ABC) ist gleichbedeutend mit 'ABC bzw.
; die Funktion quote gibt zu einem gegebenem Symbol eben das Symbol selbst zurueck.
;
; -> 'katze

;# 1.05 (eval tiger)
; Dieser Ausdruck evaluiert zu 'Plueschi, da tiger zu 'miau evaluiert und
; eval jedes Symbol zu seinem Wert auswertet.
; Somit evaluiert tiger -> 'miau, und (eval 'miau) -> 'Plueschi
;
; -> 'Plueschi

;# 1.06 (eval katze)
; Dieser Ausdruck gibt einen Fehler aus.
; katze evaluiert zu 'Plueschi aber (eval 'Plueschi) schlaegt fehl, da
; das Symbol Plueschi nirgends definiert und somit auch nicht
; zu seinem Wert ausgewertet werden kann.
;
; Error Plueschi: undefined


;# 1.07 (eval 'tiger)
; Wie bei 1.05 nur, dass mit 'tiger das Symbol selbst gemeint ist
; und nicht zu seinem Wert 'miau evaluiert.
; Somit ergibt sich (eval 'tiger) -> 'miau
;
; -> 'miau

;# 1.08 (welcherNameGiltWo 'harry 'potter)
; Die Funktion welcherNameGiltWo beinhaltet ein let
; Dieses nimmt immer den Wert von PersonC an. Vorab ist PersonC als PersonA definiert
; und PersonA als 'Sam. Da die Definitionen in let erst zu Beginn des body's gelten,
; evaluiert PersonC zu dem Wert von PersonA.
; Somit evaluiert die Funktion immer zum Wert von PersonA.
;
; -> 'harry

;# 1.09 (cdddr xs1)
; xs1 ist also Liste definiert. In Racket ist eine Liste rekursiv
; ein Paar mit dem ersten Element und dem Rest der Liste. Der Ausdruck
; (cdddr xs1) laesst sich auch schreiben als (cdr (cdr (cdr xs1))).
; Jedes cdr evaluiert zur Subliste der gegebenen Liste.
; Somit evaluiert cdddr zur dritten Subliste.
; 
; -> '(miau katze)

;# 1.10 (cdr xs2)
; miau und katze werden schon bei der Definition von xs2 zu Plueschi ausgewertet.
;  Es gitl auch: (equal? xs2 '(Plueschi Plueschi)) -> #t
; (cdr xs2) evaluiert zur Subliste '(Plueschi)
;
; -> '(Plueschi)

;# 1.11 (cdr xs3)
; xs3 ist ein Paar der Werte von katze und miau
;  Es gilt auch: (equal? xs3 '(Plueschi . Plueschi)) -> #t
; wendet man cdr auf ein Paar an, so erhaelt man das zweite Element des Paares
;
; -> 'Plueschi

;# 1.12 (eval (sqrt 3))
; Racket evaluiert den Ausdruck (squrt 3), berechnet also die Wurzel von 3.
;
; -> 1.7320508075688772

;# 1.13 (eval '(welcherNameGiltWo 'tiger 'katze))
; eval nimmt Repräsentationen von Ausdruecken entgegen und evaluiert diese.
; Somit passiert hier nichts anderes als der Aufruf bei 1.08.
;
; -> 'tiger

;# 1.13 (eval (welcherNameGiltWo 'katze 'tiger))
; Bei diesem Ausdruck wird zuerst die innere Funktion welcherNameGiltWo
; zu 'katze ausgewertet. Das eval wertet 'katze nun zu 'Plueschi aus.
;
; -> ’Plueschi

;##### Aufgabe 2 - #####

;### 2.1 ###

