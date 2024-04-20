#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"
echo "Enter your username:"
read USERNAME
USER_DETAIL=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$USERNAME'")

if [[ -z $USER_DETAIL ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    userregistered=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME')")
else
    IFS='|' read -r _ GAMES_PLAYED BEST_GAME <<< "$USER_DETAIL"
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUMBER=$((1 + RANDOM % 1000))
echo "Guess the secret number between 1 and 1000:"

TAKEINPUT() {
    read USER_GUESS
}
TAKEINPUT

COUNT=1
while [[ $USER_GUESS -ne $RANDOM_NUMBER ]]; do
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]; then
        echo "That is not an integer, guess again:"
    elif (( USER_GUESS < RANDOM_NUMBER )); then
        echo "It's higher than that, guess again:"
    else
        echo "It's lower than that, guess again:"
    fi
    TAKEINPUT
    (( COUNT=COUNT+1 ))
done

TOTALGAME=$($PSQL "SELECT games_played FROM users where username='$USERNAME'")
(( TOTALGAME=TOTALGAME+1 ))
updated=$($PSQL "UPDATE users SET games_played=$TOTALGAME where username='$USERNAME'")

ISLOWESTGUES=$($PSQL "SELECT best_game FROM users where username='$USERNAME'")

if [[ -z $ISLOWESTGUES ]]; then
    updated=$($PSQL "UPDATE users SET best_game=$COUNT where username='$USERNAME'")
elif ((COUNT < ISLOWESTGUES)); then
    updated=$($PSQL "UPDATE users SET best_game=$COUNT where username='$USERNAME'")
fi

if(($USER_GUESS==$RANDOM_NUMBER))
then
echo -e "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"
fi
