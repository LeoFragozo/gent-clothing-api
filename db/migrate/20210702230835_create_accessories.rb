class CreateAccessories < ActiveRecord::Migration[6.1]
  def change
    create_table :accessories do |t|
      t.string :description
      t.string :dresscode
      t.string :color
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
