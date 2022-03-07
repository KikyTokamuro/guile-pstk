; PS/Tk Example Program "Weather"
; Copyright (C) 2022 Daniil Archangelsky aka Kiky Tokamuro
; See the PS/Tk license for conditions of use.

(add-to-load-path "../")

(use-modules (pstk)
	     (web client)
	     (ice-9 regex)
	     (ice-9 receive))

(define (get-weather city)
  (receive (response-status response-body)
      (http-request (apply string-append
			   (list "https://wttr.in/"
				 (regexp-substitute/global #f "[ \t]+" city 'pre "+" 'post)
				 "?format=%C+%t")))
    response-body))

(tk-start)

(tk/wm 'title tk "Weather")
(tk/wm 'resizable tk 0 0)
(tk 'configure 'background: "#ffffff")

(ttk-map-widgets 'all)
(ttk/set-theme "clam")

(let* ((label   (tk 'create-widget 'label
		    'text: "Location:"
		    'font: "Hack 10"
		    'background: "#ffffff"))
       (entry   (tk 'create-widget 'entry
		    'width: 20))
       (result  (tk 'create-widget 'label
		    'width: 0
		    'text: ""
		    'font: "Hack 15"
		    'justify: "center"
		    'background: "#ffffff"))
       (btn-get (tk 'create-widget 'button
		    'text: "Get weather"
                    'command: (lambda ()
				(result 'configure
					'text: (get-weather (entry 'get)))))))
  (tk/grid label 'column: 1 'row: 1 'sticky: 'we 'padx: 5 'pady: 5)
  (tk/grid entry 'column: 2 'row: 1 'sticky: 'we 'padx: 5 'pady: 5)
  (tk/grid result 'columnspan: 3 'row: 2 'sticky: 'we 'padx: 5 'pady: 5)
  (tk/grid btn-get 'columnspan: 3 'row: 3 'sticky: 'we 'padx: 5 'pady: 5)
  (tk-event-loop))

