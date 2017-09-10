# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u = User.first || User.create({
    provider: "twitter",
    uid: "710187643",
    name: "Nirav Gandhi",
    nickname: "niyando",
    image_url: "http://pbs.twimg.com/profile_images/867607428753489920/HDDRP7rE_normal.jpg"
  })

c1 = u.compilations.create({
    title: "Best tweets of 2017",
    description: "Compilation of most popular tweets from 2017"
  })

[
  {title:"Animals taking over the world" , link: 'https://twitter.com/BoringEnormous/status/857834735170723840'}, 
  {title:"Because it does matter" , link: 'https://twitter.com/Iris_Elisabeth_/status/816278466677145600'}, 
  {title:"Honey, we shrunk Ed Sheeran" , link: 'https://twitter.com/1TD/status/842691184824897536'}, 
  {title:"Tell that to Shah Rukh Khan" , link: 'https://twitter.com/RiggsBarstool/status/873512649438507008'}
  ].each do |h|
    c1.tweets.create({title: h[:title], link: h[:link]})
  end

c2 = u.compilations.create({
  title: "Best (worst) tweets from Donald Trump",
  description: "Let's trawl through his golden tweets."
  })

[
  {title: "How kind of him", link: "https://twitter.com/realDonaldTrump/status/509814075787051008"},
  {title: "On diet coke", link: "https://twitter.com/realDonaldTrump/status/257552283850653696"},
  {title: "On diet coke", link: "https://twitter.com/realDonaldTrump/status/257552283850653696"},
  {title: "Wall-E", link: "https://twitter.com/realDonaldTrump/status/856172056932700164"}
].each do |h|
    c2.tweets.create({title: h[:title], link: h[:link]})
  end

c3 = u.compilations.create({
  title: "How twitter reacted to India vs Srilanka whitewash",
  description: "Twitter Reacts as Virat Kohli’s Century Power India to Historic Whitewash"
  })

[
  {title: "Starting with the God", link: "https://twitter.com/sachin_rt/status/897026354109046786"},
  {link: "https://twitter.com/harbhajan_singh/status/897030600804233218"},
  {link: "https://twitter.com/RusselArnold69/status/897028963591114752"},
  {link: "https://twitter.com/bhogleharsha/status/897018398516760576"},
  {link:"https://twitter.com/hardikpandya7/status/897037646609825792"},
  {link:"https://twitter.com/MohammadKaif/status/897034679345266688"},
  {title:"Last but not the leat - SIR",link:"https://twitter.com/SirJadejaaaa/status/897027277740834816"}
].each do |h|
    c3.tweets.create({title: h[:title], link: h[:link]})
  end