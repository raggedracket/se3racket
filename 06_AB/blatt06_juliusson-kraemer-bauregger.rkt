#lang racket

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

;##### Aufgabe 1 - #####

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