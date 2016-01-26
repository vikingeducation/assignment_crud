class CreateCruds < ActiveRecord::Migration
  def change
    create_table :cruds do |t|
      t.text :title
      t.text :body


      t.timestamps null: false
    end
  end
end
