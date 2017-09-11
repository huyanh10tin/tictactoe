class TicTac
	attr_accessor :arr
	attr_accessor :current_player
	attr_accessor :played
	# print instruction
	def display_instruction
		puts "current status"
		printarr
		puts "Choose number to check"
		1.upto(9) do |x|
			print "#{x}	|"
			if (x%3 == 0)
				puts ""
			end	
		end
	end

	def initialize
		@played = 0
		@arr = Array.new(9, "")
		@current_player = 1
	end
	private
	# print current status of game
	def printarr
		@arr.each_with_index do |element, index|
			print element.empty? ? ".	" : "#{element}	"
			puts "" if (index == 2)||(index == 5)
		end
		puts ""
	end
	# get name
	def play
		until checkwin || @played == 9
			puts "user #{@current_player} enter the number"
			number = gets.chomp.to_i
			# print "is #{@arr[number]}"
			until @arr[number-1] == ""
				puts "already taken #{@current_player} please re input "
				number = gets.chomp.to_i
			end 
			if @current_player == 1
				@arr[number-1] = 'X'
				
			else
				@arr[number-1] = 'O'

			end
			printarr
			if checkwin
				puts "player #{@current_player} win"
				break
			end
			@current_player = (@current_player == 2) ? 1 : 2
			@played += 1
			if @played == 9
				puts "Hoa"
				break
			end
		end
	end
	# check win

	def checkwin
		check = [[0, 1, 2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
		check.each do |element|
			if ((@arr[element[0]] != "")&&(@arr[element[0]] == @arr[element[1]])&&(@arr[element[1]] == @arr[element[2]]))
				return true
			end
		end
		false
	end
end