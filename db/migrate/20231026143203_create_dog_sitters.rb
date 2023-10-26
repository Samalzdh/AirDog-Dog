class CreateDogSitters < ActiveRecord::Migration[7.1]
  def change
    create_table :dog_sitters do |t|
      t.string :first_name
      t.string :last_name
      t.belongs_to :city, index: true
      t.timestamps
    end
  end
end
