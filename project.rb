
require 'open-uri'
#Then we want to be able to grab the file into the program
download = open('http://s3.amazonaws.com/tcmg412-fall2016/http_access_log')
IO.copy_stream (download, 'file1.file')
#variables
num_requests = 0
requests = 0
errors = 0
each_file = {}
monthly_request = {}
month = 12
request_error = []
re_count = {}
array_1 = []
array_2 = []

puts 'Retrieving the file'

File.readlines ('file1.file').each do |line|
  if line =~ /^\S+ - - \[([a-zA-Z0-9\/]*)\S* \S* "(\w*) (\S*).*["] ([0-9]*) \S+/
  

  
  
  
  
  #error og
  if code.to_i >= 400 && code.to_i < 500
        errors = errors + 1
      elsif code.to_i >= 300 && code.to_i < 400
        requests = requests + 1
      end
    
    
    
    
    
    
    
    
    
 puts "\n\n\n"
puts "-----Request Info -----"
puts "Total number of requests: #{num_requests}
puts "Number of requests per month: "
monthly_requests.each do |lines|
	puts "    
end
puts "Average requests per month: #{num_requests / month}
puts "Most requested file: 

puts "\n All Errors"
puts "Encountered parsing errors on #{error} lines. "
