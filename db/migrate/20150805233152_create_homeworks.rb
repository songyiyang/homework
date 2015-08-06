class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :subject, null: false
      t.text :content, null: false
      t.datetime :due_date, null: false

      t.timestamps null: false
    end

    add_reference :homeworks, :user, index: true, foreign_key: true
    add_index :homeworks, :subject, unique: true
  end
end
