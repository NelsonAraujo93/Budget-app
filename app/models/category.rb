class Category < ApplicationRecord
  has_many :proceedings
  belongs_to :user
end
