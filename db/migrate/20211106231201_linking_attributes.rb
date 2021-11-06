class LinkingAttributes < ActiveRecord::Migration[6.1]
  def change
	change_table :doctors do |t|
		t.string :DoctorsProduct
	end

	change_table :products do |t|
		t.string :TopDoctor
	end
  end
end
