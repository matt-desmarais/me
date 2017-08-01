;;thought process

;;A thought (T) is either
;;-empty
;;-neutral
;;-positive
;;-negative
;;where neutral, positive, and negative are symbols

(define-struct state(alive? awake? eating?));...

(define-struct Time(hours minutes))
;; (make-time Number Number)
;; hours is always between 0 and 11; 
;; minutes is always between 0 and 59.

;;train of thought
(define-struct tot(T time am-pm))
;;where T is a thought
;;time is a time
;;am-pm is a symbol

(define waketest(list (make-tot 'up (make-Time 8 50) 'am)))

;;A Brick Wall (BW) is one of:
;;-empty
;;(cons T BW)

;;next-step?: tot -> action
;;to take in a thought and return an appropraite action
;;given waketest -> wake up at 8:50 am
(define (next-step? a-tot)
  (cond
    [(symbol=? (tot-am-pm a-tot) 'am) 'morning]
    [(symbol=? (tot-am-pm a-tot) 'pm) 'evening]))