require 'rubygems'
require 'nokogiri'  
require 'open-uri'


def get_deputy_email(deputy_url)
	page = Nokogiri::HTML(open(deputy_url)) 
	page.xpath("//*[@id='haut-contenu-page']/article/div[3]/div/dl/dd[4]/ul/li[2]/a").text
end

#puts get_deputy_email("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")

def get_deputy_urls
	url = []
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")) 
	page.xpath("//*[@id='deputes-list']/div/ul/li/a").each do |e| 
		url << e['href']
	end
	return url
end

def get_all_deputy_email
	deputy_url = get_deputy_urls
	all_deputy_email = []
	deputy_url.each do |url|
		all_deputy_email << get_deputy_email("http://www2.assemblee-nationale.fr/#{url}")
	end
	return all_deputy_email
end


def get_deputy_names
	deputy_names = []
	page = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique"))
	page.xpath("//*[@id='deputes-list']/div/ul/li/a").each do |e| 
		deputy_names << e.text
	end
	return deputy_names
end

def create_hash
	deputy_email_array = []
	deputy_names = get_deputy_names
	all_deputy_email = get_all_deputy_email
	for i in 0..(deputy_names.size-1) do
		deputy_email_array << Hash['first_name' => get_deputy_names[i].split[1],'last_name' => get_deputy_names[i].split[2], 'email' => all_deputy_email[i]]
	end
	return deputy_email_array
end 

puts create_hash




