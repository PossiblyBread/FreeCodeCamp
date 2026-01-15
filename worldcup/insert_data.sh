#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games RESTART IDENTITY")

# Insert into teams table

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # Skips the header row #1
  if [[ $WINNER != winner ]]
  then
    # Check winner
    WINNER_NAME=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    if [[ -z $WINNER_NAME ]]
    then
      INSERT_WINNER=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      
      # Print Success Insert Opponent
      if [[ $INSERT_WINNER == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $WINNER
      fi
    fi

    # Check opponent
    OPPONENT_NAME=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_NAME ]]
    then
      INSERT_OPPONENT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      
      # Print Success Insert Opponent
      if [[ $INSERT_OPPONENT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    fi
  fi
done

COUNT_NAMES=$($PSQL "SELECT COUNT(name) FROM teams")
echo -e "\nAmount of Data Inserted to teams: $COUNT_NAMES\n"
# Insert into games table

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS

do
  # Skip header row
  if [[ $YEAR != "year" ]]
  then
      # Get team IDs
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

      # Insert game
      INSERT_GAMES=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
                            VALUES('$YEAR', '$ROUND', '$WINNER_ID', '$OPPONENT_ID', '$WINNER_GOALS', '$OPPONENT_GOALS')")
      
      # Print Success Insert
      if [[ $INSERT_GAMES == 'INSERT 0 1' ]]
      then
        echo Inserted into games, $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
      fi
  fi
done


COUNT_GAMES=$($PSQL "SELECT COUNT(game_id) FROM games")
echo -e "\n Amount of Data Inserted to games: $COUNT_GAMES\n"



