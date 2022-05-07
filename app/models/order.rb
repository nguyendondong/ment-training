# == Schema Information
#
# Table name: orders
#
#  id               :integer          not null, primary key
#  adjustment_total :float
#  completed_at     :datetime
#  email            :string
#  item_total       :float
#  number           :string
#  payment_state    :string
#  payment_total    :float
#  shipment_state   :string
#  state            :string
#  total            :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer          not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Order < ApplicationRecord
end
