#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# this generate the random number
GENERATE_NUMBER() {
  RANDOMNUM=$((1 + $RANDOM % 1000))
  echo $RANDOMNUM
}
# to store the guesses of each game
NUMBER_GUESSES=0

# to asking username and check if it is exits
ASK_NAME(){
  NUMBER_GUESSES=0
  echo -e "Enter your username:"
  read USER_NAME

  IS_USER=$($PSQL "SELECT * FROM users WHERE name='$USER_NAME'" 2>/dev/null)
  IFS='|' read -r USER_ID NAME <<< "$IS_USER"

  if [[  -z $IS_USER ]]
    then 
      echo -e "Welcome, $USER_NAME! It looks like this is your first time here."
      USER_ID=$($PSQL "INSERT INTO users(name) VALUES('$USER_NAME') RETURNING user_id")

    else
      USER_GAMES=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id =$USER_ID")
      BEST_GAME=$($PSQL "SELECT MIN(total_guesses) FROM games WHERE user_id =$USER_ID")
      echo -e "Welcome back, $NAME! You have played $USER_GAMES games, and your best game took $BEST_GAME guesses."
  fi

    NUMBER_TO_GUESS=$(GENERATE_NUMBER)
    echo -e "Guess the secret number between 1 and 1000:"
    GUESSING_NUMBER $NUMBER_TO_GUESS $USER_ID

}

# this checks if the guess is right, lower or higher
GUESSING_NUMBER(){
  RESULT=$1
  USER_ID=$2
  
  read USER_NUMBER
  ((NUMBER_GUESSES++))
 
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]
    then 
      echo -e "That is not an integer, guess again:"
      GUESSING_NUMBER $RESULT $USER_ID
      return
  fi

  if [[ $USER_NUMBER < $RESULT ]]
  then
    echo -e "It's higher than that, guess again:"
    GUESSING_NUMBER $RESULT $USER_ID
    return
  fi

  if [[ $USER_NUMBER > $RESULT ]]
  then
    echo -e "It's lower than that, guess again:"
    GUESSING_NUMBER $RESULT $USER_ID
    return
  fi

  if [[ $USER_NUMBER == $RESULT ]]
  then
    $PSQL "INSERT INTO games(user_id,total_guesses) VALUES('$USER_ID','$NUMBER_GUESSES')" > /dev/null 2>&1
    echo -e "You guessed it in $NUMBER_GUESSES tries. The secret number was $RESULT. Nice job!"
    return
  fi
}
ASK_NAME