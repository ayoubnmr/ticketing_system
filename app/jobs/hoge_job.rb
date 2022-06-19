class HogeJob < ActiveJob::Base
  sidekiq_options queue: :default, retry: 3
  queue_as :default
  # queue_as :default

  # def perform(*args)
  #   # Do something later
  # end
  def perform(ticket)
    msg = "A task was created with the following title: #{ticket.title}"
    log = Log.create! ticket_id: task.id, message: msg

    puts log.message
  end
end