project_template
================

Template for Academy Projects

How to use HTTParty:

1. add the httparty gem to your project
2. somewhere in your project (where?!), use HTTParty.get
3. the returned object has an attribute 'parsed_response'. That's the parsed json response from the api!

Example:

_response = HTTParty.get('http://api.openweathermap.org/data/2.5/weather?lat=35&lon=139')
_response.parsed_response
