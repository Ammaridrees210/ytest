class Tweet < ApplicationRecord
    belongs_to :user 
    validates :title,:description, presence: true, uniqueness: true
    validates :user_id, presence: true

    before_destroy :print_before_destroy_massage
    after_destroy :print_after_destroy_massage
 
 
    def print_before_destroy_massage
      puts "======================"
      puts "I am excuted before destroy"
      puts "======================"
    end
 
    def print_after_destroy_massage
      puts "====================="
      puts "i am excuted after destroy"
      puts "====================="
    end
    
    # Tweet have a relation with user, and user_id is the TWEET attribute in Tweet tabel, which reperesents the user
    # User_id in Tweet Model cannot be null.
    # If yiu any record in Tweet which have nil user_id, we can update it as
    # @t = Tweet.find(user_id: nil) || Tweet.all
    # users = User.all => to View all users and ids
    # @t.user_id = "pass any user id"
    # @t.save => to update the tweet record

   #  after_initialize do 
   #    self.current_user.tweet.publish_at ||= 24.hours.form_now
   #  end

   #  def published?
   #    tweet_id?
   #  end
    
 end
 