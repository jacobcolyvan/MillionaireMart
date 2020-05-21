User.create(email: "stevieWonders@whyami.blind", password: "gggggg")


Collection.create(title: "CashWad", user_id: 1, description: "Cash!")
for i in 1..2
  Listing.create(title: "CashWad#{i}", user_id: 1, collection_id: 1 , price:400)
end

Collection.create(title: "CashWad2", user_id: 1, description: "Cash!")
for i in 1..3
  Listing.create(title: "CashWads#{i}", user_id: 1, collection_id: 2, price:700)
end

