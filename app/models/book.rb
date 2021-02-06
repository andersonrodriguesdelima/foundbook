class Book < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :author_id, presence: true

  belongs_to :author

  scope :by_name_or_desc, ->(name) { where('LOWER(name) LIKE ? OR LOWER(description) LIKE ?',
                                      "%#{name.downcase}%", "%#{name.downcase}%") }
  scope :by_author_id, ->(author_id) { where(author_id: author_id) }
  scope :by_order_name, ->(value) { order("name #{value}") }

  include Researcher

  def author_name
    author.name || '-'
  end

  def self.orders
    [
      { 'name-asc': 'Name (A-Z)' },
      { 'name-desc': 'Name (Z-A)' }
    ]
  end
end
