class AddRefToCategoryProceedings < ActiveRecord::Migration[7.0]
  def change
    add_reference :category_proceedings, :proceeding, null: false, foreign_key: true
    add_reference :category_proceedings, :category, null: false, foreign_key: true
  end
end
