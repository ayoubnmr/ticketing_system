require "test_helper"
require "sidekiq/testing"

class HogeJobTest < ActiveJob::TestCase
  # test "the truth" do
  #   assert true
  # end
end
require "test_helper"
require "sidekiq/testing"

class TaskLoggerJobTest < ActiveJob::TestCase
  def setup
    @ticket = create(:ticket)
  end

  test 'logger runs once after creating a new task' do
    assert_enqueued_with(job: HogeJob, args: [@ticket])
    perform_enqueued_jobs
    assert_performed_jobs 1
  end

  test 'log count increments on running task logger' do
    Sidekiq::Testing.inline!
    assert_difference "Log.count", 1 do
      HogeJob.new.perform(@ticket)
    end
  end
end