curl -H "Content-Type: application/json" \
	 -H "Authorization: key=AAAAEDEc7jQ:APA91bHuoUsFUkH2D99yfF6lBPBebBKMZc1a32DzsTw8QlXj1wJfD8AqRHTliNcUHBNRMK6ABtBet3AVOn8f3oCsIahrg_d-9UfiD7BesKqYbXVCiau4iS4rnuDO8ywlGSOmcfgZweQK" \
	 -d '{
		"notification": {
			"title": "New chat message!",
			"body": "There is a new message in FriendlyChat",
			"icon": "/images/profile_placeholder.png",
			"click_action": "http://localhost:5000"
		},
		"to": "dG5KiNRbjwM:APA91bEvzmoqKlYHW1MWzJDvQAybxNaoxSxx6sKh-W-1tBYue7yTkSpePN965_9F6fpNBQbH8qoT4D8H_29Va9O4vunZ_3ArbkqLfp8N7AUJQ5JPC2YxjxAt8w3E3Yi20fNTE8_e6rT2"
		}' \
	 https://fcm.googleapis.com/fcm/send
