require 'transactions'

namespace :transactions do
  desc 'Loads CSV file with transactions data'
  task load_csv: :environment do
    # TODO: get as a param
    path = 'public/transactions.csv'
    Transactions::CSVLoader.load(path)
  end
end
