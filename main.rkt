; furkan ulke
; 2018400054
; compiling: yes
; complete: no

#lang racket

(provide (all-defined-out))

; 10 points
(define := (lambda (var value) (list var value)))

; 10 points
(define -- (lambda args (list 'let (map append args))))

; 10 points
(define @ (lambda (bindings expr)(append bindings expr)))

; 20 points
;(define split_at_delim (lambda (delim args))
;(filter (lambda (x) (not(equal? x delim))) args))
;(filter (lambda (x) (not(equal? x delim))) args)
;(define split_at_delim (lambda (delim args)
;(if (null? args) null (if (equal? delim (car args)) (cons (split_at_delim delim (cdr args)) null ) (cons(cons (car args) (split_at_delim delim (cdr args))) (split_at_delim delim (cdr args)))    ) )))
; 30 points(define splitter (lambda delim args)

;splits list into parts considering delimeter symbol
(define split_at_delim (lambda (delim args)
                         (foldr (lambda (currElement next) (if (equal? currElement delim)
                                                               (cons null next) (cons (cons currElement (first next)) (rest next))))
                                (list empty) args )))


(define parse_expr (lambda (expr) 0))
    
(define expressFunc (lambda (expr)(if (list? expr)
                                     (if (contains '* expr)
                                     (map * (split_at_delim '* expr))
                     (display "deneme"))




                                     expr)))

;to check a symbol is in the list or not
(define (contains list x)
	(cond [(null? list) #f]
		[(equal? (car list) x) #t]
		[else (contains (cdr list) x)]))



;(define reverse_infix (lambda (expr)
;(if (list? (car expr)) (append (reverse_infix(cdr expr)) (reverse_infix(car expr)))(                        
;(if (null? expr) null (cond ((list? (car expr))(append (reverse_infix(cdr expr)) (reverse_infix(car expr)))) ((equal? (car expr) "(")(append (reverse_infix (cdr expr)) ")")) ((equal? (car expr) ")")(append (reverse_infix (cdr expr)) "("))
                            ;((list? (car expr))(append (reverse_infix(cdr expr)) (reverse_infix(car expr))))
             ;(else (append (reverse_infix (cdr expr)) (list (car expr))))  ))))

; 20 points

;i think this eval_expr works. But since I didn't complete parse_expr it returns 0 everytime
(define eval_expr (lambda (expr) (eval (parse_expr expr))))
