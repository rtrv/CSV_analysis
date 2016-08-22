namespace :transactions do
  desc 'Load CSV file with transactions data'
  task load_csv: :environment do
    require 'csv'

    csv_text = File.read('public/transactions.csv')
    csv = CSV.parse(csv_text, headers: true, col_sep: '; ')
    csv.each do |row|
      row_hash = row.to_hash

      vendor = Vendor.find_or_create_by(name: row_hash['vendor'])

      customer = Customer.find_or_create_by(raw_name: row_hash['customer_name'])

      phone = Phone.find_or_create_by(value: row_hash['phone'], customer: customer)

      city = City.find_or_create_by(name: row_hash['city'])

      postcode = Postcode.find_or_create_by(value: row_hash['zip_code'], city: city)

      product_category = ProductCategory.find_or_create_by(name: row_hash['product_category'])

      product = Product.find_or_create_by(name: row_hash['product_name'], product_category: product_category)

      transaction = Transaction.new(value: row_hash['value'], customer: customer, product: product, vendor: vendor)
      transaction.save
    end
  end

  desc "TODO"
  task show_top_products: :environment do
    h = {}
    Transaction.all.each do |t|
      if h.key?(t.product.name)
        h[t.product.name] += t.value
      else
        h[t.product.name] = t.value
      end
    end
    h = h.sort { |a,b| b[1] <=> a[1] }
    h.first(10).each do |a|
      puts a
    end

  end

end
