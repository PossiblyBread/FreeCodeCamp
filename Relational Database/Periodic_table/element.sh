#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

INPUT=$1

# If no argument given
if [[ -z $INPUT ]]
then
  echo "Please provide an element as an argument."
  exit
fi

# Check type of input and get atomic number
if [[ $INPUT =~ ^[0-9]+$ ]]
then
  # number
  DATA=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = '$INPUT'")
else
  if [[ $INPUT =~ ^[A-Za-z]{1,2}$ ]]
  then
    # symbol
    DATA=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$INPUT'")
  else 
    # name
    DATA=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$INPUT'")
  fi
fi

# If query returned nothing, stop script
if [[ -z $DATA ]]
then
  echo "I could not find that element in the database."
  exit
fi

SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = '$DATA'";)
NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = '$DATA'";)

MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number = '$DATA'";)
MELT_POINT=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number = '$DATA'";)
BOIL_POINT=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number = '$DATA'";)

TYPE=$($PSQL "SELECT type FROM types JOIN properties ON types.type_id = properties.type_id WHERE atomic_number = '$DATA'";)

echo "The element with atomic number $DATA is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT_POINT celsius and a boiling point of $BOIL_POINT celsius."

#the real 3rd commit
#test deez nuts
#test for real this time