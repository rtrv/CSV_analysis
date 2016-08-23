require 'rating'

namespace :rating do
  # TODO: get quantity as a param
  desc 'Shows the most popular products'
  task top: :environment do
    Rating.top.each_with_index do |product, index|
      puts "#{index+1}: product: #{product[0]}, transactions sum: #{product[1]}"
    end
  end
end
