# Zodiac Identifier

A simple Java console program that identifies a user's zodiac sign based on their birth month and day.

This project was created as part of a Java programming assignment.

## Features

* Accepts the user's birth month and day
* Validates month and day input
* Determines the maximum number of days in the selected month
* Identifies the user's zodiac sign using `if`, `else if`, and `else`
* Handles invalid input using `try/catch`
* Allows the user to run the program repeatedly
* Provides a simple command-line interface

## How It Works

The program first asks the user to enter their birth month. The input is validated to ensure that the month is between 1 and 12.

The program then determines the maximum valid day for that month. February is limited to 28 days, months with 30 days are handled separately, and the remaining months allow up to 31 days.

After receiving a valid birth date, the program compares the month and day against the zodiac date ranges and displays the corresponding zodiac sign.

The user can then choose whether to run the program again.

## Input Validation

The program handles two main types of invalid input:

* **Invalid data type:** Non-numeric input is handled using `InputMismatchException`.
* **Invalid value:** Numeric values outside the valid calendar range are rejected and the user is asked to try again.

Leap years are not considered because the program only accepts a month and day.

## Zodiac Signs

| Zodiac Sign | Date Range                |
| ----------- | ------------------------- |
| Aquarius    | January 20 – February 18  |
| Pisces      | February 19 – March 20    |
| Aries       | March 21 – April 19       |
| Taurus      | April 20 – May 20         |
| Gemini      | May 21 – June 21          |
| Cancer      | June 22 – July 22         |
| Leo         | July 23 – August 22       |
| Virgo       | August 23 – September 22  |
| Libra       | September 23 – October 23 |
| Scorpius    | October 24 – November 21  |
| Sagittarius | November 22 – December 21 |
| Capricornus | December 22 – January 19  |

## Requirements

* Java Development Kit (JDK)
* Java 8 or later

## How to Run

Compile the program:

```bash
javac Main.java
```

Run the program:

```bash
java Main
```

## Project Information

**Language:** Java

**Type:** Console application

**Course:** Computer Programming 1

**Author:** IsaacCodesStuff

**Section:** BS Information Technology 1-D

## Reference

Zodiac date ranges were referenced from Encyclopaedia Britannica.

Source: https://www.britannica.com/topic/zodiac