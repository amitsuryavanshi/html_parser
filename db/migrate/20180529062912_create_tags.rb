class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.text :content
      t.string :name
      t.integer :document_id

      t.timestamps
    end
  end
end
