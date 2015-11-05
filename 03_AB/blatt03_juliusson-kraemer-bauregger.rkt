#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

;##### Aufgabe 1 - #####

;### 1.1 ###
;Diese Liste weist jedem Buchstaben sowie den Zahlen 1-9 und Punkt und Komma einen Schlüssel zu.
;TODO: Begründung
(define *buchstabiertafel
  '( (#\A Alfa)
     (#\B Bravo)
     (#\C Charlie)
     (#\D Delta)
     (#\E Echo)
     (#\F Foxtrott)
     (#\G Golf)
     (#\H Hotel)
     (#\I India)
     (#\J Juliett)
     (#\K Kilo)
     (#\L Lima)
     (#\M Mike)
     (#\N November)
     (#\O Oscar)
     (#\P Papa)
     (#\Q Quebec)
     (#\R Romeo)
     (#\S Sierra)
     (#\T Tango)
     (#\U Uniform)
     (#\V Viktor)
     (#\W Whiskey)
     (#\X X-Ray)
     (#\Y Yankee)
     (#\Z Zulu)
     (0 Nadazero)
     (1 Unaone)
     (2 Bissotwo)
     (3 Terrathree)
     (4 Kartefour)
     (5 Pantafive)
     (6 Soxisix)
     (7 Setteseven)
     (8 Oktoeight)
     (9 Novenine)
     (#\, Decimal)
     (#\. Stop) ))

;### 1.2 ###
;Findet einen Char in der Liste und gibt den zugehörigen Schlüssel aus
(define (buchstabiere char)
  (car (reverse (assoc char *buchstabiertafel))))

;### 1.3 ###
;Fügt einen String aus dem Schlüssel des ersten Buchstabens zusammen,
;lässt dann den ersten buchstaben abschneiden und ruft sich rekursiv erneut auf,
;bis nur der leere String übrigbleibt.
(define (buchstabieretext text)
      (string-append (symbol->string (buchstabiere (car (string->list text)))) " " (if (> (string-length text) 1) (buchstabieretext (cutstring text)) "" )))

;Wandelt den String in eine Liste um, entfernt das erste Element und gibt wieder einen String zurück
(define (cutstring text)
  (list->string (cdr (string->list text))))

;##### Aufgabe 2 - #####

;### 2.1 ###

