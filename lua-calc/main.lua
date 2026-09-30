print("Welcome to IsaacCodesStuff's Calculator!")

local repeatProgram = true

while repeatProgram do
    print("========== IsaacCodesStuff's Calculator ==========")

    local operations = {
        "Addition",
        "Subtraction",
        "Multiplication",
        "Division",
        "Exit"
    }

    for i, operation in ipairs(operations) do
        print(i .. ". " .. operation)
    end

    io.write("Choose operation from above: ")
    local choice = tonumber(io.read())

    if choice < 1 or choice > 5 then
        print("Invalid operation.")
    elseif choice == 5 then
        repeatProgram = false
    else
        io.write("Enter first number: ")
        local num1 = tonumber(io.read())
        io.write("Enter second number: ")
        local num2 = tonumber(io.read())

        local total
        if choice == 1 then
            total = num1 + num2
        elseif choice == 2 then
            total = num1 - num2
        elseif choice == 3 then
            total = num1 * num2
        elseif choice == 4 then
            total = num1 / num2
        end

        print("Result: " .. total)

        repeat
            io.write("Do you wanna try again? ")
            local again = io.read()

            if again == 'y' then
                repeatProgram = true
                break
            elseif again == 'n' then
                repeatProgram = false
                break
            else
                print("You had TWO choices, and you chose something else?!")
            end
        until false
    end
end
print("Goodbye!")