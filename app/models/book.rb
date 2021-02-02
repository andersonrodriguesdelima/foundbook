class Book < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :author_id, presence: true

  belongs_to :author

  scope :by_name_or_desc, ->(name) { where('name LIKE ? OR description LIKE ?',
                                      "%#{name.downcase}%", "%#{name.downcase}%") }

  def author_name
    author.name || '-'
  end

  def self.search(filter_params)
    books = self.all
    return books if filter_params.blank?

    filter_params.each do |filter, value|
      books = books.send('by_' + filter, value)
    end

    return books
  end
end
