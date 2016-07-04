Hanami::Model.migration do
  change do
    create_table :provinces do
      primary_key :id
      column :name, String, null: false
      column :top, Integer, null: false
      column :left, Integer, null: false
      column :bottom, Integer, null: false
      column :right, Integer, null: false
    end
  end
end
