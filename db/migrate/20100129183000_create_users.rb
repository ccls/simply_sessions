class CreateUsers < ActiveRecord::Migration
	def self.up
		create_table :users do |t|
			t.string :uid
		end
		add_index :users, :uid, :unique => true
	end

	def self.down
		drop_table :users
	end
end
