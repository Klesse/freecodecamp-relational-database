#!binbash

ANSWER_NUMBER=$(( $RANDOM % 1001  ))
PSQL=psql -X --username=freecodecamp --dbname=postgres --tuples-only -c

echo nEnter your username
read USERNAME


NAME_EXISTS=$($PSQL SELECT name FROM scores WHERE name='$USERNAME';)
if [[ -z $NAME_EXISTS ]]
# If not exists
then
  echo Welcome, $USERNAME! It looks like this is your first time here.

  echo Guess the secret number between 1 and 1000
  read GUESS_NUMBER
  SCORE=1
  while [[ $GUESS_NUMBER -ne $ANSWER_NUMBER ]];
  do
    if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]]
    then
        echo That is not an integer, guess again
        read GUESS_NUMBER
        continue
    elif [[ $ANSWER_NUMBER -gt $GUESS_NUMBER ]];
    then
      SCORE=$((SCORE+1))
      echo It's higher than that, guess again
    elif [[ $ANSWER_NUMBER -lt $GUESS_NUMBER ]];
    then
      SCORE=$((SCORE+1))
      echo It's lower than that, guess again
    fi
    read GUESS_NUMBER
  done
  echo You guessed it in $SCORE tries. The secret number was $ANSWER_NUMBER. Nice job!
  INSERT_NEW_SCORE=$($PSQL INSERT INTO scores(name,score) VALUES('$USERNAME',$SCORE))


# If exists
else
  BEST_SCORE=$($PSQL SELECT MIN(score) FROM scores WHERE name='$USERNAME')
  NUMBER_GAMES=$($PSQL SELECT COUNT(name) FROM scores WHERE name='$USERNAME')
  echo Welcome back, ${USERNAME }! You have played ${NUMBER_GAMES } games, and your best game took ${BEST_SCORE } guesses.


  echo Guess the secret number between 1 and 1000
  read GUESS_NUMBER
    SCORE=1
    while [[ $GUESS_NUMBER -ne $ANSWER_NUMBER ]];
    do
      if [[ ! $GUESS_NUMBER =~ ^[0-9]+$ ]];
      then
        echo That is not an integer, guess again
        read GUESS_NUMBER
        continue
      elif [[ $ANSWER_NUMBER -gt $GUESS_NUMBER ]];
      then
        SCORE=$((SCORE+1))
        echo It's higher than that, guess again
      elif [[ $ANSWER_NUMBER -lt $GUESS_NUMBER ]];
      then
        SCORE=$((SCORE+1))
        echo It's lower than that, guess again
      fi
      read GUESS_NUMBER
    done
    echo You guessed it in ${SCORE } tries. The secret number was ${ANSWER_NUMBER }. Nice job!
    INSERT_NEW_SCORE=$($PSQL INSERT INTO scores(name,score) VALUES('$USERNAME',$SCORE))

fi




