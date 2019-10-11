require 'rubygems'
require 'nokogiri'  
require 'open-uri'


def get_townhall_email(townhall_url)
	page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com#{townhall_url}")) 
	page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
end


def get_townhall_urls
	url = []
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html")) 
	page.xpath("//a[@class='lientxt']").each do |e| 
		url << e['href'][1..-1]
	end
	return url
end


def get_town_names
	town_name = []
	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
	page.xpath("//a[@class='lientxt']").each do |e| 
		town_name << e.text
	end
	return town_name
end


def get_all_townhall_email
	townhall_url = get_townhall_urls
	all_townhall_email = []
	townhall_url.each do |url|
		all_townhall_email << get_townhall_email(url)
	end
	return all_townhall_email
end


def hash_email
	hash_townhall_email = Hash[get_town_names.zip get_all_townhall_email]
end

puts hash_email

