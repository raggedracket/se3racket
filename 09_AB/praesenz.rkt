#lang swindle


(defclass* temp ()
  (value
   :reader giveval
   :initarg :value)
  (unit
   :reader giveunit
   :initarg :unit))

(define (make-temp temp unit)
  (cons temp unit))

(define (temp-unit temp)
  (cdr temp))
(define (temp-val temp)
  (cdr temp))

(define (celsius->kelvin temp)
  (+ temp 273.15))

(define (fahrenheit->celsius temp)
  (* (- temp 32) (/ 5 9)))

(define (fahrenheit->kelvin temp)
  (celsius->kelvin (fahrenheit->celsius (temp-val temp))))

(define (temp->kelvin temp)
  (cond ([(equal? (temp-unit temp) 'Ḱ) temp]
         [(equal? (temp-unit temp) 'C)
          (make-temp (celsius->kelvin (temp-val temp)) 'K)]
         [(equal? (temp-unit temp) 'F) 
          (make-temp (fahrenheit->kelvin (temp-val temp)) 'K)])))

(define liste '((1 . 'C)(4 . 'C)(5 . 'K)(10 . 'F)))

(make-temp (let ((x (foldl (lambda (x acc) (cons (+ (temp-val x) (car acc))
                              (+ 1 (cdr acc)))) '(0 . 0) (map temp->kelvin liste))))
             (/ (car x) (cdr x))) 'K)
