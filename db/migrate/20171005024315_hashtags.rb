class Hashtags < ActiveRecord::Migration[5.1]
  def change
    create_table :hashtags do |t|
      t.string :name
      t.integer :company_id
    end
  end
end
