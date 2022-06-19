class ProjectmailerMailer < ApplicationMailer
  default from: 'anmr06765@gmail.com'

  
  def project_created(user)
    @user = user

    mail to: @user.email, subject: 'I created a new Project', form: 'info@gmail.com' 
    
  end
end
