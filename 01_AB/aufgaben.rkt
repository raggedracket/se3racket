#lang racket


;##### Aufgabe 1 - Konversionsfunktionen #####

;### 1.1 ###
(define (DEGRtoRAD number)
  (* 2 pi (/ 1 360) number))
(define (RADtoDEGR number)
  (* 360 (/ 1 (* 2 pi) number)))

;### 1.2 ###
;Wandelt Cosinus zu Sinus um
(define (costosin cosa)
  (sqrt(- 1 (expt cosa 2))))

;alpha ist winkel der funktion
(define (my-acos cosa)
  (atan (/ (costosin cosa) cosa)))

;### 1.3 ###
;Wandelt nautische Meilen in km um
(define(nm->km nm)
  (* nm 1.852))


;##### Aufgabe 2 - Grosskreisentfernung und Kurse #####

;### 2.1 ###
(define (distanz breiteA laengeA breiteB laengeB)
  (+
    (*
      (sin (DEGRtoRAD breiteA))
      (sin (DEGRtoRAD breiteB)))
    (*
      (cos (DEGRtoRAD breiteA))
      (cos (DEGRtoRAD breiteB))
      (cos (- (DEGRtoRAD laengeA)(DEGRtoRAD laengeB))))))

(define (distanzAB breiteA laengeA breiteB laengeB)
  (*
    60
    (RADtoDEGR (my-acos (distanz breiteA laengeA breiteB laengeB)))))

;Entfernungsfunktionen:
;Oslo - Hongkong: (distanzAB 59.93 10.75 22.20 114.10)
;San Francisco - Honolulu: (distanzAB 37.75 -122.45 21.32 -157.83)
;Osterinsel - Lima: (distanzAB -27.10 -109.40 -12.10 -77.05)


;### 2.2 ###
(define (anfangskursformel breiteA laengeA breiteB laengeB)
  (my-acos (/
    (-
      (sin (DEGRtoRAD breiteB))
      (*
        (distanzAB breiteA laengeA breiteB laengeB)
        (sin (DEGRtoRAD breiteA))))
    (*
      (cos laengeA)
      (costosin (distanzAB breiteA laengeA breiteB laengeB))))))


;### 2.3 ###

;# 2.3.1
;n nne ne ene e ees es ses s ssw sw wsw w wwn wn nwn
(define (Grad->Himmelsrichtung winkel)
  (cond
    [(< winkel (*  1 11.25)) "n"  ]
    [(< winkel (*  3 11.25)) "nne"]
    [(< winkel (*  5 11.25)) "ne" ]
    [(< winkel (*  7 11.25)) "ene"]
    [(< winkel (*  9 11.25)) "e"  ]
    [(< winkel (* 11 11.25)) "ees"]
    [(< winkel (* 13 11.25)) "es" ]
    [(< winkel (* 15 11.25)) "ses"]
    [(< winkel (* 17 11.25)) "s"  ]
    [(< winkel (* 19 11.25)) "ssw"]
    [(< winkel (* 21 11.25)) "sw" ]
    [(< winkel (* 23 11.25)) "wsw"]
    [(< winkel (* 25 11.25)) "w"  ]
    [(< winkel (* 27 11.25)) "wwn"]
    [(< winkel (* 29 11.25)) "wn" ]
    [(< winkel (* 31 11.25)) "nwn"]
    [else "n"]))

;# 2.3.2
(define (Himmelsrichtung->Grad kuerzel)
  (* 11.25 (cond
    [(equal? kuerzel "n"  )  0]
    [(equal? kuerzel "nne")  2]
    [(equal? kuerzel "ne" )  4]
    [(equal? kuerzel "ene")  6]
    [(equal? kuerzel "e"  )  8]
    [(equal? kuerzel "ees") 10]
    [(equal? kuerzel "es" ) 12]
    [(equal? kuerzel "ses") 14]
    [(equal? kuerzel "s"  ) 16]
    [(equal? kuerzel "ssw") 18]
    [(equal? kuerzel "sw" ) 20]
    [(equal? kuerzel "wsw") 22]
    [(equal? kuerzel "w"  ) 24]
    [(equal? kuerzel "wwn") 26]
    [(equal? kuerzel "wn" ) 28]
    [(equal? kuerzel "nwn") 30]
    [else 0])))
        