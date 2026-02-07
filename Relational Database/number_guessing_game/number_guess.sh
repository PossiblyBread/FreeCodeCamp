#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t -q --no-align -c"

echo "Enter your username:"
read USERNAME

# Check if user exists
USER_DATA=$($PSQL "SELECT games_played, best_game FROM games WHERE username='$USERNAME';")

if [[ -z $USER_DATA ]]
then
  # New user
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  $PSQL "INSERT INTO games(username, games_played) VALUES('$USERNAME', 0);"
else
  # Returning user
  IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_DATA"

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate secret number
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true
do
  read GUESS

  # Check if integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUMBER_OF_GUESSES++))

  if [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo -e "\nIt's higher than that, guess again:"
  elif [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo -e "\nIt's lower than that, guess again:"
  else
    break
  fi
  # why does it not get checked when theres no -e \n thats so dumb
done

# Update best game if better
CURRENT_BEST=$($PSQL "SELECT best_game FROM games WHERE username='$USERNAME';")

if [[ -z $CURRENT_BEST || $NUMBER_OF_GUESSES -lt $CURRENT_BEST ]]
then
  $PSQL "UPDATE games SET best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME';"
fi

# Increase games played
$PSQL "UPDATE games SET games_played = games_played + 1 WHERE username='$USERNAME';"

echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

#  :) balls and more balls