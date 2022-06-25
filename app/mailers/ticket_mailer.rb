class TicketMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_mailer.ticket_created.subject
  #
  def ticket_created
    @project = params[:project]
    @user = params[:user]
    @ticket = params[:ticket] 
    mail to: @user.email, subject: ",I created a new Ticket,#{@ticket.name}, in #{@project.name}", form: 'info@gmail.com' 
    
  end
end
