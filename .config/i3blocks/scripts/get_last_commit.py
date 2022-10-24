from datetime import datetime
import requests

url = "https://api.github.com/users/xnacly/events/public"

r = requests.get(url)
r = r.json()
date_raw = r[0]['created_at']
date = datetime.strptime(date_raw, '%Y-%m-%dT%H:%M:%SZ')
print(f"Last Commit: {date.day}.{date.month} {date.hour}:{date.minute}")
