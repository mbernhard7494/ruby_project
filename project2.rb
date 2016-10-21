# Michael Bernhard TCMG 412
#Ruby_Project
#worked with jordan 

require 'open-uri'
requests = 0
error_requests = 0
moved_requests = 0
files_re = []
files_count = {}
requests_per_month = {}

e_log = File.open("errorlog.txt","w+")
Dir.mkdir './month_logs' unless File.exists?("./month_logs")


puts "\nRetrieving the file..."

#ACTUAL
open('http://s3.amazonaws.com/tcmg412-fall2016/http_access_log') do |file|

  puts 'Cutting the file...'
  file.each_line do |line|
    if line =~ /^\S+ - - \[([a-zA-Z0-9\/]*)\S* \S* "(\w*) (\S*).*["] ([0-9]*) \S+/
      date = $1
      request = $2
      url = $3
      error_code = $4
      month = date.gsub(/^[\d][\d]\//, "")
      month = month_year.gsub(/[\/]/, "")
#      date_file_name = month_year << ".txt"
      #Adds to array of files
      files_requested << url

    
      if ['GET','POST', 'HEAD'].include?(request)
        requests += 1
      end


     
      if requests_per_month.has_key? "#{month}"
        requests_per_month[month_year].push(line)
      else
        requests_per_month[month_year] = Array.new
        requests_per_month[month_year].push(line)
      end



      
      if error_code.to_i >= 400 && error_code.to_i < 500
        failed_requests += 1
      elsif error_code.to_i >= 300 && error_code.to_i < 400
        redirected_requests += 1
      end

    else
      
      error_log.puts(line)
    end
  end
end

#Creates hash of files requested => #of times
files_requested.each do |item|
  files_requested_count[item] = 0 if files_requested_count[item].nil?
  files_requested_count[item] = files_requested_count[item] + 1
end


most_value = files_requested_count.values.max
most = files_requested_count.select { |k, v| v == most_requested_value}.keys


leastvalue = files_requested_count.values.min
leastrequested = files_requested_count.select { |k, v| v == least_requested_value }.keys

requests_per_month.each do |k, v|
  log_file = k + ".txt"
  File.open("./month_logs/#{log_file}", "w") do |l|
    l.puts(v)
  end
end


e_log.close

failed_percentage = (error_requests.to_f / requests) * 100
moved_percentage = (moved_requests.to_f / total_requests) * 100

#Display
puts "\n#{requests} total requests have been made."
puts "Requests per month:"
requests_per_month.each do |k, v|
  display_date = k.gsub(/(?<=[a-zA-Z])(?=[0-9])/, ' ')
  puts "#{display_date}: #{v.size} requests"
end
puts "\n#{failed_percentage.round(2)}% of requests were not successful (#{error_requests} requests)"
puts "#{moved_percentage.round(2)}% of requests were redirected (#{moved_requests} requests)"
puts "Most requested file(s): #{most.first} (requested #{most_value} time)"
puts "Least requested file(s): #{leastrequested.first} and #{leastrequested.size} others (requested #{least_value} time(s))"
puts "\nSome lines may have not been used  They are located in e_log.txt"
