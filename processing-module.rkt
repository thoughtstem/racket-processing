(module processing-module racket
  (provide
          (all-from-out racket)
           processing
           processing-str
           #%module-begin)


  (define (processing str)
    (make-directory* "demo")
    (with-output-to-file "demo/demo.pde" #:exists 'replace
      (lambda () (printf str)))
    (displayln "\n\nRunning processing... Please wait...")
    (system "processing-java --sketch=demo --run demo/demo.pde"))

  (require racket-to/processing))
