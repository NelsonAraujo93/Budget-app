class CategoryProceeding < ApplicationRecord
  belongs_to :proceeding
  belongs_to :category
end
