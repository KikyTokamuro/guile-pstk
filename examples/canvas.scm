; PS/Tk Example Program "Canvas"
; Copyright (C) 2022 Daniil Archangelsky aka Kiky Tokamuro
; See the PS/Tk license for conditions of use.

(add-to-load-path
 (string-append
  (dirname (current-filename))
  "/../"))

(use-modules (pstk))

(tk-start)

(tk/wm 'title tk "Canvas")
(tk/wm 'resizable tk 0 0)

(let* ((canvas (tk 'create-widget 'canvas
		   'background: "#ffffff"
		   'width: 300
		   'height: 200)))
  (canvas 'create 'rect 30 10 120 80
	  'outline: "#fb0"
	  'fill: "#fb0")
  (canvas 'create 'oval 110 30 210 80
	  'outline: "#000"
	  'fill: "#000")
  (canvas 'create 'arc 30 200 90 100
	  'start: 0
	  'extent: 210
	  'outline: "#ab1"
	  'fill: "#ab1")
  (canvas 'create 'text 190 150
	  'font: "Hack 20"
	  'fill: "#30bc22"
	  'text: "guile-pstk")
  (canvas 'create 'line 50 100 500 100
	  'fill: "#2f55ff"
	  'width: 5)  
  (tk/pack canvas)
  (tk-event-loop))

