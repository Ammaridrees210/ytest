class AddUserIdTweet < ActiveRecord::Migration[7.0]
  def change
       add_reference :tweets, :user, foreign_key: true
  end
end
