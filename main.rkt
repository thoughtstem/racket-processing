#lang racket

(module reader racket
  (require syntax/strip-context)
  (require racket/syntax)
  (require racket-processing/processing-module)
 
  (provide (rename-out [literal-read read]
                       [literal-read-syntax read-syntax]))
 
  (define (literal-read in)
    (syntax->datum
     (literal-read-syntax #f in)))
 
  (define (literal-read-syntax src in)
    (with-syntax* ([str (format "(begin ~a)" (port->string in))]
                   [stuff (processing-str (read (open-input-string (syntax->datum #'str))))])
       #`(module anything racket
           (require racket-processing/processing-module)
           (display stuff)
           (processing stuff)
           ))))
