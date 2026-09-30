fun main() {
    println("Welcome to IsaacCodesStuff's Calculator!")
    operation()
}

fun operation() {
    var repeat = true
    do {
        println("========== IsaacCodesStuff's Calculator ==========")
        val operations = listOf (
            "Addition",
            "Subtraction",
            "Multiplication",
            "Division",
            "Exit"
        )
        
        for ((index, operation) in operations.withIndex()) {
            println("${index + 1}. $operation")
        }
        
        println("Choose operation from above: ")
        val choice = readln().toInt()
        
        if (choice < 1 || choice > 5) {
            println("Invalid operation.")
            return
        } else if (choice == 5) {
            println("Goodbye!")
            return
        }
        
        println("Enter first number: ")
        val num1 = readln().toInt()
        println("Enter second number: ")
        val num2 = readln().toInt()
        
        val total = when (choice) {
            1 -> num1 + num2
            2 -> num1 - num2
            3 -> num1 * num2
            4 -> num1 / num2
            else -> 0
        }
        
        println("Result: $total")
        
        var again: Char
        do {
            println("Do you wanna try again? ")
            again = readln().first()
            
            if (again != 'y' && again != 'n') {
                println("You had TWO choices, and you chose something else?!")
            }
        } while (again != 'y' && again != 'n')
        repeat = again == 'y'
    } while (repeat)
    println("Goodbye!")
}