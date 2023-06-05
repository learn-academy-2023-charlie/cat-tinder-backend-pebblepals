class CreateRocks < ActiveRecord::Migration[7.0]
  def change
    create_table :rocks do |t|
      t.string :name
      t.string :age
      t.text :enjoys
      t.text :image

      t.timestamps
    end
  end
end
