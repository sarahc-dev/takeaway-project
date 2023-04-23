require 'twilio-ruby'
require 'dotenv/load'

class ConfirmOrder
  def initialize(client)
    @client = client
  end

  def send_text
    # account_sid = ENV['ACCOUNT_SID']
    # auth_token = ENV['AUTH_TOKEN']
    # client = @client.new(account_sid, auth_token)
    
    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MY_NUMBER'] # Your mobile phone number
    
    message = @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
    # puts message.sid
  end
end

# to use
# text = ConfirmOrder.new(Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']))
# text.send_text


