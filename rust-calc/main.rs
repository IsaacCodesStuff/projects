use std::io;

fn main() {
    println!("Welcome to IsaacCodesStuff's Calculator!");
    operation();
}

fn operation() {
    loop {
        println!("========== IsaacCodesStuff's Calculator ==========");
        
        let mut input = String::new();

        let operations_list = [
            "Addition",
            "Subtraction",
            "Multiplication",
            "Division",
            "Exit",
        ];

        for (i, operation) in operations_list.iter().enumerate() {
            println!("{}. {}", i + 1, operation);
        }

        println!("Choose operation from above: ");
        io::stdin()
            .read_line(&mut input)
            .expect("Failed to read input");
        let choice: i32 = input.trim().parse().expect("Invalid operation.");
        input.clear();

        if choice == 5 {
            break;
        }

        println!("Enter first number: ");
        io::stdin()
            .read_line(&mut input)
            .expect("Failed to read input");
        let num1: i32 = input.trim().parse().expect("Invalid number.");
        input.clear();

        println!("Enter second number: ");
        io::stdin()
            .read_line(&mut input)
            .expect("Failed to read input");
        let num2: i32 = input.trim().parse().expect("Invalid number.");
        input.clear();

        let total = match choice {
            1 => num1 + num2,
            2 => num1 - num2,
            3 => num1 * num2,
            4 => {
                if num2 == 0 {
                    println!("Cannot divide by zero.");
                    return;
                }

                num1 / num2
            }
            _ => {
                println!("Invalid operation.");
                return;
            }
        };

        println!("Result: {total}");

        let again = loop {
            input.clear();

            println!("Do you wanna try again? ");
            io::stdin()
                .read_line(&mut input)
                .expect("Failed to read input");

            match input.trim().to_lowercase().as_str() {
                "y" => break true,
                "n" => break false,
                _ => println!("You had TWO choices, and you chose something else?!"),
            }
        };

        if !again {
            break;
        }
    }

    println!("Goodbye!");
}