class AddTitleAndBodyToNotices < ActiveRecord::Migration
  def change
    add_column :notices, :title, :string
    add_column :notices, :body, :string
  end
end
