class DoctorsAttributes < ActiveRecord::Migration[6.1]
  def change
	change_table :products do |t|
		t.integer :ProductID
	end

	change_table :states do |t|
		t.integer :StateID
	end

	change_table :doctors do |t|
		t.integer :Month1NRxDoctor
		t.integer :Month2NRxDoctor
		t.integer :Month3NRxDoctor
		t.integer :Month4NRxDoctor
		t.integer :Month5NRxDoctor
		t.integer :Month6NRxDoctor
		t.integer :Month1TRxDoctor
		t.integer :Month2TRxDoctor
		t.integer :Month3TRxDoctor
		t.integer :Month4TRxDoctor
		t.integer :Month5TRxDoctor
		t.integer :Month6TRxDoctor
		t.integer :TotalNRxDoctor
		t.integer :TotalTRxDoctor
		t.integer :DoctorID
	end
  end
end
