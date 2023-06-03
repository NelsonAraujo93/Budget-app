class CreateCategoryProceedings < ActiveRecord::Migration[7.0]
  def change
    create_table :category_proceedings do |t|
      t.timestamps
    end
  end
end
