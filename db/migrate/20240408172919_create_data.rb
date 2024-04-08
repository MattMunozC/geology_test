class CreateData < ActiveRecord::Migration[7.1]
  def change
    create_table :data, id: false do |t|
      t.string :id
      t.boolean :tsunami
      t.string :magType
      t.text :url
      t.text :place
      t.string :title
      t.timestamps
    end
    add_column :data, :magnitud, :decimal
    add_column :data, :longitude, :decimal
    add_column :data, :latitude, :decimal
    add_column :data, :time, :timestamps
  end
end
