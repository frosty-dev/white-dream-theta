from gtts import gTTS
#import os
import sys
import subprocess

client = sys.argv[1]
msg = sys.argv[2]
tts = gTTS(msg, lang="ru")
tts.save("code/shitcode/hule/tts/conv/" + str(client) + ".mp3")

##os.system("ffmpeg -i conv/" + str(client) + ".mp3 -vn -ar 44100 -ac 2 -b:a 192k lines/" + str(client) + ".ogg -y")
subprocess.run("ffmpeg -i code/shitcode/hule/tts/conv/" + str(client) + ".mp3 -vn -ar 44100 -ac 2 -b:a 192k code/shitcode/hule/tts/lines/" + str(client) + ".ogg -y")
