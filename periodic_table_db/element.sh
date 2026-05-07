#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

GET_ELEMENT_INFO(){
  
  ATOMIC_NUM=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1" 2>/dev/null)
    if [[ -z $ATOMIC_NUM ]]
      then
        SYMBOL=$($PSQL "SELECT * FROM elements WHERE symbol = '$1'")
          if [[ ! $SYMBOL ]]
            then
              NAME=$($PSQL "SELECT * FROM elements WHERE name = '$1'")
              if [[ ! $NAME ]]
                then 
                  echo -e "I could not find that element in the database."
                else
                  RETURN_ELEMENT_INFO $NAME
              fi
            else
              RETURN_ELEMENT_INFO $SYMBOL
          fi
      else
        RETURN_ELEMENT_INFO $ATOMIC_NUM
    fi
}

RETURN_ELEMENT_INFO(){
  ELEMENT=$1
  IFS='|' read -r ATOMIC_NUMBER_EL SYMBOL NAME <<< "$ELEMENT"

  PROPERTIES=$($PSQL "SELECT * FROM properties INNER JOIN types ON properties.type_id = types.type_id WHERE atomic_number = $ATOMIC_NUMBER_EL")
  IFS='|' read -r ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT_CELSIUS BOILING_POINT_CELSIUS TYPE_ID TYPE TYPE_ID<<< "$PROPERTIES"

  echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
}

if [[ $1 ]]
  then
    GET_ELEMENT_INFO $1
  else
    echo -e "Please provide an element as an argument."
fi
