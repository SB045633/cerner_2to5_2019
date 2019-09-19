# Displays the time remaining until CHC 2019, or a message if it has already started
# Requires Python 3+

import datetime
import time

timeVar = datetime.datetime
timeNow = timeVar.now()
chcTime = timeVar(year=2019,month=10,day=7,hour=7,minute=0,second=0)

while timeNow < chcTime:
    timeNow = timeVar.now()
    print('Time until CHC:', chcTime - timeVar(year=timeNow.year,month=timeNow.month,day=timeNow.day,hour=timeNow.hour,minute=timeNow.minute,second=timeNow.second), end='\r')
    time.sleep(1)

if timeNow > chcTime:
    print('CHC has begun!')
