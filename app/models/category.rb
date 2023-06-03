class Category < ApplicationRecord
  has_many :category_proceedings, dependent: :destroy
  has_many :proceedings, through: :category_proceedings
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
