# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  date                   :datetime
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  password               :password
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    has_many:posts
    has_and_belongs_to_many :events
end
