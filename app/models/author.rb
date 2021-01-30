class Author < ApplicationRecord
  validate :name, presence: true
end
