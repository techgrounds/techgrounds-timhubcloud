import random

def board(pop):
    # Create the board in the terminal
    print(" {} | {} | {} ".format(pop[0],pop[1],pop[2]))
    print("-----------")
    print(" {} | {} | {} ".format(pop[3],pop[4],pop[5]))
    print("-----------")
    print(" {} | {} | {} ".format(pop[6],pop[7],pop[8]))

def is_there_a_winner(current_board):
    empty_list = []

    # horizontal winning conditions
    empty_list.append(current_board[0] + current_board[1] + current_board[2])
    empty_list.append(current_board[3] + current_board[4] + current_board[5])
    empty_list.append(current_board[6] + current_board[7] + current_board[8])

    # vertical winning conditions
    empty_list.append(current_board[0] + current_board[3] + current_board[6])
    empty_list.append(current_board[1] + current_board[4] + current_board[7])
    empty_list.append(current_board[2] + current_board[5] + current_board[8])

    # diagonal winning conditions
    empty_list.append(current_board[0] + current_board[4] + current_board[8])
    empty_list.append(current_board[6] + current_board[4] + current_board[2])

    # Check if player with X pieces has a winning line
    if "XXX" in empty_list:
        return 1

    # Check if a player with O pieces has a winning line
    elif "OOO" in empty_list:
        return 1
    
    else:
        # Check if there are any empty spots left on the board
        if " " not in current_board:
            return 2
        else:
        # Return that there are no winning lines yet
            return 0

def player_turn(current_board, who_begins):
    input_is_number = ""

    # Keep asking for new input if the given input is invalid (eg not 1-9)
    while input_is_number == "":
        try:
            your_move = int(input("Please make your move (number 1-9): "))
            if your_move > 0 and your_move < 10:
                input_is_number = your_move
            else:
                print("Please print a number 1-9!")
        except ValueError:
            print("Please print a number 1-9!")

    # Check if the input is still available on the board
    if current_board[input_is_number-1] == " ":

        # Place the piece and display the new board layout
        current_board[input_is_number-1] = who_begins
        board(current_board)

        # Check if there is a winner yet or if the board is full. If not: go to the next players turn
        if is_there_a_winner(current_board) == 0:
            computer_turn(current_board, who_begins)
        elif is_there_a_winner(current_board) == 2:
            print("Nobody won!")
        else:
            print("Congratulations, you won!")
    else:
        print("That space was not empty!")
        player_turn(current_board, who_begins)

def computer_turn(current_board, who_begins):

    # Generate a random placement for a piece
    input_is_number = random.randrange(10)

    # Determine which piece the computer is playing with
    if who_begins == "X":
        computer_piece = "O"
    else:
        computer_piece = "X"

    # Check if the placement on the board is still available
    if current_board[input_is_number-1] == " ":

        # Place the piece, check for winning conditions/full board
        current_board[input_is_number-1] = computer_piece
        print("The computer placed his piece in square {}:".format(input_is_number))
        board(current_board)
        if is_there_a_winner(current_board) == 0:
            player_turn(current_board, who_begins)
        elif is_there_a_winner(current_board) == 2:
            print("Nobody won!")
        else:
            print("Computer won!")
    else:

        # Retry the random placement
        computer_turn(current_board, who_begins)

def startgame():
    # Initiate an empty board and the who_begins variable
    current_board = [" "," "," "," "," "," "," "," "," "]
    who_begins = ""

    # Ask if the player wants to go first or not
    while who_begins == "":
        begin_answer = input("Would you like to be first (X) or second (O) player? (first/second) ")
        if begin_answer == "first":
            who_begins = "X"
            player_turn(current_board,who_begins)
        elif begin_answer == "second":
            who_begins = "O"
            computer_turn(current_board,who_begins)
        else:
            print("Please type 'first' or 'second'")

# Start the game!
print("===== TIC TAC TOE =====")
startgame()