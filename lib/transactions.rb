require 'csv'

module Transactions
  module CSVLoader
    class << self
      REQUIRED_HEADERS = ['product_category', 'value', 'product_name', 'vendor', 'customer_name']
      OPTIONAL_HEADERS = ['phone', 'zip_code', 'city', 'street']

      def load(path)
        csv = CSV.parse(File.read(path), headers: true, col_sep: '; ')

        if correct_headers?(csv.headers)
          csv.each do |row|
            row = row.to_hash

            product_category = ProductCategory.find_or_create_by(name: row['product_category'])
            product = Product.find_or_create_by(name: row['product_name'], product_category: product_category)

            vendor = Vendor.find_or_create_by(name: row['vendor'])
            customer = Customer.find_or_create_by(raw_name: row['customer_name'])

            phone = Phone.find_or_create_by(value: row['phone'], customer: customer)

            city = City.find_or_create_by(name: row['city'])
            postcode = Postcode.find_or_create_by(value: row['zip_code'], city: city)

            transaction = Transaction.new(value: row['value'], customer: customer, product: product, vendor: vendor)

            puts "INFO: transaction #{transaction.id} has been saved" if transaction.save
          end
        else
          puts 'ERROR: CSV structure isn\'t correct!'
        end
      end

      private

      def uniq_headers?(headers)
        headers == headers.uniq
      end

      def required_headers?(headers)
        (REQUIRED_HEADERS - headers).empty?
      end

      # TODO: check optional headers
      def optional_headers(headers)
      end

      # TODO: look for redundant headers
      def redundant_headers(headers)
      end

      def correct_headers?(headers)
        uniq_headers?(headers) && required_headers?(headers)
      end
    end
  end
end
