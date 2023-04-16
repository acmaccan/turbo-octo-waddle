#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#echo $($PSQL "CREATE DATABASE worldcup")
#echo $($PSQL "\c worldcup")
#echo $($PSQL "CREATE TABLE games, teams")
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != year ]]
  then
    DOES_WINNER_EXISTS=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    if [[ -z $DOES_WINNER_EXISTS ]]
    then
      INSERT_WINNER_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_WINNER_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into teams, $WINNER
      fi
    fi
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    DOES_OPPONENT_EXISTS=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    if [[ -z $DOES_OPPONENT_EXISTS ]]
      then
      INSERT_OPPONENT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_OPPONENT_RESULT == "INSERT 0 1" ]]
        then
        echo Inserted into teams, $OPPONENT
      fi
    fi
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    DOES_GAME_EXISTS=$($PSQL "SELECT * FROM games WHERE year=$YEAR AND round='$ROUND' AND winner_id=$WINNER_ID AND opponent_id=$OPPONENT_ID AND winner_goals=$WINNER_GOALS AND opponent_goals=$OPPONENT_GOALS")
    if [[ -z $DOES_GAME_EXISTS ]]
      then
      INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
        if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
          then
          echo Inserted into games, $YEAR $ROUND $WINNER_ID $OPPONENT_ID $WINNER_GOALS $OPPONENT_GOALS
        fi
    fi    

  fi
done