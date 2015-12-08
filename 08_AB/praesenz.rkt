#lang racket

(require 2htdp/image)

(define (foo n)
  (make-list n (ellipse 20 20 "solid" "darkgreen")))

(define (bar n)
  (build-list n (lambda (n)(triangle (* 10 (+ 1 n)) "solid" "green"))))

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


(define (foobar n)
  (sort (build-list n (lambda (n)(triangle (* (/ n 2) (random (* (+ 1 n) 20))) "solid" "darkgreen"))) sort-width-asc))

(define (barfoo xs)(foldr above (rectangle 10 20 "solid" "brown") xs))

(foobar 20)

(define (tannenbaum n)
(place-image (barfoo (foobar))
             400 300
             (empty-scene 800 600 )))

(define (loop max n)(modulo n max))

(define (slow factor n)(ceiling ...))