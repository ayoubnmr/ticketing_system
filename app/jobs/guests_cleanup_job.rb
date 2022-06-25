class GuestsCleanupJob < ApplicationJob
  queue_as :urgent

  def perform(ticket , project)
    project.users.each do |u|
      TicketMailer.with(project: project, user: u, ticket: ticket).ticket_created.deliver_now
    end
  end
end
