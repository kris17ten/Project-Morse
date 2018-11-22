#lang racket/gui
(require "Hardware.rkt" racket/draw net/url)

;FRAME
(define myFrame (new frame%
                     [label "Project Morse"]
                     [width 500]
                     [height 500]
                     [stretchable-width #f]
                     [stretchable-height #f]))

(define aFrame (new frame%
                     [label "Project Morse"]
                     [width 500]
                     [height 500]
                     [stretchable-width #f]
                     [stretchable-height #f]))

;FONTS
(define font1 (make-font #:size 24
                         #:family 'script
                         #:face "Mickey"
                         #:weight 'light))

(define font2 (make-font #:size 16
                         #:family 'roman
                         #:face "Waltograph"
                         #:weight 'bold))

(define font3 (make-font #:size 12
                         #:family 'script
                         #:face "Courier Std"
                         #:weight 'bold))

(define font4 (make-font #:size 16
                         #:family 'script
                         #:face "Harrington"
                         #:weight 'light))

;PICTURES
(define black (make-object bitmap% "black.png"))
(define red (make-object bitmap% "red.png"))
(define mickey (read-bitmap
             (get-pure-port
              (string->url
               "file:///Picture1.png"))))

;------------------------
(define msg1 (new message%
                  [label "Type in your message: "]
                  [parent myFrame]
                  [font font1]))

(define msg4 (new message%
                  [label (string-append "Please note:\n"
                                 "Your message will be sent to another dimension\n"
                                 "in MORSE CODE.")]
                  [parent myFrame]
                  [font font3]
                  [auto-resize #t]
                  ))

(define txt (new text-field%
                 [label ""]
                 [parent myFrame]
                 [font font4]))

(define hpan2 (new horizontal-panel%
                   [parent myFrame]
                   [alignment (list 'center 'center)]))

(define magic (new button%
                   [label "Begin"]
                   [parent hpan2]
                   [callback (λ (o e)
                               (picMove (send txt get-value))
                               (send msg2 set-label "END OF TRANSMISSION"))]
                   [style (list 'border)]
                   [font font2]))

(define clr (new button%
                 [label "Clear"]
                 [parent hpan2]
                 [callback (λ (o e)
                             (send txt set-value "")
                             (send msg2 set-label ""))]
                 [style (list 'border)]
                 [font font2]))

(define hpan3 (new horizontal-panel%
                  [parent myFrame]))

(define pic (new message%
                 [label mickey]
                 [parent hpan3]))

(define light (new message%
                   [label black]
                   [parent hpan3]
                   [horiz-margin 50]))

(define msg2 (new message%
                  [label " "]
                  [parent myFrame]
                  [font font3]
                  [auto-resize #t]))
(define msg5 (new message%
                  [label " "]
                  [parent myFrame]
                  [font font3]
                  [auto-resize #t]))

(define hpan5 (new horizontal-panel%
                   [parent myFrame]
                   [alignment (list 'right 'bottom)]))

(define msg3 (new message%
                  [label " © Kristen Rebello 2017"]
                  [parent hpan5]))

;FUNCTIONS
(define zero (λ ()
               (printf "I'm zero\n")
               (send light set-label red)
               (sleep 0.2)
               (send light set-label black)
               (sleep 1)))

(define one (λ ()
              (printf "I'm one\n")
               (send light set-label red)
               (sleep 1)
               (send light set-label black)
               (sleep 1)))

(define space (λ ()
                (printf "I'm space\n")
               (send light set-label black)
               (sleep 2.5)))

(define picMove1 (λ (x)
                   (cond
                     ((equal? 0 x) (zero))
                     ((equal? 1 x) (one))
                     ((equal? 2 x) (space)))))
(define picMove (λ (x)
                  (for ([i (appends (morse1 x))])
                    (picMove1 i))))


(send myFrame show #t)
;(play-sound "MMHello.mp3" #t)