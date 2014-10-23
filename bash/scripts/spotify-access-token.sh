#!/bin/sh

CLIENT_ID=03ffe0cac0a0401aa6673c3cf6d02ced
CLIENT_SECRET=a57c43efb9644574a96d6623fb8bfbc2
REDIRECT_URI=http%3a%2f%2flocalhost%3a8888%2f
SCOPES=user-read-private,user-read-email

if [ "$1" = "auth" ]
then
    USERNAME=$2
    SCOPES=$3

    echo "Finding user id for $USERNAME..."
    USERID=`jhurl -p -2 -s services.ash2 "hm://identifier?username=$USERNAME" | jq -r '.[0].user_id'`
    # echo "User id: $USERID"

    echo "Getting access token..."
    echo `jhurl -p -s services.ash2 --method GET "hm://keymaster/token/access?client_id=$CLIENT_ID&client_secret=$CLIENT_SECRET&user_id=$USERID&scope=$SCOPES&redirect_uri=$REDIRECT_URI&alt=json" | jq -r '.access_token'`

    exit 0
fi

echo "syntax:"
echo "\tspapi auth [username] [scopes]"
echo ""
echo "example:"
echo "\tspapi auth possan user-read-private,user-read-email"
echo ""
echo ""
exit 1
