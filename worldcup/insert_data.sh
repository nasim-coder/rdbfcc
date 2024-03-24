#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
declare -A unique_teams
# Read data from CSV file
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
  do
    if [[ $WINNER != "winner" ]]; then
        unique_teams["$WINNER"]=1
    fi
    if [[ $OPPONENT != "opponent" ]]; then
        unique_teams["$OPPONENT"]=1
    fi
  done < games.csv

# Inserting unique team names
for key in "${!unique_teams[@]}";
do
    echo "$($PSQL "INSERT INTO teams(name) VALUES('$key')")"
done

# Inserting games data to games table
while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS;
  do
    if [[ $YEAR != "year" ]]; then
    # get the team ids of winner and oponent teams
    opponentid="$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")"
    winnerid="$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")"
    # Inserting data in the games table
    echo "$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES('$YEAR', '$ROUND', '$WINNER_GOALS', '$OPPONENT_GOALS', '$winnerid', '$opponentid')")"
    fi
  done < games.csv
