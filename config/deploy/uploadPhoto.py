import requests
url = 'http://192.168.0.103:3000/api/v1/photos/upload'
files = {'photo': open('foto1.jpg', 'rb')}
requests.post(url, files=files)