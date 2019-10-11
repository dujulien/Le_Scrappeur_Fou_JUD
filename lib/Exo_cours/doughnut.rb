require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts")) 

puts page.xpath("/html/head/title")
page.css("//div[@class='g']//a/h3").each do |el|
  puts el.text
end



#rso > div:nth-child(1) > div > div:nth-child(1) > div > div > div.r > a > h3