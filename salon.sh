#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
SERVICES=$($PSQL "SELECT * FROM services")

echo -e "\n~~~~~ Salon Appointments ~~~~~\n"

MAIN_MENU() {
if [[ $1 ]]
  then
  echo -e "\n$1"
fi

echo -e "Pick a service"
echo -e "$SERVICES" | while read SERVICE_ID NAME
do
  echo $(echo $SERVICE_ID\) $NAME | sed 's/| //')
done

read SERVICE_ID_SELECTED

AVAILABLE_SERVICE=$($PSQL "SELECT * FROM services WHERE service_id='$SERVICE_ID_SELECTED'")

if [[ -z $AVAILABLE_SERVICE ]]
  then
  MAIN_MENU "Option selected does not exists\n"

  else
  SCHEDULE_APPOINTMENT
fi
}

SCHEDULE_APPOINTMENT() {
echo -e "\nEnter your phone number"

read CUSTOMER_PHONE

EXISTING_CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

if [[ -z $EXISTING_CUSTOMER ]]
  then
  echo -e "\nEnter your name"
  read CUSTOMER_NAME

  INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
fi

echo -e "\nSelect a time to schedule"

read SERVICE_TIME

EXISTING_CUSTOMER=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$EXISTING_CUSTOMER', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")

if [[ $INSERT_APPOINTMENT_RESULT ]]
  then
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  SERVICE_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
  echo -e $(echo "\nI have put you down for a $SERVICE_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME.\n" | sed 's/| //')
fi
}

MAIN_MENU

  
