require 'confirm_order'

describe ConfirmOrder do
  it "sends a text message to confirm order" do
    client = double :client
    allow(client).to receive(:messages)   
    allow(client.messages).to receive(:create).with({body: "Thank you! Your order was placed and will be delivered before 18:52", from: ENV['TWILIO_NUMBER'], to: ENV['MY_NUMBER']}).and_return "sends text"
    # What does api return?
    text = ConfirmOrder.new(client)
    expect(text.send_text).to eq "sends text"
  end
end