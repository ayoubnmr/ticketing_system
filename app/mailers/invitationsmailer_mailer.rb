class InvitationsmailerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.invitationsmailer_mailer.invitations_mailer.subject
  #
  def invitations_mailer
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
