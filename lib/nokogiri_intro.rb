require 'rubygems'
require 'nokogiri'  
require 'open-uri'

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html")) 
links = page.css("a") 
new_links = page.css("a[data-category='news']") 

puts links[0].select{|link| link}
puts new_links[1]['href']
puts new_links.css("strong")
puts links[2].class
puts page.css("li, a")[0]['href']
puts page.css("#references a")[0]['href']
link_ref =  page.css("div#references a")
link_ref.each{|link| puts"#{link.text}\t#{link['href']}"}
# page.css("p").each do |link|
# 	puts link.text
# end

puts page.css("h1").text
#each do |link|
#	puts link.text
#end

#mw-content-text > div > table.infobox > tbody > tr:nth-child(2) > th > a