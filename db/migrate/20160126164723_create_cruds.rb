class CreateCruds < ActiveRecord::Migration
  def change
    create_table :cruds do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end