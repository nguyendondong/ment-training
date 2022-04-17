# == Schema Information
#
# Table name: taxons
#
#  id               :integer          not null, primary key
#  meta_description :string
#  meta_title       :string
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
require 'test_helper'

class TaxonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
