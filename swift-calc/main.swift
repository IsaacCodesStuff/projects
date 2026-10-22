import Foundation

@main
struct Main {
    static func main() {
        print("Welcome to IsaacCodesStuff's Calculator!")
        operation()
    }

    static func operation() {
        var loop = true
        repeat {
            print("========== IsaacCodesStuff's Calculator ==========")
            let operationsList = [
                "Addition",
                "Subtraction",
                "Multiplication",
                "Division",
                "Exit"
                ]
            
            for i in 0..<operationsList.count {
                print("\(i + 1). \(operationsList[i])")
            }

            print("Choose operation from above: ", terminator: "")
            guard let input = readLine(), let choice = Int(input) else {
                print("Invalid operation.")
                continue
            }

            if choice < 1 || choice > 5 {
                print("Invalid operation.")
                continue
            }

            if choice == 5 {
                break
            }

            print("Enter first number: ")
            guard let input = readLine(), let num1 = Int(input) else {
                print("Invalid number.")
                continue
            }

            print("Enter second number: ")
            guard let input = readLine(), let num2 = Int(input) else {
                print("Invalid number.")
                continue
            }

            var total: Double = 0
            switch choice {
                case 1:
                    total = Double(num1 + num2)
                case 2:
                    total = Double(num1 - num2)
                case 3:
                    total = Double(num1 * num2)
                case 4:
                    if num2 == 0 {
                        print("Cannot divide by zero.")
                        continue
                    }
                    total = Double(num1) / Double(num2)
                default:
                    loop = false
            }

            print("Result: \(total)")

            var again = ""
            repeat {
                print("Do you wanna try again? ", terminator: "")
                again = readLine()?.lowercased() ?? ""

                if again != "y" && again != "n" {
                    print("You had TWO choices, and you chose something else?!")
                }
            } while again != "y" && again != "n"
            loop = again == "y"

        } while loop
        print("Goodbye!")
    }
}