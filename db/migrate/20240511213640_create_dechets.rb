class CreateDechets < ActiveRecord::Migration[7.1]
  def change
    create_table :dechets do |t|
      t.string :reg_number
      t.string :radioelement
      t.string :waste_type
      t.float :activity
      t.boolean :eliminated
      t.datetime :elimination_date
      t.float :half_life
      t.float :volumic_activity
      t.float :bdf
      t.timestamps
    end
  end
end
