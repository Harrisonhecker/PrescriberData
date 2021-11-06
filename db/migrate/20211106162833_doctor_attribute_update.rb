class DoctorAttributeUpdate < ActiveRecord::Migration[6.1]
  def change
	change_table :doctors do |t|
		t.string :FirstName
		t.string :LastName
	end
  end
end
