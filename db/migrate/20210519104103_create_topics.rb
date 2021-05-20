class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|

      t.integer :sentence_id,          null: false
      t.text :description,           null: false
      t.references :user,         foreign_key: true
      
      t.timestamps
    end
  end
end
