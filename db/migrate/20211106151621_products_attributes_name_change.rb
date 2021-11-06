class ProductsAttributesNameChange < ActiveRecord::Migration[6.1]
  def change
	change_table :products do |t|
		t.rename :Month1NRx, :Month1NRxProduct
		t.rename :Month2NRx, :Month2NRxProduct
		t.rename :Month3NRx, :Month3NRxProduct
		t.rename :Month4NRx, :Month4NRxProduct
		t.rename :Month5NRx, :Month5NRxProduct
		t.rename :Month6NRx, :Month6NRxProduct
		t.rename :Month1TRx, :Month1TRxProduct
		t.rename :Month2TRx, :Month2TRxProduct
		t.rename :Month3TRx, :Month3TRxProduct
		t.rename :Month4TRx, :Month4TRxProduct
		t.rename :Month5TRx, :Month5TRxProduct
		t.rename :Month6TRx, :Month6TRxProduct
		t.rename :TotalNRx, :TotalNRxProduct
		t.rename :TotalTRx, :TotalTRxProduct
	end
  end
end
