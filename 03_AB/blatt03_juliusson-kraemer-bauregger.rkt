#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

(require se3-bib/flaggen-module)

;##### Aufgabe 1 - #####

;### 1.1 ###
;Diese Liste weist jedem Buchstaben sowie den Zahlen 1-9 und Punkt und Komma einen Schlüssel zu.
;Diese ist als Liste von Listen gestaltet, um Listenbefehle und -operationen
;wie assoc und reverse benutzen zu können.
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
     (#\0 Nadazero)
     (#\1 Unaone)
     (#\2 Bissotwo)
     (#\3 Terrathree)
     (#\4 Kartefour)
     (#\5 Pantafive)
     (#\6 Soxisix)
     (#\7 Setteseven)
     (#\8 Oktoeight)
     (#\9 Novenine)
     (#\, Decimal)
     (#\. Stop) ))


;### 1.2 ###
;Findet einen Char in der Liste und gibt den zugehörigen Schlüssel aus.
(define (buchstabiere char)
  (car (reverse (assoc (char-upcase char) *buchstabiertafel))))


;### 1.3 ###
;Übersetzt den gegebenen char in einen Integer-Wert. Wenn der char im Bereich der
;Kleinbuchstaben (zwischen 97 und 122) liegt wird er durch Subtraktion der Anzahl
;von Buchstaben zwischen den jeweiligen Groß- und Kleinbuchstaben (32) zu einem
;Großbuchstaben gemacht und wieder zu einem char gemacht.
(define (uppercase char)
  (if
   (and
    (char? char)
    (>= (char->integer char) 97)
    (<= (char->integer char) 122))
   (integer->char (- (char->integer char) 32))
   char)
)


;### 1.4 ###
;Fügt einen String aus dem Schlüssel des ersten Buchstabens zusammen,
;lässt dann den ersten buchstaben abschneiden und ruft sich rekursiv erneut auf,
;bis nur der leere String übrigbleibt.
(define (buchstabieretext text)
    (string-append
        (symbol->string (buchstabiere (car (string->list text))))
        " "
        (if (> (string-length text) 1)
            (buchstabieretext (cutstring text))
            "")
    )
)

;Wandelt den String in eine Liste um, entfernt das erste Element und gibt wieder einen String zurück
(define (cutstring text)
  (list->string (cdr (string->list text))))

;##### Aufgabe 2 - #####

;### 2.1 ###
;Diese Liste weist jedem Buchstaben sowie den Zahlen 1-9 und Punkt und Komma einen Schlüssel zu,
;aus dem das Flaggenpaket eine Flagge machen kann.
;Diese ist als Liste von Listen gestaltet, um Listenbefehle und -operationen
;wie assoc und reverse benutzen zu können.
(define *flaggenalphabet
  '((#\A A )
    (#\B B )
    (#\C C )
    (#\D D )
    (#\E E )
    (#\F F )
    (#\G G )
    (#\H H )
    (#\I I )
    (#\J J )
    (#\K K )
    (#\L L )
    (#\M M )
    (#\N N )
    (#\O O )
    (#\P P )
    (#\Q Q )
    (#\R R )
    (#\S S )
    (#\T T )
    (#\U U )
    (#\V V )
    (#\W W )
    (#\X X )
    (#\Y Y )
    (#\Z Z )
    (#\0 Z0)
    (#\1 Z1)
    (#\2 Z2)
    (#\3 Z3)
    (#\4 Z4)
    (#\5 Z5)
    (#\6 Z6)
    (#\7 Z7)
    (#\8 Z8)
    (#\9 Z9)))

;### 2.2 ###
;Findet einen Char in der Liste und gibt die dazugehörige Flagge aus.
(define (flagge char)
  (eval (car (reverse (assoc (char-upcase char) *flaggenalphabet)))))

;### 2.3 ###
;Wandelt den Eingabestring in eine liste um und ruft dann damit die Funktion flaggenlist auf.
(define (flaggentext text)
  (flaggenlist (string->list text)))
  
;Erstellt rekursiv eine Liste durch Aneinanderreihung von Paare, indem immer die Flagge
;des ersten Listenbuchstaben mit (flaggenlist RestDerListe) und schließlich zum Abschluß
;dem leeren Paar gepaart werden.
(define (flaggenlist xs)
  (if (empty? xs)
    '()
    (cons
     (flagge (car xs))
     (flaggenlist (cdr xs)))))
     
