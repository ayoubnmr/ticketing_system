# Preview all emails at http://localhost:3000/rails/mailers/invitationsmailer_mailer
class InvitationsmailerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitationsmailer_mailer/invitations_mailer
  def invitations_mailer
    InvitationsmailerMailer.invitations_mailer
  end

end
