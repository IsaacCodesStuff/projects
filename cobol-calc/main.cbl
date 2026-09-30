       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01  NUM1     PIC 9(5).
       01  NUM2     PIC 9(5).
       01  CHOICE   PIC 9.
       01  TOTAL    PIC S9(10)V99.
       01  AGAIN    PIC X.
       01  REPEAT   PIC 9.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Welcome to IsaacCodesStuff's Calculator!"

           MOVE 1 TO REPEAT

           PERFORM UNTIL REPEAT = 0
               DISPLAY "========== IsaacCodesStuff's Calculator "
               "=========="
               DISPLAY "1. Addition"
               DISPLAY "2. Subtraction"
               DISPLAY "3. Multiplication"
               DISPLAY "4. Division"
               DISPLAY "5. Exit"
      
               DISPLAY "Choose operation from above: "
               ACCEPT CHOICE
      
               IF CHOICE < 1 OR CHOICE > 5
                   DISPLAY "Invalid operation."
               ELSE
                   IF CHOICE = 5
                       MOVE 0 TO REPEAT
                   ELSE
                       DISPLAY "Enter first number: "
                       ACCEPT NUM1
                       DISPLAY "Enter second number: "
                       ACCEPT NUM2
           
                       EVALUATE CHOICE
                           WHEN 1
                               COMPUTE TOTAL = NUM1 + NUM2
                           WHEN 2
                               COMPUTE TOTAL = NUM1 - NUM2
                           WHEN 3
                               COMPUTE TOTAL = NUM1 * NUM2
                           WHEN 4
                               COMPUTE TOTAL = NUM1 / NUM2
                       END-EVALUATE
           
                       DISPLAY "Result: " TOTAL
           
                       PERFORM UNTIL AGAIN = "y" OR AGAIN = "n"
                           DISPLAY "Do you wanna try again? "
                           ACCEPT AGAIN
                           
                           IF AGAIN NOT = "y" AND AGAIN NOT = "n"
                               DISPLAY "You had TWO choices, and "
                               "you chose something else?!"
                           END-IF
                       END-PERFORM
      
                       IF AGAIN = "n"
                         MOVE 0 TO REPEAT
                       END-IF
                   END-IF
               END-IF
           END-PERFORM
      
           DISPLAY "Goodbye!"
           STOP RUN.
           