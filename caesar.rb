require 'sinatra'
require 'sinatra/reloader' if development?

def caesar_cipher(str, int)
	s = str.split('').map do |c|
		if /[A-Za-z]/.match(c)

			#After matching if c is a letter, we minus A or a
			#depending on if capitizaled, add the shift
			#insure it will be a letter when we A or a
			#by adding the remainder of 26 to either letter
			if /[A-Z]/.match(c)
				c = ((c.ord - 65 + int) %26+ 65).chr
			else /[a-z]/.match(c)
				c = ((c.ord - 97 + int) %26 + 97).chr 	
			end
		else
			c
		end
	end
	s.join('')
end

answer = " "

get '/' do
	string = params['string'].to_s
	num = params['num'].to_i
	answer = caesar_cipher(string, num)
	erb :index, :locals => { :answer => answer }
end