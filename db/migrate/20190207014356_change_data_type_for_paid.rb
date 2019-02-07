class ChangeDataTypeForPaid < ActiveRecord::Migration[5.2]
  def change
    change_column(:bookings, :paid, :integer)
  end
end
