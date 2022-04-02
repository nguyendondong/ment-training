# == Schema Information
#
# Table name: products
#
#  id               :integer          not null, primary key
#  description      :string
#  meta_description :text
#  meta_keywords    :string
#  name             :string           not null
#  pictures         :json
#  sku              :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
