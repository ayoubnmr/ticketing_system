require "test_helper"

class ProjectmailerMailerTest < ActionMailer::TestCase
  test "project_created" do
    mail = ProjectmailerMailer.project_created
    assert_equal "Project created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
