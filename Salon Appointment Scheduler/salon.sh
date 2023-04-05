#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~~ Salon Appointment Scheduler ~~~~"
MAIN_MENU(){

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT service_id,name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read ID BAR SERVICE
  do
    echo -e "$ID) $SERVICE\n"
  done

  read SERVICE_ID_SELECTED
  # If is not a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Please enter a valid number"
  else
    VALID_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $VALID_SERVICE ]]
    then
      MAIN_MENU "This service doesn't exist"
    else
      echo -e "What's your phone number?"
      read CUSTOMER_PHONE
      
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
      if [[ -z $CUSTOMER_NAME ]]
      then
        echo -e "I don't have a record for that number, What's your name?"
        read CUSTOMER_NAME
        INSERT_CUS=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
        SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
        echo -e "What time would you like to schedule your $SERVICE_NAME, $CUSTOMER_NAME?"
        read SERVICE_TIME

        
        # Inserting the appointment
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
        echo $CUSTOMER_ID
        INSERT_AP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
        echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      else

      SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
      echo -e "What time would you like to schedule your $SERVICE_NAME, $CUSTOMER_NAME?"
      read SERVICE_TIME
      INSERT_AP=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
      echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
      fi
    fi
  fi

}



MAIN_MENU



