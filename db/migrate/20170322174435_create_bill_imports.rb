class CreateBillImports < ActiveRecord::Migration[5.0]
  def change
    create_table :bill_imports do |t|

      t.timestamps
    end
  end
end
