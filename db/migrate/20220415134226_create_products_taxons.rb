class CreateProductsTaxons < ActiveRecord::Migration[6.0]
  def change
    create_table :products_taxons do |t|
      t.references :product, null: false, foreign_key: true
      t.references :taxon, null: false, foreign_key: true
    end
  end
end
