class AddAuthorAndCategoryToProceedings < ActiveRecord::Migration[7.0]
  def change
    add_reference :proceedings, :author, null: false, foreign_key: { to_table: :users }, index: true
    add_reference :proceedings, :category, null: false, foreign_key: true
  end
end
