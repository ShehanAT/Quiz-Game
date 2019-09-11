class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.integer :collection_id
      t.string :name
      t.integer :quiz_number

      t.timestamps
    end
  end
end
