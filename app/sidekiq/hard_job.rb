class HardJob
  include Sidekiq::Job
  
  def perform(*args)
    UserMailer.welcome.deliver_now
  end
end

