class AddCreatedToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :created, :date
  end
end
