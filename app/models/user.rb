# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  date                   :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  password               :
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  role_id                :integer
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_role_id               (role_id)
#
# Foreign Keys
#
#  role_id  (role_id => roles.id)
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many:posts , dependent: :destroy, inverse_of: :user
    has_and_belongs_to_many :events
    belongs_to :role
    accepts_nested_attributes_for :posts, allow_destroy: true,
    reject_if: proc{|attributes| attributes["name"].blank?}

    
 
end
