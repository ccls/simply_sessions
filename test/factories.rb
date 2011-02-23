Factory.define :user do |f|
	f.sequence(:uid) { |n| "UID#{n}" }
end
