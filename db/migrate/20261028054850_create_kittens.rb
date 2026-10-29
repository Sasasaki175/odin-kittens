class CreateKittens < ActiveRecord::Migration[8.1]
  def change
    create_table :kittens do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :cuteness, null: false
      t.string :softness, null: false

      t.timestamps
    end
  end
end
