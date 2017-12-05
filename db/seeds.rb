require 'csv'

user = User.first

csv_text = File.read("lib/titoree_seed.csv")
csv = CSV.parse(csv_text, :headers => true)

start = 0
csv.each do |row|
  i = row[0].to_i
  if (i > 0 && i!=start)
    @compilation = user.compilations.create(title: row[1], description:row[2])
    @compilation.tweets.create(link: row[4], title:row[3])
    start = i
  else
    @compilation.tweets.create(link: row[4], title:row[3])
  end
end