class CreateRadioelements < ActiveRecord::Migration[7.1]
  def change
    create_table :radioelements do |t|
      t.string :name
      t.float :half_life
      t.timestamps
    end
  end
end
