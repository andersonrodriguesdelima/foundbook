class Book < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :author_id, presence: true

  belongs_to :author

  scope :by_name_or_desc, ->(name) { where('LOWER(name) LIKE ? OR LOWER(description) LIKE ?',
                                      "%#{name.downcase}%", "%#{name.downcase}%") }
  scope :by_author_id, ->(author_id) { where(author_id: author_id) }
  scope :by_order_name, ->(value) { order("name #{value}") }

  def author_name
    author.name || '-'
  end

  def self.search(filter_params, order_params)
    books = self.all
    unless filter_params.blank?
      filter_params.each do |filter, value|
        books = books.send('by_' + filter, value) if value.present?
      end
    end
    unless order_params.blank?
      param, value = order_params.split('-')
      books = books.send('by_order_' + param, value) if value.present?
    end

    return books
  end

  def self.orders
    [
      { 'name-asc': 'Name (A-Z)' },
      { 'name-desc': 'Name (Z-A)' }
    ]
  end
end
