User.create(email: "stevieWonders@whyami.blind", password: "gggggg")


Collection.create(title: "Gods", user_id: 1, description: "Because who doesn't love the ancients")
for i in 1..10 
  Design.create(title: Faker::Ancient.god, user_id: 1, collection_id: 1)
end

Collection.create(title: "Lovecraft", user_id: 1, description: "Scare your neighbours! Lovecraft!")
for i in 1..10 
  Design.create(title: Faker::Books::Lovecraft.deity, user_id: 1, collection_id: 2)
end


