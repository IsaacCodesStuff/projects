import java.util.InputMismatchException;
import java.util.Scanner;

public class Main {
    public static void main (String[] args) {

        // Program initialization
        Scanner scanner = new Scanner (System.in);
        System.out.println();
        System.out.println("***************************************");
        System.out.println("* Welcome to ICS's Zodiac Identifier! *");
        System.out.println("***************************************");
        System.out.println();
        System.out.println();
        System.out.println("---------------------------------------");
        System.out.println("           Birth Information");
        System.out.println("---------------------------------------");
        // Mega loop for program
        boolean repeat = false;
        do {
            // Variable declaration & default assignment of values
            int month = 0;
            int day = 0;
            int maxDay = 0;

            // Month input & validation logic
            do {
                try {
                    System.out.print("Please enter your birth month: ");
                    month = scanner.nextInt();

                    if (month < 1 || month > 12) {
                        System.out.println("Invalid month! Please try again.");
                    }
                } catch (InputMismatchException monthInputError) {
                    System.out.println("Invalid input! Please enter a number.");
                    scanner.nextLine();
                    month = 0;
                }
            } while (month < 1 || month > 12);

            // Month/Day validation logic
            if (month == 2) {
                maxDay = 28;
            } else if (month == 4 || month == 6 || month == 9 || month == 11) {
                maxDay = 30;
            } else {
                maxDay = 31;
            }

            // Day input & validation logic
            do {
                try {
                    System.out.print("Please enter your birth day: ");
                    day = scanner.nextInt();

                    if (day < 1 || day > maxDay) {
                        System.out.println("Invalid day! Please try again.");
                    }
                } catch (InputMismatchException dayInputError) {
                    System.out.println("Invalid input! Please enter a number.");
                    scanner.nextLine();
                    day = 0;
                }
            } while (day < 1 || day > maxDay);

            System.out.println();
            System.out.println("---------------------------------------");
            System.out.println("              Your Sign");
            System.out.println("---------------------------------------");

            // Zodiac sign validation logic
            if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
                System.out.println("You're an Aquarius!");
            } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
                System.out.println("You're a Pisces!");
            } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
                System.out.println("You're an Aries!");
            } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
                System.out.println("You're a Taurus!");
            } else if ((month == 5 && day >= 21) || (month == 6 && day <= 21)) {
                System.out.println("You're a Gemini!");
            } else if ((month == 6 && day >= 22) || (month == 7 && day <= 22)) {
                System.out.println("You're a Cancer!");
            } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
                System.out.println("You're a Leo!");
            } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
                System.out.println("You're a Virgo!");
            } else if ((month == 9 && day >= 23) || (month == 10 && day <= 23)) {
                System.out.println("You're a Libra!");
            } else if ((month == 10 && day >= 24) || (month == 11 && day <= 21)) {
                System.out.println("You're a Scorpius!");
            } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
                System.out.println("You're a Sagittarius!");
            } else if ((month == 12 && day >= 22) || (month == 1 && day <= 19)) {
                System.out.println("You're a Capricornus!");
            } else {
                System.out.println("What's your sign? The Singularity?");
            }

            boolean validChoice = false;

            do {
                // Choice to repeat program
                System.out.println();
                System.out.println("---------------------------------------");
                System.out.println("             Program Menu");
                System.out.println("---------------------------------------");
                System.out.print("Would you like to try again? [y/N]: ");
                char choice = scanner.next().charAt(0);
                char again = Character.toLowerCase(choice);

                if (again == 'y') {
                    repeat = true;
                    validChoice = true;
                } else if (again == 'n') {
                    repeat = false;
                    validChoice = true;
                } else {
                    System.out.println("You had TWO choices, and you chose something else?!");
                }
            } while (!validChoice);
        } while (repeat);
        
        System.out.println();
        System.out.println("---------------------------------------");
        System.out.println("Thank you for using Zodiac Identifier!");
        System.out.println("Goodbye!");
        System.out.println("---------------------------------------");
        scanner.close();
    }
}