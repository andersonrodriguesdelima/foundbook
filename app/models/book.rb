class Book < ApplicationRecord
  validate :name, presence: true
  validate :description, presence: true
  validate :author_id, presence: true

  belongs_to :author
end
