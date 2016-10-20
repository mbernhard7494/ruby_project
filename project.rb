require 'date'
require 'open-uri'
#Then we want to be able to grab the file into the program

File.open ('../logs/http_access_log', 'i') do |file|
  file.each_line do |line|
    


#variables
num = 0
each_file = ()
perday = ()
errors = ()

File.foreach(http_access_log) do |line|
  num = num + 1
  if num >  
  
