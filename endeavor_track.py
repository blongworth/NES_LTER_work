import requests
import json
import numpy as np
from matplotlib import pyplot as plt

url = 'https://marineops.gso.uri.edu/EndeavorNow/GetTrackLine'

r = requests.get(url)

print(r.content[:100])

track = json.loads(r.content)

print(track[:10])

track_np = np.array(track)
lat, lon = track_np.T

plt.scatter(lon, lat)
plt.show()
