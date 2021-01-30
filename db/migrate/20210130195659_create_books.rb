class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.text :description
      t.text :image_url
      t.integer :author_id

      t.timestamps
    end
  end
end
