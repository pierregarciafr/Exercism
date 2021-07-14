module BeerSong
  class << self
  	def plural(number)
  	  number == 1 ? '' : 's'
  	end

  	def some_or_none(number)
  	  number.zero? ? "no more" : number
  	end

  	def create_verse(number)
  		verse = ''
  		case number
	  	  	when 0
	  	  	  verse << "No more bottles of beer on the wall, no more bottles of beer.\n"
	  	  	  verse << "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
	  	  	when 1
	    	  verse << "1 bottle of beer on the wall, 1 bottle of beer.\n"
	    	  verse << "Take it down and pass it around, no more bottles of beer on the wall.\n"
	  	  	when 2
	  	  	  verse << "2 bottles of beer on the wall, 2 bottles of beer.\n"
	  	  	  verse << "Take one down and pass it around, 1 bottle of beer on the wall.\n"
	  	  	else
	  	  	  verse << "#{number} bottles of beer on the wall, "
	  	  	  verse << "#{number} bottles of beer.\n"
	  	  	  verse << "Take one down and pass it around, "
	  	  	  verse << "#{number - 1} bottles of beer on the wall.\n"
	  	  end
	  	  verse
  	end

  	def recite(start_number, times)
  	  result = ""
  	  number = start_number
  	  while number > (start_number - times)
  	  	result << create_verse(number)
  	  	result << "\n" if number > (start_number - times + 1)
  	  	number -= 1
  	  end
      result 
  	end
  end
end

if $PROGRAM_NAME == __FILE__
  puts BeerSong.recite(99, 2)
end

# 0
#     No more bottles of beer on the wall, no more bottles of beer.
#     Go to the store and buy some more, 99 bottles of beer on the wall.

# 1
#     1 bottle of beer on the wall, 1 bottle of beer.
#     Take it down and pass it around, no more bottles of beer on the wall.

# 2
#     2 bottles of beer on the wall, 2 bottles of beer.
#     Take one down and pass it around, 1 bottle of beer on the wall.

