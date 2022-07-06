class TicketEndJob < ApplicationJob
  queue_as :default
  def perform(ticket , project , user) 
    if ticket.status != "Done"
       TicketMailer.with(project: project, user: user, ticket: ticket).ticket_created.deliver_now
    end
  end
end
