#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Creating the Tables

echo $($PSQL "CREATE TABLE IF NOT EXISTS teams(
  team_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(50) UNIQUE NOT NULL
)")

echo $($PSQL "CREATE TABLE IF NOT EXISTS games(
  game_id SERIAL PRIMARY KEY NOT NULL,
  year INT NOT NULL,
  round VARCHAR(20) NOT NULL,
  winner_id INT REFERENCES teams(team_id) NOT NULL,
  opponent_id INT REFERENCES teams(team_id) NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
)")

# Truncate Tables and Drop Sequences
echo $($PSQL "TRUNCATE TABLE games,teams")
echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART")
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART")


# Adding Tuples into Teams and Games
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

# Adding Unique Teams into Table Teams
  if [[ $WINNER != winner ]]
  then
    TEAM=$($PSQL "SELECT name FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM ]]
    then
      INSERT_TEAM=$($PSQL "INSERT INTO teams (name) VALUES('$WINNER')")
    fi
  fi
# Adding Unique Teams into Table Teams
  if [[ $OPPONENT != opponent ]]
  then 
    TEAM=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM ]]
    then
      INSERT_TEAM=$($PSQL "INSERT INTO teams (name) VALUES('$OPPONENT')")
    fi
  fi

  # Adding Games into Table Games
  if [[ $YEAR != year ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    echo $($PSQL "INSERT INTO games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) 
    VALUES('$YEAR','$ROUND','$WINNER_ID','$OPPONENT_ID','$WINNER_GOALS','$OPPONENT_GOALS')")
  fi
done