class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :author
      t.string :tags
      t.date :created_at
      t.date :updated_at

      t.timestamps
    end
  end
end
