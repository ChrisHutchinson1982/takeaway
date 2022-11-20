# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class SendSMS
  def initialize(phone_number, delivery_time)
    @account_sid = ENV["TWILIO_ACCOUNT_SID"]
    @auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV["TWILIO_PHONE_NUMBER"] # Your Twilio number
    @to = phone_number
    @delivery_time = delivery_time
  end

  def send_sms

    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
    )

    return "SMS sent sucessfully"

  end

end 