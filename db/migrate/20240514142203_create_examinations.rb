class CreateExaminations < ActiveRecord::Migration[7.1]
  def change
    create_table :examinations do |t|
      t.string :exam_type
      t.float :volume

      t.timestamps
    end
    9589
  end
end
