Operator	Description	Example
----------------------------------------------------------------------
-and	    Logical AND. TRUE when both	(1 -eq 1) -and (1 -eq 2)
            statements are TRUE.	False
-or	        Logical OR. TRUE when either	(1 -eq 1) -or (1 -eq 2)
            statement is TRUE.	True
-xor	    Logical EXCLUSIVE OR. TRUE when	(1 -eq 1) -xor (2 -eq 2)
            only one statement is TRUE	False
-not	    Logical not. Negates the statement	-not (1 -eq 1)
            that follows.	False
!	        Same as -not	!(1 -eq 1)
            False
