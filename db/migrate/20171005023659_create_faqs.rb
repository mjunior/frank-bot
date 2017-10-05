class CreateFaqs < ActiveRecord::Migration[5.1]
  def change
    create_table :faqs do |t|
      t.string :question
      t.string :answer
      t.integer :company_id
    end
  end
end
