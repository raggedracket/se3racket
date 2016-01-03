#lang swindle

; Otis Juliusson, Jannis Krämer, Maximilian Bauregger
; Raum F-534 - Di, 10:15 - Finn Günther

;##### Aufgabe 1 - #####

(require swindle/setf
         swindle/misc)

(defclass* literature ()
  (key
   :reader givekey
   :initarg :key)
  (authors
   :reader giveauthor
   :initarg :author)
  (year
   :reader giveyear
   :initarg :year)
  (title
   :reader givettle
   :initarg :title)
  :autopred #t
  :printer #t
  :documentation "some kind of literature")

(defclass* book (literature)
  (publisher
   :reader givepublisher
   :writer setpublisher ;in case the book gets a new publisher
   :initarg :publisher)
  (place-of-publication
   :reader giveplaceofpublication
   :writer changepubplace
   :initarg :place)
  (series
   :reader giveseries
   :writer changeseries
   :initarg :series)
  (serialnumber
   :reader giveserial
   :initarg :serial)
  :autopred #t
  :printer #t
  :documentation "a book")

(defclass* anthology (book)
  (anthologist
   :reader giveanthologist
   :initarg :anthologist)
  (position
   :reader giveposition
   :initarg :position)
  :autopred #t
  :printer #t
  :documentation "a collection of literature")


(defclass magazine-article (literature)
  (magazine
   :reader givemagname
   :initarg :magazine)
  (series
   :reader giveseries
   :initarg :series)
  (magazinenumber
   :reader givemagnumber
   :initarg :magnumber)
  (monthofpublication
   :reader givepublicationdate
   :initarg :month
   :initialvalue "")
  :autopred #t
  :printer #t)

(define bibliography1
  (list
   (make book :key 1 :author 'Nessie :year 1970 :title "Mein Leben in Loch Ness"
         :publisher 'Minotity-Verlag :place 'inverness
         :series "Die Besondere Biographie, 2md installment" :serial '11231)
   (make anthology :key 2 :author 'Prefect.F :year 1979
         :title "Mostly harmless - some observations concerning the third planet of the solar sytem"
         :publisher 'Galactic-Press :place 'Vega-System.3rdplanet
         :series "The Hitchhiker’s Guide to the Galaxy" :anthologist 'Adams.D
         :position 'p420)
   (make magazine-article :key 3 :author 'H.G.Wells :year 3200
         :magazine "Zeitmaschinen leicht gemacht" :series "Heimwerkerpraxis für Anfänger"
         :magnumber 550)))