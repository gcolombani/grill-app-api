class CreateBarbecues < ActiveRecord::Migration[5.2]
  def change
    create_table :barbecues do |t|
      t.belongs_to :owner
      t.string :model, null: false, default: ""
      t.text :description, null: false
      t.timestamps
    end
  end
end
