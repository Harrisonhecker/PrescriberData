class TopPrescriber < ActiveRecord::Migration[6.1]
  def change
	change_table :doctors do |t|
		t.boolean :TopPrescriber
	end
  end
end
