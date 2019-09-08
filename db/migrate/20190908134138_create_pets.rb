class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :photo
      t.integer :age
      t.string :type
      t.string :breed
      t.string :color
      t.text :description
      t.text :needs

      t.timestamps
    end
  end
end
