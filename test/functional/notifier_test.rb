require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test "order_submitted" do
    mail = Notifier.order_submitted("Boo")
    assert_equal "Order submitted", mail.subject
    assert_equal ["contact@orvabud.com"], mail.to
    assert_equal ["no-replyp@orvabud.com"], mail.from
    assert_match "Вам надіслано замовлення:", mail.body.encoded
    assert_match "Boo", mail.body.encoded
  end

end
