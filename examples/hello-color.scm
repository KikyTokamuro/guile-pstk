; PS/Tk Example Program "Hello World Color"
; Copyright (C) 2021-2022 Daniil Archangelsky aka Kiky Tokamuro
; Copyright (C) 2006 Nils M Holm
; See the PS/Tk license for conditions of use.

(add-to-load-path "../")

(use-modules (pstk))

(tk-start)
(let* ((label (tk 'create-widget 'label 'height: 5
                  'text: "Hello, World!" 'font: "Helvetica 20"
                  'fg: "#ffff00" 'bg: "#a00000"))
       (change-color
	(lambda ()
	  (let ((c (tk/choose-color)))
	    (cond ((not (string=? c ""))
	           (label 'configure 'bg: c))))))
       (bt-color (tk 'create-widget 'button
		     'text: "New Color"
		     'command: change-color))
       (bt-quit (tk 'create-widget 'button
                    'text: "Goodbye"
                    'command: tk-end)))
  (tk/pack label 'side: 'top 'expand: #t 'fill: 'x)
  (tk/pack bt-color bt-quit 'side: 'left 'expand: #t 'fill: 'x)
  (tk-event-loop))
