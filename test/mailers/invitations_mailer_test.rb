require "test_helper"

class InvitationsMailerTest < ActionMailer::TestCase
  test "invitations" do
    mail = InvitationsMailer.account_invitation
    assert_equal "Invitations", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
