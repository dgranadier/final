require 'twilio-ruby'
  
# put your API credentials here (found on your Twilio dashboard)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = '+12029329830' # Your Twilio number
    to = '+12483301268' # Your mobile phone number


client.messages.create(
from: from,
to: to,
body: "Welcome to GigUp!")