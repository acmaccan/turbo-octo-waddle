#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
echo $SECRET_NUMBER

CONNECT_USER () {
  EXISTING_USER=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  if [[ $EXISTING_USER ]]
    then
    GAMES_PLAYED=$($PSQL "SELECT COUNT(user_id) FROM games WHERE user_id=$EXISTING_USER")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$EXISTING_USER")

    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

    else
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    SAVE_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  fi
}

GUESS_NUMBER() {
  if ! [[ $USER_NUMBER =~ ^[0-9]+$ ]]
    then
    echo "That is not an integer, guess again:"
  elif [[ $USER_NUMBER -gt $SECRET_NUMBER ]]
    then 
    echo "It's lower than that, guess again:"
  elif [[ $USER_NUMBER -lt $SECRET_NUMBER ]]
    then 
    echo "It's higher than that, guess again:"
  fi
}

echo -e "Enter your username:"
read USERNAME
CONNECT_USER

echo "Guess the secret number between 1 and 1000:"
read USER_NUMBER

GUESS_NUMBER

NUMBER_OF_GUESSES=1

until [[ $USER_NUMBER == $SECRET_NUMBER ]]
do
  read USER_NUMBER
  GUESS_NUMBER again
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
done

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
EXISTING_USER=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
SAVE_GUESSES_RESULT=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($EXISTING_USER, '$NUMBER_OF_GUESSES')")