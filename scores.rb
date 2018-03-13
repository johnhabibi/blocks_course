scores = [83, 71, 92, 64, 98, 87, 75, 69]
scores_doubled = scores.map { |scores| scores * 2 }

total = scores.reduce(0, :+)
puts "Total score: #{total}"

evens, odds = scores.partition { |score| score.even? }
puts "Evens:"
p evens
puts "Odds:"
p odds
