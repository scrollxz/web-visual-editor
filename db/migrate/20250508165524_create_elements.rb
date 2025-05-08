class CreateElements < ActiveRecord::Migration[7.0]
  def change
    create_table :elements do |t|
      t.references :website, foreign_key: true, null: false
      t.string :element_type, null: false
      t.string :content
      t.float :x
      t.float :y
      t.float :width
      t.float :height
      t.float :rotation
      t.json :styles

      t.timestamps
    end
  end
end
