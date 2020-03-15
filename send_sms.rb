require 'twilio-ruby'
  
# put your API credentials here (found on your Twilio dashboard)
    account_sid = ENV["AC1327995555d72de69354eb8d7546a8f5"]
    auth_token = ENV["dc42d764bed80ed6c5747054507a13ad"]

    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new(account_sid, auth_token)
    
    from = '+12029329830' # Your Twilio number
    to = '+12483301268' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Welcome to GigUp!"
)