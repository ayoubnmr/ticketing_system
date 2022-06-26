class Ticket < ApplicationRecord
  belongs_to :project
  enum status: {
    ToDo: 0,
    InProgress: 1,
    Done: 2
  }
  has_one_attached :avatar
  
  after_save :perform

  def perform
    if Date.today == self.end && (status = 1)
      project.users.each do |user|
        TicketEndJob.set(wait_until: self.end.to_time).perform_later(self, project ,user )
      end
    end
  end 
end
