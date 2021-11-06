class StateAttributes < ActiveRecord::Migration[6.1]
  def change
	change_table :states do |t|
		t.integer :Month1NRxState
		t.integer :Month2NRxState
		t.integer :Month3NRxState
		t.integer :Month4NRxState
		t.integer :Month5NRxState
		t.integer :Month6NRxState
		t.integer :Month1TRxState
		t.integer :Month2TRxState
		t.integer :Month3TRxState
		t.integer :Month4TRxState
		t.integer :Month5TRxState
		t.integer :Month6TRxState
		t.integer :TotalNRxState
		t.integer :TotalTRxState
	end
  end
end
