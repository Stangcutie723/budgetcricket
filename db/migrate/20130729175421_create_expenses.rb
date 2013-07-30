class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :title
      t.text :description
      t.references :budget

      t.timestamps
    end
  end
end
