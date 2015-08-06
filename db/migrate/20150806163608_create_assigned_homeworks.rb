class CreateAssignedHomeworks < ActiveRecord::Migration
  def change
    create_table :assigned_homeworks do |t|
      t.references :user, index: true, foreign_key: true
      t.references :homework, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
