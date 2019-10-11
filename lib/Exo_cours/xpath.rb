require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/HTML")) 

page.xpath('//*[@id="mw-content-text"]/div/table[1]/tbody/tr/th').each do |el|
   puts el.text
end

