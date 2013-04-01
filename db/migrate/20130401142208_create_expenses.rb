class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.decimal :amount
      t.string :name
      t.string :interval
      t.date :start_date
      t.integer :user_id

      t.timestamps
    end
  end
end
