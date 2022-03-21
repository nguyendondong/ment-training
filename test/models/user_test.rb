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
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
