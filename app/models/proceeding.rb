class Proceeding < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :category_proceedings, dependent: :destroy
  has_many :categories, through: :category_proceedings

  validates :name, presence: true
  validates :amount, presence: true, comparison: { greater_than: 0 }
end
