#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ -z $1 ]]
  then
  echo -e "Please provide an element as an argument."
fi

if [[ $1 ]]
  then
  if [[ $1 =~ ^[0-9]+$ ]]
    then
    ELEMENT_SELECTED=$($PSQL "SELECT * FROM elements WHERE atomic_number=$1")

    if [[ -z $ELEMENT_SELECTED ]]
      then
      echo -e "I could not find that element in the database."
      exit
    fi

    ATOMIC_NUMBER=$(echo $ELEMENT_SELECTED | cut -d "|" -f 1)
    SYMBOL=$(echo $ELEMENT_SELECTED | cut -d "|" -f 2)
    NAME=$(echo $ELEMENT_SELECTED | cut -d "|" -f 3)
    
    PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")
    TYPE=$(echo $PROPERTIES | cut -d "|" -f 5)
    
    if [[ $TYPE = 1 ]]
      then
      TYPE="nonmetal"
    fi

    if [[ $TYPE = 2 ]]
      then
      TYPE="metal"
    fi

    if [[ $TYPE = 3 ]]
      then
      TYPE="metalloid"
    fi

    ATOMIC_MASS=$(echo $PROPERTIES | cut -d "|" -f 2)
    MELTING_POINT=$(echo $PROPERTIES | cut -d "|" -f 3)
    BOILING_POINT=$(echo $PROPERTIES | cut -d "|" -f 4)

    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

  fi

  if ! [[ $1 =~ ^[0-9]+$ ]]
    then
    ELEMENT_SELECTED=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1'")
    
    if [[ -z $ELEMENT_SELECTED ]]
      then
      echo -e "I could not find that element in the database."
      exit
    fi  

    ATOMIC_NUMBER=$(echo $ELEMENT_SELECTED | cut -d "|" -f 1)
    SYMBOL=$(echo $ELEMENT_SELECTED | cut -d "|" -f 2)
    NAME=$(echo $ELEMENT_SELECTED | cut -d "|" -f 3)
    
    PROPERTIES=$($PSQL "SELECT * FROM properties WHERE atomic_number='$ATOMIC_NUMBER'")
    TYPE=$(echo $PROPERTIES | cut -d "|" -f 5)

    if [[ $TYPE = 1 ]]
      then
      TYPE=$(echo nonmetal)
    fi

    if [[ $TYPE = 2 ]]
      then
      TYPE=$(echo metal)
    fi

    if [[ $TYPE = 3 ]]
      then
      TYPE=$(echo metalloid)
    fi

    ATOMIC_MASS=$(echo $PROPERTIES | cut -d "|" -f 2)
    MELTING_POINT=$(echo $PROPERTIES | cut -d "|" -f 3)
    BOILING_POINT=$(echo $PROPERTIES | cut -d "|" -f 4)

    echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi
