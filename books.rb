require 'rubygems'
require 'mysql'
require 'csv'
$db = Mysql.connect('localhost', 'root', 'password', 'test')
class Book
	def add_book
		puts "Enter the CSV file to open"
		@file = gets.chomp
		if File.exist?(@file)
			puts "File Found"
		else
			puts "File Not Found"
		end
			File.open(@file) do|f|
    		columns = f.readline.chomp.split('\t')
		   until f.eof?
	      row = f.readline.chomp.split('\t')
			row.each do |line| 		 
				@bname ,@bprice,@bstock,@bauthors = line.split("\t")
							begin
								rs = $db.query("SELECT * FROM books")
								count = rs.num_rows + 1
								if count < 10
								@bid = "B000" + count.to_s
								elsif count < 100
								@bid = "B00" + count.to_s
								elsif count < 1000
								@bid = "B0" + count.to_s
								else
								@bid = "B" + count.to_s
								end
								#puts @bid
								if @bname == ""
									puts "Name of the book can not be empty"
									next
								end
								@bprice = @bprice.to_f
								if @bprice == 0.00
									puts "Price of the book can not be blank" 
									next
								end
								@bstock = @bstock.to_i
								if @bstock == ""
									@bstock = 0
								end
								if @bauthors == ""
									puts "Authors of the book can not be empty" 
									next
								end
								find = $db.query	("SELECT * FROM books WHERE name = '#{@bname}'")
								if find.num_rows == 1
									puts "Book is already there in database"
									next
								end	

								$db.query("INSERT INTO books (booksid, name, price, stock, authors) VALUES ('#{@bid}', '#{@bname}', #{@bprice}, #{@bstock}, '#{@bauthors}')")
								puts "Record Add Successfully to the database"
							rescue => e
								puts "Error occured while inserting a record :- #{e}"
							end
				end
	    	end
  			end
	end
end
b = Book.new
b.add_book
