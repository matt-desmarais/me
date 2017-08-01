(define-struct human(needs wants diseases emotional-state physical-state personality-type negative-habits positive-habits routine?))
;(make-human list list list list list string list list boolean)
(define-struct human-being(human level-of-dimensional-awareness self-actualized? short-term-goals long-term-goals))
;(make-human-being human (number 1-13) boolean list list)
(define-struct modern-human(money possesions obsessions human/human-being?))
;(make-modern-human num list list (or human human-being))

(define default-human (make-human (list "food" "water") (list "mate") (list "insanity") (list) (list) "unknown" (list) (list) true))
(define me-human (make-human (list "food" "water") (list "mate") (list "sanity") (list) (list) "AB" (list "smoking") (list "learning") true))
(define default-human-being (make-human-being default-human 1 false (list) (list)))
(define a-human-being (make-human-being default-human 1 true (list) (list)))
(define default-modern-human (make-modern-human 0 (list) (list) default-human))
(define modern-human-being (make-modern-human 0 (list) (list) a-human-being))

(define (humanity a-human)
  (cond
    [(human? a-human) a-human]
    [(human-being? a-human) a-human]
    [(modern-human? a-human) (humanity(modern-human-human/human-being? a-human))]))

;(humanity default-human)
;(humanity default-human-being)
;(humanity default-modern-human)
;(humanity modern-human-being)

(define (dimensional-awareness-level a-human-being)
  (cond
    [(and (human-being? a-human-being) 
          (human-being-self-actualized? a-human-being))
     (make-human-being 
      (human-being-human a-human-being)
      (+(human-being-level-of-dimensional-awareness a-human-being)1) 
       false
      (human-being-short-term-goals a-human-being)
      (human-being-long-term-goals a-human-being))]
    [(modern-human? a-human-being) (make-modern-human (modern-human-money a-human-being)
                                                      (modern-human-possesions a-human-being)
                                                      (modern-human-obsessions a-human-being)
                                                      (dimensional-awareness-level (humanity a-human-being)))]
    [else a-human-being]))

;(dimensional-awareness-level default-human)
;(dimensional-awareness-level default-human-being)
;(dimensional-awareness-level default-modern-human)
;(dimensional-awareness-level modern-human-being)
;(dimensional-awareness-level a-human-being)
;(define Matthew_Desmarais (make-modern-human 0 (list "toys" "medicine") (list "toys" "medicine") (make-human-being me-human 12 true (list "live") (list "spread knowledge"))))
;(dimensional-awareness-level Matthew_Desmarais)

(define (dal-limit a-human)
  (cond
    [(human? a-human) a-human]
    [(and (modern-human? a-human) (human-being? (modern-human-human/human-being? a-human)) (< (human-being-level-of-dimensional-awareness 
         (dimensional-awareness-level a-human)) 13))
     (dimensional-awareness-level a-human)]
    [(and (modern-human? a-human) (human-being? (modern-human-human/human-being? a-human)) (>= (human-being-level-of-dimensional-awareness 
         (dimensional-awareness-level a-human)) 13))    
    (make-human-being 
      (human-being-human a-human-being)
       13 
       true
      (human-being-short-term-goals a-human-being)
      (human-being-long-term-goals a-human-being))]
    [else a-human]))

(dal-limit default-human)
(dal-limit default-human-being)
(dal-limit default-modern-human)
(dal-limit modern-human-being)
(dal-limit a-human-being)
(define Matthew_Desmarais (make-modern-human 0 (list "toys" "medicine") (list "toys" "medicine") (make-human-being me-human 12 true (list "live") (list "spread knowledge"))))
(dimensional-awareness-level Matthew_Desmarais)
(dal-limit Matthew_Desmarais)


;(dimensional-awareness-level default-human)
;(dimensional-awareness-level default-human-being)
;(dimensional-awareness-level default-modern-human)
;(dimensional-awareness-level modern-human-being)
;(dimensional-awareness-level a-human-being)
;(define Matthew_Desmarais (make-modern-human 0 (list "toys" "medicine") (list "toys" "medicine") (make-human-being me-human 12 true (list "live") (list "spread knowledge"))))
(dimensional-awareness-level Matthew_Desmarais)