require 'date'
require 'open-uri'
#Then we want to be able to grab the file into the program
File.open (http://s3.amazonaws.com/tcmg412-fall2016/http_access_log)


#variables
num = 0
each_file = ()
perday = ()
errors = ()

File.foreach(http_access_log) do |line|
  num = num + 1
  
