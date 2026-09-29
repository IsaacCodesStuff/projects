PROGRAM CALCULATOR
    IMPLICIT NONE
    INTEGER :: A, B, CHOICE
    REAL :: TOTAL
    LOGICAL :: REPEAT
    CHARACTER(LEN=1) :: AGAIN
    
    PRINT *, "Welcome to IsaacCodesStuff's Calculator!"
    
    REPEAT = .TRUE.
    DO WHILE (REPEAT)
        PRINT *, "========== IsaacCodesStuff's Calculator =========="

        PRINT *, "1. Addition"
        PRINT *, "2. Subtraction"
        PRINT *, "3. Multiplication"
        PRINT *, "4. Division"
        PRINT *, "5. Exit"

        PRINT *, "Choose operation from above:"
        READ *, CHOICE

        IF (CHOICE < 1 .OR. CHOICE > 5) THEN
            PRINT *, "Invalid operation."
            STOP
        END IF

        IF (CHOICE == 5) THEN
            PRINT *, "Goodbye!"
            STOP
        END IF

        PRINT *, "Enter first number: "
        READ *, A
        PRINT *, "Enter second number: "
        READ *, B

        SELECT CASE (CHOICE)
        CASE (1)
            TOTAL = A + B
        CASE (2)
            TOTAL = A - B
        CASE (3)
            TOTAL = A * B
        CASE (4)
            TOTAL = REAL(A) / B
        END SELECT

        PRINT *, "Result: ", TOTAL

        DO
            PRINT *, "Do you wanna try again? "
            READ *, AGAIN

            IF (AGAIN == 'y' .OR. AGAIN == 'n') THEN
                EXIT
            END IF

            PRINT *, "You had TWO choices, and you chose something else?!"
        END DO

    REPEAT = AGAIN == 'y'

    END DO
    PRINT *, "Goodbye!"
END PROGRAM CALCULATOR