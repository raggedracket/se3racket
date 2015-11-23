#lang racket

; Blatt 05
;
; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

(require se3-bib/butterfly-module)

;##### Aufgabe 1 - #####
;
; Wir wollen eine Funktion definieren, die als Parameter
; die dominanten Gene beider Eltern entgegennimmt.
;
; Folgende Schritte muessen wir durchfuehren:
;
;   1.  generieren der rezessiven Gene beider Eltern
;       unter Beruecksichtigung der Dominanzregeln.
;
;   2.  Fuer jedes zu erzeugende Kind:
;
;       2a) die Liste der Eigenschaften von der Mutter
;           und vom Vater bestimmen.
;
;       2b) Mit Hilfe der Dominanzregeln die dominanten Eigenschaften bestimmen.
;
;   3. Ausgabe der Eltern sowie Kinder
;
; Repraesentation eines Schmetterlings.
;     Ein Schmetterling wird definiert durch die Liste seiner dominanten und rezessiven
;     Eigenschaften. Die Reihenfolge der Elemente muss fix sein. (Bei Eltern fehlt
;     die Liste der resessiven Eigenschaften und muss zufaellig erzeugt werden.)
;
; Folgendes wird benoetigt
;  -- Liste der Merkmale soriert nach Dominanz
;
;  -- Funktion, die bei Eingabe zweier Merkmale, das Dominante ausgibt
;
;  -- Funktion zur Ausgabe aller moeglichen rezessiven Merkmale zu einem
;     gegebenem Dominanten
;
;  -- Funktion zur zuf. Generierung der rezessiven zu den dominanten Merkmalen
;
;  -- Funktion, die aus dominanten und rezessiven Merkmalen eines Elternteils fuer
;     jedes Merkmal eins auswaehlt und diese als Liste zurueckgibt
;
;  -- Funktion, die aus zwei Genomen die Liste der dominanten Merkmale erstellt
;
;  -- Die zu entwerfende Funktion, welche die oberen Schritte mit Hilfe der
;     genannen Funktionen ausfuehrt und die Eltern sowie Kinder ausgibt.
;
;


;Listen der Merkmale (sortiert nach Dominanz)
(define farbe    '(red green blue yellow))
(define muster   '(dots stripes stars))
(define fuehler  '(straight curved curly))
(define fluegel  '(rhomb hexagon ellipse))

(define merkmale (list farbe muster fuehler fluegel))



; Listet alle moeglichen rezessiven Merkmale zu einem
; gegebenem Dominanten
;
; dom_merkmal: dominantes Merkmal
; merkmalliste: Liste des Merkmals
(define (rez_merkmale dom_merkmal merkmalliste)
  (memf (lambda (arg)
          (equal? arg dom_merkmal))
        merkmalliste))


; Generiert fuer eine geg. Liste dominanter Merkmale Rezessive
;
; xs_dom: Liste dominanter Merkmale
; merkmale: Liste der merkmal-listen (ben. fuer Rek.)
(define (gen_rez_merkmale xs_dom merkmale)
    (if (empty? xs_dom)
        '()
        (cons
            (car (shuffle (rez_merkmale
                           (car xs_dom)
                           (car merkmale))))
            (gen_rez_merkmale
             (cdr xs_dom)
             (cdr merkmale)))))


; Gibt fuer die zwei gegebenen Merkmale das dominantere zurueck
;
; alel1 alel2: die einzelnen Merkmale
; merkmale: Liste der merkmal-listen (ben. fuer Rek.)
(define (gib_dom alel1 alel2 merkmale)
  (if (not (findf (lambda (x)
                    (or (equal? x alel1)
                        (equal? x alel2)))
                  (car merkmale)))
      (gib_dom alel1 alel2 (cdr merkmale))
      (findf (lambda (x)
                    (or (equal? x alel1)
                        (equal? x alel2)))
                  (car merkmale))))


; Waehlt fuer jedes Merkmal eine der beiden gegebenen Moeglichkeiten aus
;
; xs1 xs2: Listen der Merkmale (dom/rez eines Elternteils)
(define (waehle_merkmale xs1 xs2)
  (if (or (empty? xs1) (empty? xs2))
        '()
        (cons
            (car (shuffle (list (car xs1) (car xs2))))
            (waehle_merkmale (cdr xs1) (cdr xs2)))))


; Generiert aus zwei Genomen die Liste der dominanten Merkmale
;
; xs1 xs2: Listen der Merkmale (Erbe der Elternteile)
(define (erzeuge_kind xs1 xs2)
  (if (empty? xs1)
        '()
        (cons
         (gib_dom (car xs1) (car xs2) merkmale)
         (erzeuge_kind (cdr xs1) (cdr xs2)))))


; Generiert eine Liste aus Listen. Jede dieser repraesentiert ein Kind.
;
; xs1_dom xs1_rez xs2_dom xs2_rez: Liste der Merkmale der Eltern, dominant und rezessiv
; kinder: Anzahl der Kinder
(define (erzeuge_kinder xs1_dom xs1_rez xs2_dom xs2_rez kinder)
  (if (zero? kinder)
        '()
        (cons
         (erzeuge_kind (waehle_merkmale xs1_dom xs1_rez) (waehle_merkmale xs2_dom xs2_rez))
         (erzeuge_kinder xs1_dom xs1_rez xs2_dom xs2_rez (- kinder 1)))))


; Finale Funktion zur Ausgabe der Schmetterlinge
;
; xs_mutter: Liste der Merkmale der Mutter
; xs_vater: Liste der Merkmale des Vaters
; kinder: Anzahl der Kinder
(define (icanhaz_family xs_mutter xs_vater kinder)
  (map
   (lambda (arg)(apply show-butterfly arg))
   (append (list xs_mutter xs_vater)
           (erzeuge_kinder xs_mutter
                           (gen_rez_merkmale xs_mutter merkmale)
                           xs_vater
                           (gen_rez_merkmale xs_vater merkmale)
                           kinder))))



; Zum Testen
(define bfly1 '(red stripes curved rhomb))
(define bfly2 '(green stripes straight hexagon))
(define bfly3 '(blue dots curly rhomb))
(define bfly4 '(yellow stripes curly ellipse))
(define bfly5 '(blue stars straight ellipse))
