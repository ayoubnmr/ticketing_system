class TicketEndJob < ApplicationJob
  queue_as :default
  def perform(ticket , project , user) 
    if ticket.status == "InProgress" || ticket.status == "ToDo"
       TicketMailer.with(project: project, user: user, ticket: ticket).ticket_created.deliver_now
    end
  end
end
