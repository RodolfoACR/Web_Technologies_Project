require 'faker'


users = []
5.times do
  user = User.create!(email: Faker::Internet.email, password: '123456')
  user.create_profile!(
    username: Faker::Internet.username,
    bio: Faker::Company.catch_phrase,
    avatar_url: Faker::Avatar.image
  )
  users << user
end

posts = []
10.times do
  image_url = "https://picsum.photos/seed/#{rand(1000)}/400/300"
  description = Faker::Marketing.buzzwords
  posts << Post.create!(
    profile: users.sample.profile,
    image_url: image_url,
    description: description
  )
end

5.times do
  h = Hashtag.create!(tag: Faker::Marketing.buzzwords.split(' ').first.downcase)
  Post.all.sample(3).each { |p| p.hashtags << h unless p.hashtags.include?(h) }
end

10.times do
  Comment.create!(
    post: posts.sample,
    profile: users.sample.profile,
    body: Faker::TvShows::GameOfThrones.quote
  )
end

10.times do
  Like.create!(profile: users.sample.profile, likeable: posts.sample)
end

profiles = users.map(&:profile)
profiles.combination(2).to_a.sample(5).each do |a, b|
  Follow.create!(follower: a, followed: b)
end

5.times do
  SavedPost.create!(user: users.sample, post: posts.sample)
end
