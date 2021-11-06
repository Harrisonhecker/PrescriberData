class TopDoctorPrescriptions < ActiveRecord::Migration[6.1]
  def change
	change_table :products do |t|
		t.integer :TopDoctorPrescriptions
	end
  end
end
