class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :possible_response
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
