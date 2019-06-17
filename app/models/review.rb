# == Schema Information
#
# Table name: reviews
#
#  id               :integer          not null, primary key
#  whiskey_name     :string
#  rating           :string
#  review           :text
#  whiskey_entry_id :integer
#  user_id          :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Review < ApplicationRecord
    
    belongs_to :user
    belongs_to :whiskey_entry
    
    belongs_to(:owner, { :class_name => "User", :foreign_key => "user_id" })
    
end
