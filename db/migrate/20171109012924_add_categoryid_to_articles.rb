class AddCategoryidToArticles < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :categoryid, :integer
  end
end
