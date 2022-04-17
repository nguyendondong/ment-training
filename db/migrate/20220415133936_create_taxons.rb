class CreateTaxons < ActiveRecord::Migration[6.0]
  def change
    create_table :taxons do |t|
      t.string :name
      t.string :meta_title
      t.string :meta_description

      t.timestamps
    end
  end
end
