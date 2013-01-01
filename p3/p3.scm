
(define find-highest-prime
	(lambda (nums largest)
    (if (> (length nums) 0)
      (if (> (length (factors 2 (car nums) '())) 0)
        (find-highest-prime (cdr nums) largest)
        (find-highest-prime (cdr nums) (car nums))
      )
      largest
    )
	)
)

;;; TODO:
;;; start at half of the value ( the largest possible value)
;;; check if the number is a prime factor, then decrement
(define factors
	(lambda (prev n results)
		(if (< prev n)
			(if (= 0 (modulo n prev))
				(factors (+ prev 1) n (cons prev results))
				(factors (+ prev 1) n results)
			)
      results
		)
	)
)

(factors 2 600851475143 '())
