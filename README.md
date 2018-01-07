A #lang racket-processing

So you can write Racket code that runs in the processing runtime
  (Gets compiled to processing code.)
  (The compiler is part of TS-Polyglot -- separate from this package.)

Example code:

```
(define i 0)

(define (setup)
  (background 0)
  (size 300 300))

(define (draw)
  (stroke (random 255)  (random 0)  (random 0)  100)
  (line i 0 (random 0 width) height)
  (if (< i width)
      (set! i (+ 1 i))
      (set! i 0)))
```
 
# racket-processing
