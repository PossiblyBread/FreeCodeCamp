#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --no-align --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU() {
  SERVICES=$($PSQL "SELECT service_id, name FROM services")

  echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
  do 
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]+$ ]]
  then
    MAIN_MENU "Please enter a valid number."

  else 
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    #check data from database
    GET_PHONE_NUMBER=$($PSQL "SELECT phone FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    
    if [[ -z $GET_PHONE_NUMBER ]]
    then 
      # For New Customers
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME 

      INSERT_CUSTOMER_DATA=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    fi
    
    GET_CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    GET_SERVICE_ID_NAME=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")

    echo -e "\nI What time would you like your cut, $GET_CUSTOMER_NAME?"
    read SERVICE_TIME 

    echo -e "\nI have put you down for a $GET_SERVICE_ID_NAME at $SERVICE_TIME, $GET_CUSTOMER_NAME."

    GET_CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    GET_SERVICE_ID=$SERVICE_ID_SELECTED

    INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$GET_CUSTOMER_ID','$GET_SERVICE_ID','$SERVICE_TIME')")
  fi

}

MAIN_MENU

# read SERVICE_ID_SELECTED /
# read CUSTOMER_PHONE /
# read CUSTOMER_NAME /
# read SERVICE_TIME /
