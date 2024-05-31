class CreateWastes < ActiveRecord::Migration[7.1]
  def change
    create_table :wastes do |t|
      t.string :reg_number
      t.string :waste_type
      t.string :radioelement
      t.string :solid_type
      t.float :activity
      t.float :weight
      t.float :volume
      t.boolean :infectious, default: false
      t.boolean :eliminated, default: false
      t.datetime :elimination_date
      t.float :half_life
      t.float :volumic_activity
      t.float :risidual_activity
      t.float :bdf
      t.text :description
      # t.references :tank, null: true, foreign_key: true
      t.timestamps
    end
  end
end
