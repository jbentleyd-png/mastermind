# mastermind

Another OOP project to practice Ruby skills.

In this program, the user plays against the computer in the terminal.

On program start, the user can choose to either guess or set a code composed of four colors, which may repeat.

## Guessing Mode

If the player chooses to guess, they must input a set of four letter corresponding to colors each round. After an input, the program will give feedback on the guess using \* signs. A red symbol indicated that one of the four letters is the correct color in the correct position, while a white symbol indicates that one of the letters is the correct color in an incorrect position. There may be up to four total symbols, and their display order does not correspond to the order of the letters the user inputted.

## Setting Mode

If the player chooses to set the code, they likewise input a four-letter combination, and the computer uses a rudimentary algorithm to try to guess the combination. The computer first inputs 6 guesses, each using all of the saem color (e.g. 'GGGG' for all green). This determines how many letters of each color are in the code. After finding that information, the computer simply guesses random combinations of the correct colors.

Since the computer does not use any logic based on the symbol feedback after round 6, sometimes it gets lucky and wins, but it often loses.

## Notes on construction

This was my first time making a program of this complexity, and I tried to separate methods into appropriate files.
