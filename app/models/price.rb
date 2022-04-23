# == Schema Information
#
# Table name: prices
#
#  id         :integer          not null, primary key
#  amount     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  variant_id :integer          not null
#
# Indexes
#
#  index_prices_on_variant_id  (variant_id)
#
# Foreign Keys
#
#  variant_id  (variant_id => variants.id)
#
class Price < ApplicationRecord
  belongs_to :variant
end
