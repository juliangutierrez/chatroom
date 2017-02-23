require 'rubygems'
require 'nokogiri'
require 'open-uri'

module TranslatorApi
	class << self
		def translate dialect, string
			response = Nokogiri::HTML(open("http://www.degraeve.com/cgi-bin/babel.cgi?d=#{dialect}&url=http%3A%2F%2Fwww.multivax.com%2Flast_question.html&w=" + string.gsub(' ', '+')))
			response.css("blockquote p").text.strip
		end
	end
end