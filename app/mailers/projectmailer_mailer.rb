class ProjectmailerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.projectmailer_mailer.project_created.subject
  #
  def project_created
    @greeting = "Hi"

    mail to: User.all.pluck(:email),subject: 'I created a new Project' 

  end
end
