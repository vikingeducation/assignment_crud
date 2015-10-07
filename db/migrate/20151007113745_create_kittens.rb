class CreateKittens < ActiveRecord::Migration
  def change
    create_table :kittens do |t|
      t.string :name
      t.text :bio
      t.string :picture

      t.timestamps null: false
    end
  end
end
