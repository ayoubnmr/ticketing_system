class Ticket < ApplicationRecord
  belongs_to :project
  enum status: {
    ToDo: 0,
    InProgress: 1,
    Done: 2
  }
end