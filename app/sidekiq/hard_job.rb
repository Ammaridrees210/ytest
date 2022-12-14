class HardJob
  include Sidekiq::Job

  # def perform(user_id)
  #   user = User.find(user_id)
  #   user.send_welcome_email!
  # end

  def perform(*args)
    UserMailer.welcome.deliver_now
  end
end

