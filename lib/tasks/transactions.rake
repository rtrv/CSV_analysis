require 'transactions'
require 'rating'

namespace :transactions do
  desc 'Loads CSV file with transactions data'
  task load_csv: :environment do
    # TODO: get as a param
    path = 'public/transactions.csv'
    Transactions::CSVLoader.load(path)
  end

  desc 'Shows top 10 the most popular products'
  task show_top_products: :environment do
    Rating.top.each_with_index do |product, index|
      puts "#{index+1}: product: #{product[0]}, transactions sum: #{product[1]}"
    end
  end
end
