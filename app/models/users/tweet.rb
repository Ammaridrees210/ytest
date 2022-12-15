class Users::Tweet < ApplicationRecord
    belongs_to :user 
    validates :title,:description, presence: true, uniqueness: true


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
    
end
