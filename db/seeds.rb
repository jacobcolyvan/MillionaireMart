User.create(email: "stevieWonders@whyami.blind", password: "gggggg")


Collection.create(title: "Gods", user_id: 1, description: "Because who doesn't love the ancients")
for i in 1..10 
  Listing.create(title: Faker::Ancient.god, user_id: 1, collection_id: 1)
end

Collection.create(title: "Lovecraft", user_id: 1, description: "Scare your neighbours! Lovecraft!")
for i in 1..10 
  Listing.create(title: Faker::Books::Lovecraft.deity, user_id: 1, collection_id: 2)
end


# Collection.create(title: "Animals", user_id: 1, description: "because everybody loves fur", picture: File.open('app/assets/images/animals/cod.jpg'))
