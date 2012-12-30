;;; removes numbers devisible by 5 from a list of
;;; multiples of 3
(define find-unique-threes
	(lambda (threes results)
    (if (> (length threes) 0)
      ; if the number is also divisible by 5, don't include it
      (if (= 0 (modulo (car threes) 5))
        (find-unique-threes (cdr threes) results)
        (find-unique-threes (cdr threes) (cons (car threes) results))
      )
      results
    )
	)
)

;;; builds a list of all multiples up to a provided limit
(define find-multiples
	(lambda (prev incr limit multiples)
		(if (< (+ prev incr) limit)
			; use an internal definition for the next value
			(let ((next (+ prev incr)))
				(if (= 0 (modulo next incr))
					; recursively call with the added list value
					(find-multiples next incr limit (cons next multiples))
					; it is not divisible, call recursively without cons
					(find-multiples next incr limit multiples)
				)
			)
			multiples
		)
	)
)

;;; builds a list of multiples for 3s and 5s
;;; removes the duplicates
;;; combines the resulting lists
;;; reduces the list to the sum of values
(define sum-multiples-threes-fives
	(lambda ()
		(let ((threes (find-multiples 0 3 1000 '())))
			(let ((fives (find-multiples 0 5 1000 '())))
        ; remove duplicates from the 3's list
        (let ((unique-threes (find-unique-threes threes '())))
          (write unique-threes)
          (reduce-left + 0 (append unique-threes fives))
        )   
			)
    )
	)
)

(sum-multiples-threes-fives)





