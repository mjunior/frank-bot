class CreateCompany < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
    end
  end
end
