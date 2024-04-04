#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

PRINT() {
    if [[ -z $ELEMENT ]]; then
        echo "I could not find that element in the database."
    else
        read atomic_number bar symbol bar name bar type bar atomic_mass bar melting_point_celsius bar boiling_point_celsius bar type_id <<< "$ELEMENT"
        echo "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $atomic_mass amu. $name has a melting point of $melting_point_celsius celsius and a boiling point of $boiling_point_celsius celsius."
    fi
}

if [[ $1 ]]; then  # Check if an argument is provided
    if [[ $1 =~ ^[-+]?[0-9]+$ ]]; then  # Check if argument is a number
        # Search by atomic number
        ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM elements inner join properties using(atomic_number) inner join types using(type_id) WHERE atomic_number=$1")
        PRINT
    else
        if [[ ${#1} -lt 3 ]]; then  # Check if argument length is less than 3
            # Search by symbol
            ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM elements inner join properties using(atomic_number) inner join types using(type_id) WHERE symbol='$1'")
            PRINT
        else
            # Search by name
            ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, type, atomic_mass, melting_point_celsius, boiling_point_celsius, type_id FROM elements inner join properties using(atomic_number) inner join types using(type_id) WHERE name='$1'")
            PRINT
        fi
    fi
else
    echo "Please provide an element as an argument."
fi
