class Flyer
  attr_reader :name, :email, :miles_flown
  attr_accessor :status

  def initialize(name, email, miles_flown, status = :bronze)
    @name = name
    @email = email
    @miles_flown = miles_flown
    @status = status
  end

  def to_s
    "#{name} (#{email}): #{miles_flown} - #{status}"
  end
end

flyers = []
flyers << Flyer.new('Larry', 'larry@example.com', 4000, :platinum)
flyers << Flyer.new('Moe', 'moe@example.com', 1000)
flyers << Flyer.new('Curly', 'curly@example.com', 3000, :gold)
flyers << Flyer.new('Shemp', 'shemp@example.com', 2000)

name_tags = flyers.map { |flyer| "#{flyer.name} (#{flyer.status.upcase})" }
puts name_tags

distance_flown = flyers.map { |flyer| flyer.miles_flown * 1.6 }
puts distance_flown

total_miles_flown = flyers.reduce(0) { |sum, flyer| sum + flyer.miles_flown }
puts "Total miles flown: #{total_miles_flown}"

platinum_flyers, coach_flyers = flyers.partition { |flyer| flyer.status == :platinum }
puts "Platinum Passengers:"
puts platinum_flyers
puts "Coach Passengers:"
puts coach_flyers

total_kms_flown = flyers.reduce(0) { |sum, flyer| sum + (flyer.miles_flown * 1.6) }
puts "Total kilometers flown: #{total_kms_flown}"
