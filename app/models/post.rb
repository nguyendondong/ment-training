# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  name       :string
#  picture    :string
#  pictures   :json
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Post < ApplicationRecord
    belongs_to:user 
    mount_uploader :picture, PictureUploader
    mount_uploader :pictures, PictureUploader
    

    class << self
      def import file
        posts_attributes = []
        CSV.foreach(file.path, headers: true, col_sep: " ", header_converters: :symbol) do |row|
          row = row.to_hash
          Post.create! row 
        end
      end
    end
    
end
