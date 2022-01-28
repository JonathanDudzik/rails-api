class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :language
      t.string :author
      t.integer :published
      t.text :excerpt
      t.string :image_url

      t.timestamps
    end
  end
end
