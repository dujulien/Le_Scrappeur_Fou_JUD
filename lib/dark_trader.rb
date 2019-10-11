require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/")) 

currency_name=[]
currency_price=[]

page.xpath("//*[@id='currencies-all']/tbody/tr/td/span/a").each do |el|
   currency_name << el.text
end

page.xpath("//*[@id='currencies-all']/tbody/tr/td/a[@class='price']").each do |el|
   currency_price << el.text[1..-1]
end

h = Hash[currency_name.zip currency_price]
puts h

#XPATH vers BIT :'//*[@id="id-bitcoin"]/td[2]/span/a'
#
#//*[@id="id-bitcoin"]/td[5]/a
#
#//*[@id="currencies-all"]/tbody