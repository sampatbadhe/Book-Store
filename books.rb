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
<<<<<<< HEAD
								puts "Book ID      :- #{@bid} "
								puts "Book Name    :- #{@bname} "
								puts "Book Price   :- #{@bprice}"
								puts "Stock        :- #{@bstock}"
								puts "Book Authors :- #{@bauthors}"	
=======
>>>>>>> 8850953d7686e2378c4b140fbecb2d9f41a116ee
								puts "Record Add Successfully to the database"
							rescue => e
								puts "Error occured while inserting a record :- #{e}"
							end
				end
	    	end
  			end
	end
<<<<<<< HEAD

	def display_books
		begin
			books = $db.query	("SELECT * FROM books")
			if books.num_rows == 0
			puts "No result found"
			return
			end
			puts "Displaying all the Records"
			books.each_hash do |h|
			puts h.inspect
			end
		rescue => e
			puts "Error :- #{e}"
		end
	end

	def find_book
		begin
			puts "Enter Book Name or Author of Book to find:"
			sname = gets.chomp
			books = $db.query	("SELECT * FROM books WHERE name like '%#{sname}%' OR authors like '%#{sname}%'")
			if books.num_rows == 0
				puts "No result found"
				return
			end
			books.each_hash do |h|
				puts h.inspect
			end
		rescue => e
			puts "Error :- #{e}"
		end
	end

	def quit
		begin
			$db.close
			puts "Bye!"
			exit
		rescue => e
			puts "Error :- #{e}"
		end
	end
end
b = Book.new

loop do
		puts %q{Please select an option:
		1. Add the Records in Books table
		2. Display the Record from Books table
		3. Find the Book
		4. Quit }

		case gets.chomp
		when '1'
			b.add_book
		when '2'
			b.display_books
		when '3'
			b.find_book
		when '4'
			b.quit
		end
	end
=======
end
b = Book.new
b.add_book
>>>>>>> 8850953d7686e2378c4b140fbecb2d9f41a116ee
