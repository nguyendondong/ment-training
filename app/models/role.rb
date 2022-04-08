# == Schema Information
#
# Table name: roles
#
#  id          :integer          not null, primary key
#  destription :string
#  name        :string           default("user")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Role < ActiveRecord::Base
    has_many:users
    
end
