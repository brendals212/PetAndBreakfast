class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :pet, foreign_key: true
      t.text :review
      t.float :cost

      t.timestamps
    end
  end
end
