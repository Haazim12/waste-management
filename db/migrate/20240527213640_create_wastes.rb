class CreateWastes < ActiveRecord::Migration[7.1]
  def change
    create_table :wastes do |t|
      t.string :reg_number
      t.string :waste_type
      # t.string :solid_type
      t.float :activity
      t.float :weight
      t.float :total_volume
      t.boolean :infectious, default: false
      t.integer :patients_count

      t.references :examination, null: true, foreign_key: true
      t.references :tank, null: true, foreign_key: true
      t.references :radioelement, null: true, foreign_key: true

      #CONTROL

      t.boolean :eliminated, default: false
      t.datetime :elimination_date
      t.float :volumic_activity
      t.float :risidual_activity
      t.float :bdf
      t.text :description

      t.timestamps
    end
  end
end
