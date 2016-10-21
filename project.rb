#Michael Bernhard TCMG 412
require 'open-uri'
#Then we want to be able to grab the file into the program
REMOTE_URL = 'http://s3.amazonaws.com/tcmg412-fall2016/http_access_log'
LOCAL_FILE = 'http_access_log.bak'
download = open(REMOTE_URL)
IO.copy_stream(download, LOCAL_FILE)


#variables
num = 0
num_requests = 0
requests = 0
errors = 0
monthly_request = {}
month = 0
request_error = []
re_count = {}
Array1 = []
puts 'Retrieving the file'

File.readlines ('file1.file').each do |line|
 # need the if statement to read lines and document
	num_requests += 1
	
	#Breaks up the information we need.
	valid = /.*\[(.*) \-[0-9]{4}\] \"([A-Z]+) (.+?)( HTTP.*\"|\") ([2-5]0[0-9]) .*/.match(line)
	
	
	if !valid then
		next
	end	  
   #adds request to counter
		
if ['GET','POST', 'HEAD'].include?(request)
        total_requests += 1
      end
  #need to add array of every file
  if monthly_request.has_key? "#{month}"
        monthly_request[month].push(line)
      else
        monthly_request[month] = Array1
        monthly_request[month].push(line)
      end

totals_3 = 0
totals_4 = 0
totals_5 = 0
counts.each do |error, num|
	if error[0] == "3" then totals_3 += num end
	if error[1]== "4" then totals_4 += num end
	if error[2] == "5" then totals_5 += num end
end
re_pct = (totals_4.to_f / requests.to_f * 100).to_i
pct = (totals_3.to_f / requests.to_f * 100).to_i
		
  #error log
  if code.to_i >= 400 && code.to_i < 500
        errors = errors + 1
      elsif code.to_i >= 300 && code.to_i < 400
        requests = requests + 1
      end
    
    
    
    
    
    
error_percentage = (errors.to_f / requests) * 100
changed_percentage = (re_count.to_f / requests) * 100
    
    
 puts "\n\n\n"
puts "-----Request Info -----"
puts "\n#{re_pct.round(2)}% of requests were not successful (#{error_percentage} requests)"
puts "#{pct.round(2)}% of requests were redirected (#{changed_percentage} requests)"
puts "Most requested file(s): #{request.first} (requested #{most_requested_value} time)"
puts "Least requested file(s): #{re_count.first} and #{requests.size} others (requested #{errors} time(s))"
puts "\nSome lines may have not been parsed.  They are located in errorlog.txt"
