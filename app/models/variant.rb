# == Schema Information
#
# Table name: variants
#
#  id         :integer          not null, primary key
#  color      :string
#  cost_price :string
#  size       :string
#  sku        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer          not null
#
# Indexes
#
#  index_variants_on_product_id  (product_id)
#
# Foreign Keys
#
#  product_id  (product_id => products.id)
#
class Variant < ApplicationRecord
  belongs_to :product
 
end
