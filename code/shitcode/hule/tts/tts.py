from gtts import gTTS
#import os
import sys
import subprocess

f = open("code/shitcode/hule/tts/voicequeue.txt")

params = list()

for line in f:
    line = line.rstrip('\n')
    x = line.split("=", 1)
    params.append(x[1])

f.close()

msg = params[0]
client = params[1]
lng = params[2]

#msg = sys.argv[1]
#client = sys.argv[2]
#lng = sys.argv[3]

#msg = msg.encode('cp1251').decode('utf8')

tts = gTTS(msg, lang=lng)
tts.save("code/shitcode/hule/tts/conv/" + str(client) + ".mp3")

#os.system("ffmpeg -i conv/" + str(client) + ".mp3 -vn -ar 44100 -ac 2 -b:a 192k lines/" + str(client) + ".ogg -y")
subprocess.run("ffmpeg -i code/shitcode/hule/tts/conv/" + str(client) + ".mp3 -vn -ar 44100 -ac 2 -b:a 64k code/shitcode/hule/tts/lines/" + str(client) + ".ogg -y", shell=True)

