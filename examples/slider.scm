; PS/Tk Example Program "Slider"
; Copyright (C) 2022 Daniil Archangelsky aka Kiky Tokamuro
; See the PS/Tk license for conditions of use.

(add-to-load-path "../")

(use-modules (pstk)
	     (ice-9 format))

(tk-start)

(tk/wm 'title tk "Slider")
(tk/wm 'resizable tk 0 0)

(tk 'configure 'background: "#ffffff")

(ttk-map-widgets 'all)
(ttk/set-theme "clam")

(let* ((entry  (tk 'create-widget 'entry
		   'width: 20))
       (slider (tk 'create-widget 'scale
		   'from: 0
		   'to: 100
		   'command: (lambda (x)
			       (entry 'delete 0 "end")
			       (entry 'insert 0 (format #f "~,2f" x))))))
  (tk/grid entry  'row: 0 'columnspan: 4 'sticky: 'ew 'padx: 20 'pady: 10)
  (tk/grid slider 'row: 1 'columnspan: 4 'sticky: 'ew 'padx: 20 'pady: 10)
  (tk-event-loop))

