# Parse Push Notification

Easy way to send push notifications with Parse

## Instalation

Add this line to your application's Gemfile:

	gem 'parse_push_notification'

## Usage

Example:

	push = ParsePushNotification::Push.new(PARSE_APP_ID, PARSE_REST_API_KEY)
	push.alert = 'Hello world!'
	push.send