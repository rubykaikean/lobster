require "test_helper"

describe SalesNotifier do
  it "confirmation" do
    mail = SalesNotifier.confirmation
    mail.subject.must_equal "Confirmation"
    mail.to.must_equal ["to@example.org"]
    mail.from.must_equal ["from@example.com"]
    mail.body.encoded.must_match "Hi"
  end
end
