class AddDateToTransaction < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :date, :datetime
  end
end
