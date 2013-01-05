; takes an even length number and checks if it's a palindrome
(define test-palindrome
  (lambda (x)
    (write x)
    ; convert to a string
    (let ((x-string (number->string x)))
      (let ((x-string-reversed (reverse-string x-string)))
        ; now compare equality of reversed number
        (if (= (string->number x-string-reversed) x)
          ; palindrome!
          #t
          #f
        )
      )
    )
  )
)

; finds the first palindrome in the list
(define find-palindrome
  (lambda (nums)
    (if (null? nums)
      ; return false not found
      #f
      ; check the next number
      (let ((isPalindrome (test-palindrome (car nums))))
        (if (= isPalindrome #t)
          ; done return the number
          (car nums)
          ; recurse remaining list
          (find-palindrome (cdr nums))
        )
      )
    )
  )
)

(define build-multiples
  (lambda (x xLimit y yLimit yCounter results)
    (if (= y yLimit)
      ; reset y and increment x
      (build-multiples (+ x 1) xLimit (- y yCounter) yLimit 0 results)
      (if (= x xLimit)
        ; done
        results
        ; recurse next permutation
        (build-multiples x xLimit (+ y 1) yLimit (+ yCounter 1) (cons (* x y) results))
      )
    )
  )
)

(define largest-palindrome
  (lambda (x xLimit y yLimit)
    ; build a list of all permutations of 3 digit numbers
    (let ((multiples (build-multiples x xLimit y yLimit 0 '())))
      (find-palindrome multiples)
      ;(reverse multiples)
    )
  )
)

(largest-palindrome 100 1000 100 1000)