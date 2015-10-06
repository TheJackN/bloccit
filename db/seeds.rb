include RandomData

50.times do
  Post.create!(
  title: RandomData.random_sentence,
  body:  RandomData.random_paragraph
  )
end

posts = Post.all

100.times do
  Comment.create!(
  post: posts.sample,
  body: RandomData.random_paragraph
  )
end

post = Post.find_or_create_by(title: "Hazaa Post", body: "Posting is Hazaa")
Comment.find_or_create_by(post: post, body: "Best comment body ever")

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
