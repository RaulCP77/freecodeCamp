#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n" 

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
 # echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1|2|3|4|5) CLIENT_DATA $SERVICE_ID_SELECTED ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

CLIENT_DATA(){
  SERVICE_ID=$1

  echo -e "What's your phone number?"
  read CUSTOMER_PHONE
  
  if [[ -z $CUSTOMER_PHONE ]]
  then
    CLIENT_DATA "\nPlease insert a phone number."
  else 
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    if [[ -z $CUSTOMER_ID ]]
    then 
      echo -e "\nI don't have a record for that phone number, what's your name?" 
      read CUSTOMER_NAME

      CUSTOMER_ID=$($PSQL "INSERT INTO customers(name,phone) VALUES ('$CUSTOMER_NAME','$CUSTOMER_PHONE') RETURNING customer_id;")
      NEW_APPOINTMENT $SERVICE_ID $CUSTOMER_ID
    else
      NEW_APPOINTMENT $SERVICE_ID $CUSTOMER_ID
    fi
  fi
}

NEW_APPOINTMENT(){

  SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $1" | xargs)
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id = $2" | xargs)

  echo -e "\nWhat time would you like your $SERVICE, $CUSTOMER_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($2,$1,'$SERVICE_TIME')")
  echo -e "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."

}

MAIN_MENU
