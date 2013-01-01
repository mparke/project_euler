;;; builds a list of numbers in the fibonacci 
;;; sequence up to a provided limit
(define fib
	(lambda (seq limit)
		(if (< (car seq) limit)
			(fib (cons (+ (car seq) (car (cdr seq))) seq) limit)
			seq
		)
	))

; build list up to 4 million
; filter list for even numbers
; reduce the list to the sum of it's values
(reduce-left + 0 (filter even? (fib '(2 1) 4000000)))