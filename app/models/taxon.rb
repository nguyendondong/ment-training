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
class Taxon < ApplicationRecord
    has_and_belongs_to_many :products
end
