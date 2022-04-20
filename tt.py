#!/usr/bin/env python
import cv2         # Library for openCV
import threading   # Library for threading -- which allows code to run in backend
import playsound   # Library for alarm sound
import smtplib     # Library for email sending
import os
from twilio.rest import Client
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
import time

import pandas as pd

fire_cascade = cv2.CascadeClassifier('fire_detection_cascade_model.xml') # To access xml file which includes positive and negative images of fire. (Trained images)
                                                                         # File is also provided with the code.
vid = cv2.VideoCapture(0) # To start camera this command is used "0" for laptop inbuilt camera and "1" for USB attahed camera for pc
#vid1 = cv2.VideoCapture(1)
runOnce = False # created boolean
runOnce1= False

def play_alarm_sound_function(): # defined function to play alarm post fire detection using threading
    playsound.playsound("sound.mp3",True) # to play alarm # mp3 audio file is also provided with the code.
    print("Fire alarm end") # to print in console

def send_mail_function(): # defined function to send mail post fire detection using threading
    e=pd.read_csv("mail.csv")
    emails=e['email'].values

    server=smtplib.SMTP("smtp.gmail.com",587)
    server.starttls()
    server.login("firedetect1234@gmail.com",'fire1234@')
    msg="FIRE DETECTED"
    Subject="FIRE ALERT"
    body="Subject: {}\n\n{}".format(Subject,msg)

    for email in emails:
        server.sendmail("firedetect1234@gmail.com", email, body)
    server.quit()
        

while(True):
    Alarm_Status = False
    ret0, frame = vid.read() # Value in ret is True # To read video frame
    #ret1, frame1= vid1.read()
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY) # To convert frame into gray color
    #gray1 = cv2.cvtColor(frame1, cv2.COLOR_BGR2GRAY) # To convert frame into gray color
    fire = fire_cascade.detectMultiScale(frame, 1.2, 5) # to provide frame resolution
    #fire1 = fire_cascade.detectMultiScale(frame1, 1.2, 5) # to provide frame resolution
    ## to highlight fire with square
    
    if (ret0):
        for (x,y,w,h) in fire:
            cv2.rectangle(frame,(x-20,y-20),(x+w+20,y+h+20),(255,0,0),2)
            roi_gray = gray[y:y+h, x:x+w]
            roi_color = frame[y:y+h, x:x+w]

            if runOnce == False:
                print("Mail send initiated")
                threading.Thread(target=play_alarm_sound_function).start()
                threading.Thread(target=send_mail_function).start() # To call alarm thread
                account_sid = "ACf2b8b66c593d8ed8ecc4426ab35dd852"
                auth_token  = "7788d039122f3b02e45b806a41716680"
                client = Client(account_sid, auth_token)
                NUMBERS = {
                    'akash' : '+16475513018',
                    'yash' : '+16475142670',
                    'nishith' : '+16475072742',
                    'vrushabh' : '+16474510724'
                    }
                for name,number in NUMBERS.items():
                    message = client.messages \
                    .create(
                         body="FIRE DETECTED",
                         from_='+12676925909',
                         to=number
                     )
                print(message.sid)
                time.sleep(1)
                import pathfinding_roomba.py
                runOnce = True
            if runOnce == True:
                print("Mail is already sent once")
                runOnce = True

        cv2.imshow('frame', frame)

    if cv2.waitKey(1)&0xFF==ord('q'):
        break

'''
    if (ret1):
        for (x,y,w,h) in fire1:
            cv2.rectangle(frame1,(x-20,y-20),(x+w+20,y+h+20),(255,0,0),2)
            roi_gray = gray1[y:y+h, x:x+w]
            roi_color = frame1[y:y+h, x:x+w]

            if runOnce1 == False:
                print("Mail send initiated")
                threading.Thread(target=play_alarm_sound_function).start() # To call alarm thread
                threading.Thread(target=send_mail_function).start() # To send mail thread
                runOnce1 = True
            if runOnce1 == True:
                print("Mail is already sent once")
                runOnce1 = True'''

        #cv2.imshow('frame1', frame1)

vid.release()
#vid1.release()
cv2.destroyAllWindows()
        
