class AddBandRefToUsers < ActiveRecord::Migration[8.0]
  def change
    add_reference :users, :band
  end
end
