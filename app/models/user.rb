class User < ApplicationRecord
  has_many :proceedings, foreign_key: 'author_id'
  has_many :categories, foreign_key: 'author_id'
end
