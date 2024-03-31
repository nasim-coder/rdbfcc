#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\nWe offer these services, please choose the service you want.\n"

CHOOSE_SERVICE() {
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ -z $SERVICE_ID_SELECTED ]]; then
    CHOOSE_SERVICE
  else
    BOOKING $SERVICE_ID_SELECTED
  fi
}

BOOKING() {
  if [[ ! $1 =~ ^[1-5]+$ ]]; then
    CHOOSE_SERVICE
  else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$1")
    echo -e "\nPlease enter your phone number:"
    read CUSTOMER_PHONE
    CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER ]]; then
      echo -e "\nPlease enter your name:"
      read CUSTOMER_NAME
      echo $($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo -e "\nPlease enter time:"
      read SERVICE_TIME
      echo $($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER_ID, $1)")
      echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    else
      echo -e "\nPlease enter time:"
      read SERVICE_TIME
      echo $($PSQL "INSERT INTO appointments(time, customer_id, service_id) VALUES ('$SERVICE_TIME', $CUSTOMER, $1)")
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo "I have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

CHOOSE_SERVICE
