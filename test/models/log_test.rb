# == Schema Information
#
# Table name: logs
#
#  id         :bigint           not null, primary key
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  task_id    :integer
#
require "test_helper"

class LogTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
