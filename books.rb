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
								
								@bauthors = authors(@bauthors)
								if @bauthors == ""
									puts "Authors of the book can not be empty" 
									next
								end
								
								find = $db.query	("SELECT * FROM books WHERE name = '#{@bname}'")
								if find.num_rows == 1
									puts "Book is already there in database"
									next
								end	

								$db.query("INSERT INTO books (bookid, name, price, stock, author_ids) VALUES ('#{@bid}', '#{@bname}', #{@bprice}, #{@bstock}, '#{@bauthors}')")

								puts "Book ID      :- #{@bid} "
								puts "Book Name    :- #{@bname} "
								puts "Book Price   :- #{@bprice}"
								puts "Stock        :- #{@bstock}"
								puts "Book Authors :- #{@bauthors}"	
							puts "Record Add Successfully to the database"
							rescue => e
								puts "Error occured while inserting a record :- #{e}"
							end
				end
	    	end
  			end
		else
			puts "File Not Found"
		end
	end

  def authors(string)
		authors = []
		@id = []
		i= 0
		authors = string.split', '
		authors.each do |s|
		@aid = $db.query("SELECT authorid FROM author WHERE aname = '#{s}' ")

			@aid.each_hash do |h|
				@id[i] =  h.values
				i += 1
			end
		end
		return @id.sort.join(', ')
	end

	def display_books
		begin
			books = $db.query	("SELECT b.bookid, b.name, b.price, b.stock, a.aname 
									FROM books AS b
							        INNER JOIN
								    book_author AS ba ON b.bookid = ba.book_id
							        INNER JOIN
								    author a ON ba.author_id = a.authorid")
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

	def find_book_bybookname
		begin
			puts "Enter Name of the Book to find:"
			sname = gets.chomp
			books = $db.query("SELECT b.bookid, b.name, b.price, b.stock, a.aname
							FROM books AS b
					        INNER JOIN
						    book_author AS ba ON b.bookid = ba.book_id
					        INNER JOIN
						    author a ON ba.author_id = a.authorid
							WHERE b.name LIKE '%#{sname}%'")
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
		2. Display the Books Information
		3. Find the Book By Book Name
		4. Quit }

		case gets.chomp
		when '1'
			b.add_book
		when '2'
			b.display_books
		when '3'
			b.find_book_bybookname
		when '4'
			b.quit
		end
	end
b = Book.new
b.add_book

