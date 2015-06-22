# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



source = [
						"Agent",
						"Billboard/Bunting/Banner",
						"Brochure/leaflet/Flyers",
						"Email/SMS",
						"Newspaper Ad",
						"Referal(Family/Friend)",
						"Road Show/Property",
						"Staff/Contra/RPT",
						"Walk-In",
						"Social Media(FB, Whatsapp/etc)",
						"Website",
						"Word of Mounth",
						"Others"
]

region = [
					"Perlis",
					"Kedah",
					"Pulau Pinang",
					"Perak",
					"Negeri Sembilan",
					"Kuala Lumpur",
					"Melaka",
					"Johor",
					"Pahang",
					"Selangor",
					"Terengganu",
					"Sabah",
					"Sarawak"
]

#admin = Admin.create!(display_name: "Super Admin", email: "dev@estatekitkat.com", password: "12345678", password_confirmation: "12345678", username: "admin")
#puts admin

Product.all.each do |product|
	region.each do |name|
		name = Region.create(:name => name, :product_id => product.id)
	end
	source.each do |name|
		name = SourcesType.create(:name => name)
	end
end

