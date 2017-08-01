(define-struct finity(num))
(define-struct theworld(num))
(define-struct world(finity theworld image))
(define startworld (make-world 0 0 (empty-scene 1900 50)))
(define (next a-world) (make-world (+(world-finity a-world)1) (+(world-theworld a-world)1)(worldimage a-world)))
(define (worldimage a-world) (place-image(text(string-append "0:"(number->string (world-finity a-world)) " "(number->string (world-theworld a-world)))12 'red) 10 25 (empty-scene 1900 50)))
(define (key-pressed world sym) 
  (cond 
    [(and(char? sym)(char=? sym #\space)) (make-world 0 (world-theworld world) (worldimage world))]
    [else world]))

(big-bang 1900 50 1 startworld)
(on-tick-event next)
(on-redraw worldimage)
(on-key-event key-pressed)