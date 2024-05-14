class CreateDechets < ActiveRecord::Migration[7.1]
  def change
    create_table :dechets do |t|
      t.string :reg_number
      t.string :radioelement
      t.string :waste_type
      t.float :activity
      t.boolean :eleminated
      t.float :half_life
      t.date :elimination_date
      t.timestamps
    end
  end
end
