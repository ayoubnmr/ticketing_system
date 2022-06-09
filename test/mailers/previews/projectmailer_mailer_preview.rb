# Preview all emails at http://localhost:3000/rails/mailers/projectmailer_mailer
class ProjectmailerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/projectmailer_mailer/project_created
  def project_created
    ProjectmailerMailer.project_created
  end

end
