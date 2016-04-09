class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.integer :figure_id
      t.date :year_completed
      t.timestamps null: false
    end
  end
end
