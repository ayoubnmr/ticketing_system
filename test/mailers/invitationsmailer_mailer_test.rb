require "test_helper"

class InvitationsmailerMailerTest < ActionMailer::TestCase
  test "invitations_mailer" do
    mail = InvitationsmailerMailer.invitations_mailer
    assert_equal "Invitations mailer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
