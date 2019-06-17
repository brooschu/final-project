# == Schema Information
#
# Table name: whiskey_entries
#
#  id           :integer          not null, primary key
#  image        :string
#  user_id      :integer
#  whiskey_name :string
#  type_id      :integer
#  rating       :integer
#  note_text    :text
#  price        :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class WhiskeyEntry < ApplicationRecord
    
    belongs_to :user
    has_many :reviews, :dependent => :destroy
    belongs_to :type
    
    belongs_to(:match, { :class_name => "Type", :foreign_key => "type_id" })

    
end
