; PS/Tk Example Program "Tile Themes"
; Copyright (C) 2021-2022 Daniil Archangelsky aka Kiky Tokamuro
; Copyright (C) 2007 Nils M Holm
; See the PS/Tk license for conditions of use.

(add-to-load-path "../")

(use-modules (pstk))

(tk-start)
(ttk-map-widgets 'all)
(let ((button
        (lambda (x)
          (let ((b (tk 'create-widget 'button
                       'text: (string-append "Select " x " theme")
                       'command: (lambda ()
                                   (ttk/set-theme x)))))
            (tk/pack b 'side: 'top 'fill: 'x)))))
  (map button (ttk/available-themes))
  (tk/pack (tk 'create-widget 'button
               'text: "Exit" 'command: tk-end)
           'fill: 'x)
  (tk-event-loop))
