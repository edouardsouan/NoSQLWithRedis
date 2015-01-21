# NoSQLWithRedis

####Requirements

To run this project you will need: 


* Ruby
* Redis ( Server )
* gem redis
* gem nokogiri ( to parse HTML)
* gem json


####What's the point


This little programme add a job into a REDIS instance after being parsed in JSON. 

Then you have a crawler watching for the jobQueue to launch the job. 

The job consist in a job name and a URI. The crawler will then parse the HTML page and return the title. 





