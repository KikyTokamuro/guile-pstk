; PS/Tk Example Program "Hello World"
; Copyright (C) 2021-2022 Daniil Archangelsky aka Kiky Tokamuro
; Copyright (C) 2006 Nils M Holm
; See the PS/Tk license for conditions of use.

(add-to-load-path
 (string-append
  (dirname (current-filename))
  "/../"))

(use-modules (pstk))

(tk-start)
(let* ((label (tk 'create-widget 'label
                  'width: 20
		  'height: 5
                  'text: "Hello, World!"
                  'font: "Helvetica 20"
                  'fg: "#ff0000"))
       (bt-quit (tk 'create-widget 'button
                    'text: "Goodbye"
                    'command: (lambda () (tk-end)))))
  (tk/pack label bt-quit)
  (tk-event-loop))
