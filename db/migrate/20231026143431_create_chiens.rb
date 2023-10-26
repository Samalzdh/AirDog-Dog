class CreateChiens < ActiveRecord::Migration[7.1]
  def change
    create_table :chiens do |t|
      t.string :name
      t.string :breed
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
