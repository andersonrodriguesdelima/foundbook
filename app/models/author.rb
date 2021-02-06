class Author < ApplicationRecord
  include Researcher

  validates :name, presence: true, uniqueness: true

  scope :by_name, ->(name) { where('LOWER(name) LIKE ?', "%#{name.downcase}%") }
end
