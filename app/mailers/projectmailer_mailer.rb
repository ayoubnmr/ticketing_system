class ProjectmailerMailer < ApplicationMailer
  default from: 'anmr06765@gmail.com'

  
  def project_created
    @project = params[:project]
    @user = params[:user]
    @ticket = params[:ticket] 
    mail to: @user.email, subject: "I created a new Project,#{@project.name},", form: 'info@gmail.com' 
  end
end
