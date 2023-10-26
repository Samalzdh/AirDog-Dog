class CreateStrolls < ActiveRecord::Migration[7.1]
  def change
    create_table :strolls do |t|
      t.belongs_to :chien, index: true
      t.belongs_to :dog_sitter, index: true
      t.timestamps
    end
  end
end
