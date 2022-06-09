# Preview all emails at http://localhost:3000/rails/mailers/invitations_mailer
class InvitationsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/invitations_mailer/invitations
  def invitations
    InvitationsMailer.account_invitation
  end

end
