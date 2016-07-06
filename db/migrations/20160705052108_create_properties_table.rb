Hanami::Model.migration do
  change do
    create_table :properties do
      primary_key :id
      column :title, String
      column :description, String
      column :price, Float
      column :x, Integer, null: false
      column :y, Integer, null: false
      column :beds, Integer, null: false
      column :baths, Integer, null: false
      column :square_meters, Integer, null: false
    end
  end
end
