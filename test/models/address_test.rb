# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  address1   :string
#  address2   :string
#  city       :string
#  company    :string
#  email      :string
#  firstname  :string
#  lastname   :string
#  phone      :string
#  sex        :string
#  zipcode    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_addresses_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
