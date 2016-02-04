class AuthorIndex < ActiveRecord::Migration
  def change
    add_index :posts, :author_id
    add_column :posts, :crap, :string

    puts "Doing weird things to migrations..."
  end
end
