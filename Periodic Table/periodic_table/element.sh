PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

QUERY () {
  ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  ELEMENT_BOIL=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  ELEMENT_MELT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  ELEMENT_TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ATOMIC_NUMBER")
  ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$ELEMENT_TYPE_ID")
  echo "The element with atomic number ${ATOMIC_NUMBER// /} is ${ELEMENT_NAME// /} (${ELEMENT_SYMBOL// /}). It's a ${ELEMENT_TYPE// /}, with a mass of ${ELEMENT_MASS// /} amu. ${ELEMENT_NAME// /} has a melting point of ${ELEMENT_MELT// /} celsius and a boiling point of ${ELEMENT_BOIL// /} celsius."
}

if [[ -z $1 ]]
then
echo "Please provide an element as an argument."
else 
if [[ $1 =~ ^[0-9]+$ ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1")
  if [[ -z $ATOMIC_NUMBER ]]
  then
    echo "I could not find that element in the database."
    else
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$1")
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$1")
    QUERY
    fi
elif [[ ${#1} -eq 2 || ${#1} -eq 1 ]]
then
  ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE symbol='$1'")
  if [[ -z $ELEMENT_SYMBOL ]]
  then
    echo "I could not find that element in the database."
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1'")
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    QUERY
  fi
  else
  ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE name='$1'")
  if [[ -z $ELEMENT_NAME ]]
  then
    echo "I could not find that element in the database."
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1'")
    ELEMENT_SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ATOMIC_NUMBER")
    QUERY
  fi
fi
fi