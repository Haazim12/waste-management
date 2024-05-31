class CreateTanks < ActiveRecord::Migration[7.1]
  def change
    create_table :tanks do |t|
      t.string :radioelement
      t.float :full_capacity
      t.float :current_capacity

      t.timestamps
    end
  end
end
