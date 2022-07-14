require "csv"
require "json"

csv = CSV.read("health-facilities.csv")
json = {}

csv.each_with_index do |line, i|

	next if i == 0

	district = line[0].to_s.strip
	facility = line[4].to_s.strip
	
	next if district == "" || facility == ""
	
	json[district] = [] if json[district].nil?
	json[district] << facility 
	
end

#Sort
json.keys.each {|d|

	json[d] = json[d].sort
}

File.open("health-facilities.json", "w"){|f|
	f.write(json.to_json)
}
