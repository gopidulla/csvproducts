class CreateBills < ActiveRecord::Migration[5.0]
  def change
    create_table :bills do |t|
      t.string :section
      t.string :year
      t.string :month
      t.string :dvno
      t.string :typebill
      t.string :compactor
      t.string :rock
      t.string :shelf

      t.timestamps
    end
  end
end
