# MIPS Assembly Calculator

A simple interactive calculator built in MIPS assembly language that performs basic arithmetic operations through a menu-driven interface.

## Features

- **Interactive Menu System**: User-friendly French interface with clear operation choices
- **Basic Arithmetic Operations**:
  - Addition
  - Subtraction
  - Multiplication
  - Division
  - Modulo
  - Negation
- **Input Validation**: Prompts for two positive integers
- **Error Handling**: Prevents division by zero with appropriate error messages
- **Loop Structure**: Continuously prompts for input and performs calculations until user exits with option 7

## How to Use

1. The program displays a menu with operation choices
2. Enter the first positive integer when prompted
3. Enter the second positive integer when prompted
4. Select your desired operation:
   - `1` for addition
   - `2` for subtraction
   - `3` for multiplication
   - `4` for division
   - `5` for modulo
   - `6` for negation
   - `7` to exit the program
5. View the result
6. The program automatically loops back to step 1, asking for new numbers and showing the menu again
7. Repeat until you choose option `7` to exit

## Requirements

- **PCSpim** or compatible MIPS simulator
- MIPS assembly environment

## Running the Program

1. Download and install PCSpim
2. Load `mips-calc.asm` into PCSpim
3. Run the program
4. Follow the on-screen prompts (in French)

## Sample Interaction

```
=== First Calculation ===
Entrez le 1er entier positif: 15
Entrez le 2nd entier positif: 3

Faites votre choix:
Tapez 1 pour faire l addition
Tapez 2 pour faire la soustraction
Tapez 3 pour faire la multiplication
Tapez 4 pour faire la division
Tapez 5 pour faire le modulo
Tapez 6 pour afficher la negation
Tapez 7 pour quitter le programme

Choice: 1
Le resultat de votre opperation est: 18

=== Program Loops Back ===
Entrez le 1er entier positif: 20
Entrez le 2nd entier positif: 4

Faites votre choix:
[menu appears again...]

Choice: 4
Le resultat de votre opperation est: 5

=== Exit ===
Entrez le 1er entier positif: 10
Entrez le 2nd entier positif: 2

Faites votre choix:
[menu appears again...]

Choice: 7
[Program exits]
```

## Technical Details

- **Language**: MIPS Assembly
- **Architecture**: MIPS 32-bit
- **Interface**: French language prompts
- **Data Section**: Contains all user messages and prompts
- **Text Section**: Contains main program logic and operation handlers

## Educational Context

This calculator was developed as part of a computer architecture course to demonstrate understanding of:
- MIPS assembly language programming
- Low-level arithmetic operations
- Memory management in assembly
- User input/output handling
- Program flow control and branching

## License

This project is for educational purposes.
