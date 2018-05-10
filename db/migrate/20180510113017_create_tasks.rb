class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :deadline
      t.boolean :done, default: false
      t.references :list, foreign_key: true

      t.timestamps
    end
  end
end
