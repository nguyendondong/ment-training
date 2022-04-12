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
class Product < ApplicationRecord
    mount_uploaders :pictures, PictureUploader
    serialize :pictures

    class << self
        def import file
          products_attributes = []
          CSV.foreach(file.path, headers: true, col_sep: ",", header_converters: :symbol) do |row|
            row = row.to_hash
            Product.create! row 
          end
        end
      end
      
end
