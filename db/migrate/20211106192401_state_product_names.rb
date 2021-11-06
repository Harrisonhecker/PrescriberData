class StateProductNames < ActiveRecord::Migration[6.1]
  def change
	change_table :states do |t|
		t.string :StateName
	end

	change_table :products do |t|
		t.string :ProductName
	end
  end
end
