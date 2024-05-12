class CreateDechets < ActiveRecord::Migration[7.1]
  def change
    create_table :dechets do |t|
      t.string :radioelement
      t.string :matricule
      t.string :origine
      t.string :forme
      t.boolean :infectueux
      t.text :observasion
      t.date :date_elimination

      t.timestamps
    end
  end
end
