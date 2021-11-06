class ProductAttributes < ActiveRecord::Migration[6.1]
  def change
	change_table :products do |t|
		t.integer :Month1NRx
		t.integer :Month2NRx
		t.integer :Month3NRx
		t.integer :Month4NRx
		t.integer :Month5NRx
		t.integer :Month6NRx
		t.integer :Month1TRx
		t.integer :Month2TRx
		t.integer :Month3TRx
		t.integer :Month4TRx
		t.integer :Month5TRx
		t.integer :Month6TRx
		t.integer :TotalNRx
		t.integer :TotalTRx
	end
  end
end
