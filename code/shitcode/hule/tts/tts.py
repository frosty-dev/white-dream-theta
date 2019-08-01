from gtts import gTTS
import sys
import subprocess
from urllib.parse import unquote_plus

file = open("code/shitcode/hule/tts/voicequeue.txt")

params = list()

for line in file:
    line = line.rstrip('\n')
    x = line.split("=", 1)
    params.append(x[1])

file.close()

msg = params[0]
client = params[1]
lng = params[2]
path = params[3]

msg = unquote_plus(msg, 'cp1251')

path = unquote_plus(path, 'cp1251')

tts = gTTS(msg, lang=lng)
tts.save(str(path)+"/conv/"+str(client)+".mp3")

subprocess.run("ffmpeg -i "+str(path)+"/conv/"+str(client)+".mp3 -vn -ar 44100 -ac 2 -b:a 64k "+str(path)+"/lines/"+str(client)+".ogg -y", shell=True)

