# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Event < ApplicationRecord
    has_and_belongs_to_many :events
    
end
