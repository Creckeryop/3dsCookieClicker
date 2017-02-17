Graphics.init()
oldpad = Controls.read()
red=Color.new(255,80,80)
yellow=Color.new(255,255,80)
redformenu=Color.new(255,0,0)
green=Color.new(80,255,80)
white=Color.new(255,255,255)
blue=Color.new(80,80,255)
Th,Tm,Ts = System.getTime()
math.randomseed(Th*3600+Tm*60+Ts)

if System.currentDirectory() == "/" then
 System.currentDirectory("romfs:/")
end

titlecreckeryop= Graphics.loadImage(System.currentDirectory().."data/titlecreckeryop.png")
menutitle= Graphics.loadImage(System.currentDirectory().."data/menutitle.png")
menugradient= Graphics.loadImage(System.currentDirectory().."data/menugradient.png")
gradient2= Graphics.loadImage(System.currentDirectory().."data/gradient2.png")
BackgroundTop = Graphics.loadImage(System.currentDirectory().."data/backgroundtop.png")
BackgroundBottom = Graphics.loadImage(System.currentDirectory().."data/backgroundbottom.png")
BackgroundTop1 = Graphics.loadImage(System.currentDirectory().."data/backgroundtop1.png")
allsoldbanner = Graphics.loadImage(System.currentDirectory().."data/allsoldbanner.png")
backON = Graphics.loadImage(System.currentDirectory().."data/backON.png")
backOFF= Graphics.loadImage(System.currentDirectory().."data/backOFF.png")
exitON = Graphics.loadImage(System.currentDirectory().."data/exitON.png")
exitOFF= Graphics.loadImage(System.currentDirectory().."data/exitOFF.png")
playON = Graphics.loadImage(System.currentDirectory().."data/playON.png")
playOFF= Graphics.loadImage(System.currentDirectory().."data/playOFF.png")
CMON = Graphics.loadImage(System.currentDirectory().."data/CMON.png")
CMOFF = Graphics.loadImage(System.currentDirectory().."data/CMOFF.png")
optionsON = Graphics.loadImage(System.currentDirectory().."data/optionsON.png")
optionsOFF = Graphics.loadImage(System.currentDirectory().."data/optionsOFF.png")
resetON = Graphics.loadImage(System.currentDirectory().."data/resetON.png")
resetOFF = Graphics.loadImage(System.currentDirectory().."data/resetOFF.png")
resetNET = Graphics.loadImage(System.currentDirectory().."data/resetNET.png")
AUTHORTEXT = Graphics.loadImage(System.currentDirectory().."data/AUTHOR.png")
frameus = Graphics.loadImage(System.currentDirectory().."data/frameus.png")
backx=0
backy=0
rota=255
rotanum = 0
version="0.7"
Sound.init()
function loadmusic()
bgm = Sound.openOgg(System.currentDirectory().."data/bgm.ogg", false)
Sound.play(bgm,LOOP)
end
R12=0
BatteryColor = green
batterylevel = System.getBatteryLife()

function loadall()
	Cookie = Graphics.loadImage(System.currentDirectory().."data/cookie.png")
	Shine = Graphics.loadImage(System.currentDirectory().."data/shine.png")
	Gradient = Graphics.loadImage(System.currentDirectory().."data/Gradient.png")	
	StoreHead = Graphics.loadImage(System.currentDirectory().."data/storehead.png")
	ButtonsSheet = Graphics.loadImage(System.currentDirectory().."data/ButtonsSheet.png")
	pressed = Graphics.loadImage(System.currentDirectory().."data/pressed.png")
	favicon = Graphics.loadImage(System.currentDirectory().."data/favicon.png")
	cursor = Graphics.loadImage(System.currentDirectory().."data/cursor.png")
	ObjectsSheet = Graphics.loadImage(System.currentDirectory().."data/ObjectsSheet.png")
	BackgroundSprites= Graphics.loadImage(System.currentDirectory().."data/BackgroundSprites.png")
end
state="LOADING"
Buttons={texture = {backON,playON,CMON,exitON,optionsON,resetON},texture2 = {backOFF,playOFF,CMOFF,exitOFF,optionsOFF,resetOFF},sizex={},sizey={},dntch={}}
SHINE={}
SHINE.rot=0
SHINE.speed=0.008
MENU={stat=1,max=3,"New Game","Options","Exit"}
justcurrency = 0
COOKIE = {size=1,count=0,total=0}
TOUCHes = {}
STORE={x = 250,y = 86,stat = 0,max = 7}
Shade=Color.new(250,250,250,100)
CpS=0
CpSCursor=0
BACK={x=0,y=64}
holdtoexit = 0
startloading=0 
TOUCHALTER=0
activatescreenshot=0
status="BUY menu"
function screenshotmake()
if activatescreenshot>0 then
	activatescreenshot=activatescreenshot-5
	Graphics.fillRect(0,400,0,320,Color.new(255,255,255,activatescreenshot))
end
end
function freefunction()
	Graphics.freeImage(Cookie)
	Graphics.freeImage(Shine)
	Graphics.freeImage(Gradient)
	Graphics.freeImage(StoreHead)
	Graphics.freeImage(ButtonsSheet)
	Graphics.freeImage(pressed)
	Graphics.freeImage(favicon)
	Graphics.freeImage(cursor)
	Graphics.freeImage(ObjectsSheet)
	Graphics.freeImage(BackgroundSprites)
end
function explode(div,str)
	pos = 0
	arr = {}
	for st,sp in function() return string.find(str,div,pos,true) end do
		table.insert(arr,string.sub(str,pos,st-1))
		pos = sp + 1
	end
	table.insert(arr,string.sub(str,pos))
	return arr
end
function TOUCHCHECK()
	if TOUCHx > (160-64*COOKIE.size) and TOUCHx < (160+64*COOKIE.size) and TOUCHy > (120-64*COOKIE.size) and TOUCHy < (120+64*COOKIE.size) and TOUCHALTER~=1 then
		if COOKIE.size < 1.2 then COOKIE.size = COOKIE.size + 0.1 end
		TOUCHYstatus = "PRESSED"
		TOUCHes.xlast = TOUCHx
		TOUCHes.ylast = TOUCHy
	else
		if TOUCHx == 0 and TOUCHy == 0 and TOUCHYstatus == "PRESSED" and TOUCHALTER~=1 then
		COOKIE.count=COOKIE.count+1
		COOKIE.total=COOKIE.total+1
		end
		TOUCHYstatus = "NOT PRESSED"
		if COOKIE.size > 1 and TOUCHALTER~=1              then COOKIE.size = COOKIE.size-0.1 end
	end
end
function alternativeclick()
if Controls.check(pad,KEY_X) and not Controls.check(oldpad,KEY_X) then
		COOKIE.count=COOKIE.count+1
		COOKIE.total=COOKIE.total+1
end
if Controls.check(pad,KEY_X) then
	TOUCHALTER = 1
	if COOKIE.size < 1.2 then COOKIE.size = COOKIE.size + 0.1 end
else
	TOUCHALTER = 0
	if COOKIE.size > 1 and TOUCHALTER == 1  then COOKIE.size = COOKIE.size-0.1  end
end
end
function Cursor()
	for i=1, CURSOR.count do
	if i<=10 then 
		Graphics.drawImageExtended(160, 120, 0, 0, 17, 180 ,-(CURSOR.rot+pi/5*i), 1.2,1.2, cursor)
	end
	end
end
function Grandmother()
	if GRANDMA.count<=6 and GRANDMA.count>0 then
		for i=1, GRANDMA.count do
			if i<=6 then 
				Graphics.drawPartialImage(2+40*(i-1),12+BACK.y+71*GRANDMA.currency, 0, 0, 50, 50, ObjectsSheet)
			end
		end
	elseif GRANDMA.count>6 then
		for i=1,6 do
				Graphics.drawPartialImage(2+40*(i-1),12+BACK.y+71*GRANDMA.currency, 0, 0, 50, 50, ObjectsSheet)
		end
	elseif GRANDMA.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*GRANDMA.currency,allsoldbanner)
	end
end
function Farms()
	if FARM.count<=4 and FARM.count>0then
		for i=1, FARM.count do
			if i<=4 then 
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*FARM.currency, 50, 0, 50, 50, ObjectsSheet)
			end
		end
	elseif FARM.count>4 then
		for i=1,4 do
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*FARM.currency, 50, 0, 50, 50, ObjectsSheet)
		end
	elseif FARM.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*FARM.currency,allsoldbanner)
	end
end
function Mines()
	if MINE.count<=4 and MINE.count>0 then
		for i=1, MINE.count do
			if i<=4 then 
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*MINE.currency, 100, 0, 50, 50, ObjectsSheet)
			end
		end
	elseif MINE.count>4 then
		for i=1,4 do
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*MINE.currency, 100, 0, 50, 50, ObjectsSheet)
		end
	elseif MINE.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*MINE.currency,allsoldbanner)
	end
end
function Factories()
	if FACTORY.count<=4 and FACTORY.count>0 then
		for i=1, FACTORY.count do
			if i<=4 then 
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*FACTORY.currency, 150, 0, 50, 50, ObjectsSheet)
			end
		end
	elseif FACTORY.count>4 then
		for i=1,4 do
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*FACTORY.currency, 150, 0, 50, 50, ObjectsSheet)
		end
	elseif FACTORY.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*FACTORY.currency,allsoldbanner)
	end
end
function Banks()
	if BANK.count<=4 and BANK.count>0 then
		for i=1, BANK.count do
			if i<=4 then 
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*BANK.currency, 200, 0, 50, 50, ObjectsSheet)
			end
		end
	elseif BANK.count>4 then
		for i=1,4 do
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*BANK.currency, 200, 0, 50, 50, ObjectsSheet)
		end
	elseif BANK.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*BANK.currency,allsoldbanner)
	end
end
function Temples()
	if TEMPLE.count<=4 and TEMPLE.count>0 then
		for i=1, TEMPLE.count do
			if i<=4 then 
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*TEMPLE.currency, 250, 0, 50, 50, ObjectsSheet)
			end
		end
	elseif TEMPLE.count>4 then
		for i=1,4 do
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*TEMPLE.currency, 250, 0, 50, 50, ObjectsSheet)
		end
	elseif TEMPLE.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*TEMPLE.currency,allsoldbanner)
	end
end
function Towers()
	if WIZARDTWR.count<=4 and WIZARDTWR.count>0 then
		for i=1, WIZARDTWR.count do
			if i<=4 then 
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*WIZARDTWR.currency, 300, 0, 50, 50, ObjectsSheet)
			end
		end
	elseif WIZARDTWR.count>4 then
		for i=1,4 do
				Graphics.drawPartialImage(10+55*(i-1),12+BACK.y+71*WIZARDTWR.currency, 300, 0, 50, 50, ObjectsSheet)
		end
	elseif WIZARDTWR.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*WIZARDTWR.currency,allsoldbanner)
	end
end
function save()
	savefile = io.open("/ccsave.sav",FCREATE)
	savestring = COOKIE.count.."#"..GRANDMA.count.."#"..COOKIE.total.."#"..CURSOR.count.."#"..FARM.count.."#"..MINE.count.."#"..GRANDMA.currency.."#"..FARM.currency.."#"..MINE.currency.."#"..justcurrency.."#"..FACTORY.count.."#"..FACTORY.currency.."#"..BANK.count.."#"..BANK.currency.."#"..TEMPLE.count.."#"..TEMPLE.currency.."#"..WIZARDTWR.count.."#"..WIZARDTWR.currency.."#"
	savestringlen = string.len(savestring)
	io.write(savefile,0,savestring,savestringlen)
	io.close(savefile)
end
function continue()
	if System.doesFileExist("/ccsave.sav") then
		savefile = io.open("/ccsave.sav", FREAD)
		size = io.size(savefile)
		file = io.read(savefile,0,size)
		io.close(savefile)
		savearray = explode("#",file,size)
		COOKIE.count = tonumber(savearray[1])
		GRANDMA.count = tonumber(savearray[2])
		COOKIE.total = tonumber(savearray[3])
		CURSOR.count = tonumber(savearray[4])
		FARM.count = tonumber(savearray[5])
		MINE.count = tonumber(savearray[6])
		GRANDMA.currency = tonumber(savearray[7])
		FARM.currency = tonumber(savearray[8])
		MINE.currency = tonumber(savearray[9])
		justcurrency = tonumber(savearray[10])
		FACTORY.count = tonumber(savearray[11]) or 0 
		FACTORY.currency = tonumber(savearray[12]) or -1
		BANK.count = tonumber(savearray[13]) or 0
		BANK.currency = tonumber(savearray[14]) or -1
		TEMPLE.count = tonumber(savearray[15]) or 0
		TEMPLE.currency = tonumber(savearray[16]) or -1
		TEMPLE.count = tonumber(savearray[15]) or 0
		TEMPLE.currency = tonumber(savearray[16]) or -1
		WIZARDTWR.count = tonumber(savearray[17]) or 0
		WIZARDTWR.currency = tonumber(savearray[18]) or -1
	end
end
function ScreenButton(xbut,ybut,i,st)
		Buttons.sizex[i] = Graphics.getImageWidth(Buttons.texture[i])
		Buttons.sizey[i] = Graphics.getImageHeight(Buttons.texture[i])
	if TOUCHx == 0 and TOUCHy==0 then 
		if Buttons.dntch[st] == "YES" then
			if st=="LOADALL" and CursorBuyIcon == nil then
				loadall()
			elseif st=="LOADALL" and CursorBuyIcon ~= nil then
				Cookie = Graphics.loadImage(System.currentDirectory().."data/cookie.png")
			elseif st=="SHOWAUTHOR" then
				AUTHOR = 1
			elseif st=="EXIT" then
				Sound.close(bgm)
				Sound.term()
				System.exit()
				freefunction()
				bgm = nil
				
			elseif st=="RESET" then
				System.deleteFile("/ccsave.sav")
			else
				state=st
			end
			Buttons.dntch[st] = "NO"
			if st=="MENU1" then
				save()
				Cookie=nil
				holdtoexit=0
				state="MENU"
		end
		end
		Graphics.drawImage(xbut,ybut,Buttons.texture[i])
	else
		if TOUCHx > xbut and TOUCHx < xbut+Buttons.sizex[i] and TOUCHy > ybut and TOUCHy < ybut+Buttons.sizey[i] then
			Buttons.dntch[st] = "YES"
			Graphics.drawImage(xbut,ybut,Buttons.texture2[i])
		else
			Buttons.dntch[st] = "NO"
			Graphics.drawImage(xbut,ybut,Buttons.texture[i])
		end
	end
end
pi=math.pi
timer = Timer.new()
Timer.resume(timer)
GetBattery = Timer.new()
Timer.resume(GetBattery)
function System.wait(milliseconds)
   tmp = Timer.new()
   while Timer.getTime(tmp) < milliseconds do end
   Timer.destroy(tmp)
end
loadmussic=1
while true do
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.clear(BOTTOM_SCREEN)
	
	if loadmussic==1 then
	Screen.debugPrint(0,220,"NOW LOADING...",white,TOP_SCREEN)
	System.wait(1000)
	loadmussic = 0
	loadmusic()
	end
	TOUCHx,TOUCHy = Controls.readTouch()
	STICKx,STICKy = Controls.readCirclePad()
	pad = Controls.read()
	if state=="GAME" then
	SHINE.rot=SHINE.rot+SHINE.speed
	if SHINE.rot >= 2*pi then SHINE.rot = SHINE.rot-2*pi end
		CURSOR.rot=CURSOR.rot+CURSOR.speed
	if CURSOR.rot >= 2*pi then CURSOR.rot = CURSOR.rot-2*pi end
	alternativeclick()
	TOUCHCHECK()
	Graphics.initBlend(TOP_SCREEN)
	Graphics.drawImage(0, 0, BackgroundTop)
	if COOKIE.count >= CURSOR.price then
		Graphics.drawPartialImage(STORE.x, STORE.y, 150, 0, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 15 and COOKIE.count<CURSOR.price then
		Graphics.drawPartialImage(STORE.x, STORE.y, 150, 0, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 15 then
		Graphics.drawPartialImage(STORE.x, STORE.y, 0, 0, 150, 33, ButtonsSheet,Shade)
	end
	if COOKIE.count >= GRANDMA.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+33, 150, 33, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 100 and COOKIE.count<GRANDMA.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+33, 150, 33, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 100 then
		Graphics.drawPartialImage(STORE.x, STORE.y+33, 0, 33, 150, 33, ButtonsSheet,Shade)
	end
	if COOKIE.count >= FARM.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+66, 150, 66, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 1000 and COOKIE.count<FARM.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+66, 150, 66, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 1000 then
		Graphics.drawPartialImage(STORE.x, STORE.y+66, 0, 66, 150, 33, ButtonsSheet,Shade)
	end
	if COOKIE.count >= MINE.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+99, 150, 99, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 12000 and COOKIE.count<MINE.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+99, 150, 99, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 12000 then
		Graphics.drawPartialImage(STORE.x, STORE.y+99, 0, 99, 150, 33, ButtonsSheet,Shade)
	end
	if COOKIE.count >= FACTORY.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+132, 150, 132, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 130000 and COOKIE.count<FACTORY.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+132, 150, 132, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 130000 then
		Graphics.drawPartialImage(STORE.x, STORE.y+132, 0, 132, 150, 33, ButtonsSheet,Shade)
	end
	if COOKIE.count >= BANK.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+165, 150, 165, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 1400000 and COOKIE.count<BANK.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+165, 150, 165, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 1400000 then
		Graphics.drawPartialImage(STORE.x, STORE.y+165, 0, 165, 150, 33, ButtonsSheet,Shade)
	end
	if COOKIE.count >= TEMPLE.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+198, 150, 198, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 20000000 and COOKIE.count<TEMPLE.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+198, 150, 198, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 20000000 then
		Graphics.drawPartialImage(STORE.x, STORE.y+198, 0, 198, 150, 33, ButtonsSheet,Shade)
	end
	if COOKIE.count >= WIZARDTWR.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+231, 150, 231, 150, 33, ButtonsSheet)
	elseif COOKIE.total >= 330000000 and COOKIE.count<WIZARDTWR.price then
		Graphics.drawPartialImage(STORE.x, STORE.y+231, 150, 231, 150, 33, ButtonsSheet,Shade)
	elseif COOKIE.total < 330000000 then
		Graphics.drawPartialImage(STORE.x, STORE.y+231, 0, 231, 150, 33, ButtonsSheet,Shade)
	end
	if BACK.y>=-10-71*GRANDMA.currency and BACK.y<200+71*GRANDMA.currency and GRANDMA.currency ~= -1 then
	Graphics.drawPartialImage(BACK.x, BACK.y+71*GRANDMA.currency,0,0,242,71,BackgroundSprites)
	Grandmother()
	end
	if BACK.y>=-10-71*FARM.currency and BACK.y<200+71*FARM.currency and FARM.currency ~= -1 then
	Graphics.drawPartialImage(BACK.x, BACK.y+71*FARM.currency,0,71,242,71,BackgroundSprites)
	Farms()
	end
	if BACK.y>=-10-71*MINE.currency and BACK.y<200+71*MINE.currency and MINE.currency ~= -1 then
	Graphics.drawPartialImage(BACK.x, BACK.y+71*MINE.currency,0,142,242,71,BackgroundSprites)
	Mines()
	end
	if BACK.y>=-10-71*FACTORY.currency and BACK.y<200+71*FACTORY.currency and  FACTORY.currency ~= -1 then
	Graphics.drawPartialImage(BACK.x, BACK.y+71*FACTORY.currency,0,213,242,71,BackgroundSprites)
	Factories()
	end
	if BACK.y>=-10-71*BANK.currency and BACK.y<200+71*BANK.currency and BANK.currency ~= -1 then
	Graphics.drawPartialImage(BACK.x, BACK.y+71*BANK.currency,0,284,242,71,BackgroundSprites)
	Banks()
	end
	if BACK.y>=-10-71*TEMPLE.currency and BACK.y<200+71*TEMPLE.currency and TEMPLE.currency ~= -1 then
	Graphics.drawPartialImage(BACK.x, BACK.y+71*TEMPLE.currency,0,355,242,71,BackgroundSprites)
	Temples()
	end
	if BACK.y>=-10-71*WIZARDTWR.currency and BACK.y<200+71*WIZARDTWR.currency and WIZARDTWR.currency ~= -1 then
	Graphics.drawPartialImage(BACK.x, BACK.y+71*WIZARDTWR.currency,0,426,242,71,BackgroundSprites)
	Towers()
	end
	Graphics.drawImage(0, 0, StoreHead)
	for i=1, batterylevel do
		Graphics.fillRect(7+4*(i-1),10+4*(i-1),227,235,BatteryColor)
	end
	if (STICKy<-10 and BACK.y>-9-71*(justcurrency-3)+1) or (STICKy>10 and BACK.y<62) then
	BACK.y=BACK.y+STICKy*0.05
	end
	if BACK.y<-9-71*(justcurrency-3)+1 then
	BACK.y=-9-71*(justcurrency-3)+1
	end
	if BACK.y>62 then
	BACK.y=62
	end
	Graphics.drawImage(5,7,favicon)
	if status=="BUY menu" then
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==0 and COOKIE.count >= CURSOR.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		CURSOR.count=CURSOR.count+1
		COOKIE.count=COOKIE.count-CURSOR.price
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==1 and COOKIE.count >= GRANDMA.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		GRANDMA.count=GRANDMA.count+1
		COOKIE.count=COOKIE.count-GRANDMA.price
		if GRANDMA.currency==-1 then 
		GRANDMA.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==2 and COOKIE.count >= FARM.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		FARM.count=FARM.count+1
		COOKIE.count=COOKIE.count-FARM.price
		if FARM.currency==-1 then 
		FARM.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==3 and COOKIE.count >= MINE.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		MINE.count=MINE.count+1
		COOKIE.count=COOKIE.count-MINE.price
		if MINE.currency==-1 then 
		MINE.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==4 and COOKIE.count >= FACTORY.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		FACTORY.count=FACTORY.count+1
		COOKIE.count=COOKIE.count-FACTORY.price
		if FACTORY.currency==-1 then 
		FACTORY.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==5 and COOKIE.count >= BANK.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		BANK.count=BANK.count+1
		COOKIE.count=COOKIE.count-BANK.price
		if BANK.currency == -1 then 
		BANK.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==6 and COOKIE.count >= TEMPLE.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		TEMPLE.count=TEMPLE.count+1
		COOKIE.count=COOKIE.count-TEMPLE.price
		if TEMPLE.currency == -1 then 
		TEMPLE.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==7 and COOKIE.count >= WIZARDTWR.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		WIZARDTWR.count=WIZARDTWR.count+1
		COOKIE.count=COOKIE.count-WIZARDTWR.price
		if WIZARDTWR.currency == -1 then 
		WIZARDTWR.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	end
	if status=="SELL menu" then
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==0 and CURSOR.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		CURSOR.count=CURSOR.count-1
		COOKIE.count=COOKIE.count+CURSOR.sellprice
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==1 and GRANDMA.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		GRANDMA.count=GRANDMA.count-1
		COOKIE.count=COOKIE.count+GRANDMA.sellprice
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==2 and FARM.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		FARM.count=FARM.count-1
		COOKIE.count=COOKIE.count+FARM.sellprice
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==3 and MINE.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		MINE.count=MINE.count-1
		COOKIE.count=COOKIE.count+MINE.sellprice
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==4 and FACTORY.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		FACTORY.count=FACTORY.count-1
		COOKIE.count=COOKIE.count+FACTORY.sellprice
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==5 and BANK.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		BANK.count=BANK.count-1
		COOKIE.count=COOKIE.count+BANK.sellprice
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==6 and TEMPLE.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		TEMPLE.count=TEMPLE.count-1
		COOKIE.count=COOKIE.count+TEMPLE.sellprice
	end
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==7 and WIZARDTWR.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		WIZARDTWR.count=WIZARDTWR.count-1
		COOKIE.count=COOKIE.count+WIZARDTWR.sellprice
	end
	end
	CURSOR.sellprice=math.ceil(15*1.15^(CURSOR.count-1)/2)
	GRANDMA.sellprice=math.ceil(100*1.15^(GRANDMA.count-1)/2)
	FARM.sellprice=math.ceil(1000*1.15^(FARM.count-1)/2)
	MINE.sellprice=math.ceil(12000*1.15^(MINE.count-1)/2)
	FACTORY.sellprice=math.ceil(130000*1.15^(FACTORY.count-1)/2)
	BANK.sellprice=math.ceil(1400000*1.15^(BANK.count-1)/2)
	TEMPLE.sellprice=math.ceil(20000000*1.15^(TEMPLE.count-1)/2)
	WIZARDTWR.sellprice=math.ceil(330000000*1.15^(WIZARDTWR.count-1)/2)
	CURSOR.price=15*1.15^CURSOR.count	
	GRANDMA.price=100*1.15^GRANDMA.count
	FARM.price=1000*1.15^FARM.count
	MINE.price=12000*1.15^MINE.count
	FACTORY.price=130000*1.15^FACTORY.count
	BANK.price=1400000*1.15^BANK.count
	TEMPLE.price=20000000*1.15^TEMPLE.count
	WIZARDTWR.price=330000000*1.15^WIZARDTWR.count
	Graphics.drawImage(254, 221, favicon)
	if status=="SELL menu" then
		Graphics.drawImage(250, 86, frameus)
	end
	screenshotmake()
	Graphics.termBlend()
	if Controls.check(pad,KEY_SELECT) and not Controls.check(oldpad,KEY_SELECT) and status=="BUY menu" then
		status="SELL menu"
	
	elseif Controls.check(pad,KEY_SELECT) and not Controls.check(oldpad,KEY_SELECT) and status=="SELL menu" then
		status="BUY menu"
	
	end
	if status=="BUY menu" then
		Screen.debugPrint(255, 47,"    BUY menu", green, TOP_SCREEN)
	elseif status=="SELL menu" then
		Screen.debugPrint(255, 47,"    SELL menu", blue, TOP_SCREEN)
	end
	if STORE.stat==0 then 
	Screen.debugPrint(205, 47,CURSOR.count, white, TOP_SCREEN) 
	if status=="BUY menu" then
	Price = CURSOR.price
	elseif status=="SELL menu" then
	Price = CURSOR.sellprice
	end
	end
	if STORE.stat==1 then 
	Screen.debugPrint(205, 47,GRANDMA.count, white, TOP_SCREEN)
	if status=="BUY menu" then
	Price = GRANDMA.price
	elseif status=="SELL menu" then
	Price = GRANDMA.sellprice
	end
	end
	if STORE.stat==2 then 
	Screen.debugPrint(205, 47,FARM.count,white, TOP_SCREEN)
	if status=="BUY menu" then
	Price = FARM.price
	elseif status=="SELL menu" then
	Price = FARM.sellprice
	end
	end
	if STORE.stat==3 then 
	Screen.debugPrint(205, 47,MINE.count, white, TOP_SCREEN)
	if status=="BUY menu" then
	Price = MINE.price
	elseif status=="SELL menu" then
	Price = MINE.sellprice
	end
	end
	if STORE.stat==4 then 
	Screen.debugPrint(205, 47,FACTORY.count, white, TOP_SCREEN)
	if status=="BUY menu" then
	Price = FACTORY.price
	elseif status=="SELL menu" then
	Price = FACTORY.sellprice
	end
	end
	if STORE.stat==5 then 
	Screen.debugPrint(205, 47,BANK.count, white, TOP_SCREEN)
	if status=="BUY menu" then
	Price = BANK.price
	elseif status=="SELL menu" then
	Price = BANK.sellprice
	end
	end
	if STORE.stat==6 then 
	Screen.debugPrint(205, 47,TEMPLE.count, white, TOP_SCREEN)
	if status=="BUY menu" then
	Price = TEMPLE.price
	elseif status=="SELL menu" then
	Price = TEMPLE.sellprice
	end
	end
	if STORE.stat==7 then 
	Screen.debugPrint(205, 47,WIZARDTWR.count,white, TOP_SCREEN)
	if status=="BUY menu" then
	Price = WIZARDTWR.price
	elseif status=="SELL menu" then
	Price = WIZARDTWR.sellprice
	end
	end
	
	
	Screen.debugPrint(253, 61,"  press SELECT ", white, TOP_SCREEN)
	if status=="BUY menu" then
	if Price>COOKIE.count then
	Screen.debugPrint(270, 224,math.floor(Price), red, TOP_SCREEN)
	else
	Screen.debugPrint(270, 224,math.floor(Price), green, TOP_SCREEN)
	end
	end
	if status=="SELL menu" then
	Screen.debugPrint(270, 224,math.floor(Price), blue, TOP_SCREEN)
	end
	Screen.debugPrint(25, 10, math.floor(COOKIE.count).." Cookies                                                                                                       ", Color.new(255,255,255), TOP_SCREEN)
	Screen.debugPrint(5, 30,"per second : "..CpS, white, TOP_SCREEN)
	if string.len(Tm)==2 then
	Screen.debugPrint(5, 210,Th..":"..Tm, blue, TOP_SCREEN)
	else
	Screen.debugPrint(5, 210,Th..":0"..Tm, blue, TOP_SCREEN)
	end
	
	Graphics.initBlend(BOTTOM_SCREEN)
	Graphics.drawImage(0, 0, BackgroundBottom)
	Graphics.drawImageExtended(160, 120, 0, 0, 256, 256 ,SHINE.rot, 1,1, Shine)
	Graphics.drawImageExtended(160, 120, 0, 0, 256, 256 ,-SHINE.rot, 1,1, Shine)
	Graphics.drawImageExtended(160, 120, 0, 0, 128, 128 ,0, COOKIE.size,COOKIE.size, Cookie)
	Graphics.drawImage(0, 0, Gradient)
	ScreenButton(250,205,1,"MENU1")
	Cursor()
	screenshotmake()
	Graphics.termBlend()
	if STORE.y<86+33*(-STORE.stat) then 
		STORE.y=STORE.y+11
	end
	if STORE.y>86+33*(-STORE.stat) then 
		STORE.y=STORE.y-11
	end
	if Controls.check(pad,KEY_DUP) and not Controls.check(oldpad,KEY_DUP) and STORE.stat>0 then
		STORE.stat=STORE.stat-1
	end
	if Controls.check(pad,KEY_DDOWN) and not Controls.check(oldpad,KEY_DDOWN) and STORE.stat<STORE.max then
		STORE.stat=STORE.stat+1
	end
	CpSCursor=0.1*CURSOR.count
	CpSGrandma=GRANDMA.count
	CpSFarm=8*FARM.count
	CpSMine=47*MINE.count
	CpSFactory=260*FACTORY.count
	CpSBank=1400*BANK.count
	CpSTemple=7800*TEMPLE.count
	CpSWizard=44000*WIZARDTWR.count
	CpS=CpSCursor+CpSGrandma+CpSFarm+CpSMine+CpSFactory+CpSBank+CpSTemple+CpSWizard
	if Timer.getTime(timer)/100>=1 then
		Timer.reset(timer)
		COOKIE.count=COOKIE.count+CpS/10
		COOKIE.total=COOKIE.total+CpS/10
	end
	if Timer.getTime(GetBattery)/60000>=1 then
		Timer.reset(GetBattery)
		Th,Tm,Ts = System.getTime()
		batterylevel = System.getBatteryLife()
		if batterylevel>=4 then BatteryColor = green end
		if batterylevel>=3 and batterylevel<4 then BatteryColor = yellow end
		if batterylevel>=0 and batterylevel<3 then BatteryColor = red end
	end
--[[	if Timer.getTime(saving)/60000>=1 then
		autosaving(saving)
	end--]]
	elseif state=="LOADING" then
	Graphics.initBlend(TOP_SCREEN)
	Graphics.drawImage(0, 0, titlecreckeryop)
	Graphics.fillRect(0,400,0,240,Color.new(0,0,0,rota))
	screenshotmake()
	Graphics.termBlend()
	if rota>0 and rotanum==0 then
	rota=rota-1
	end
	if rota==0 and rotanum==0 then
	System.wait(2000)
	rotanum=1
	end
	if rota<255 and rotanum==1 then
	rota=rota+1
	end
	if Controls.check(pad,KEY_A) and Controls.check(oldpad,KEY_A) then 
	rotanum=1
	rota=240
	end
	if rota==255 and rotanum==1 then
	rotanum=2
	end
	if startloading==0 and rotanum==2 then
	state="MENU"
	startloading=1
	end
	if Controls.check(pad,KEY_START) and not Controls.check(oldpad,KEY_START) then
		Sound.close(bgm)
		Sound.term()
		System.exit()
		freefunction()
		bgm = nil
		
	end 
	elseif state=="MENU" then
	Graphics.initBlend(TOP_SCREEN)
	Graphics.drawImage(backx, backy, BackgroundTop1)
	Graphics.drawImage(0, 0, menugradient)
	Graphics.drawImage(0, 0, menutitle)
	screenshotmake()
	Graphics.termBlend()
	Screen.debugPrint(300,220,"pre: "..version,white,TOP_SCREEN)
	Graphics.initBlend(BOTTOM_SCREEN)
	Graphics.drawImage(backx, backy, BackgroundTop1)
	
	ScreenButton(127,46,2,"LOADALL")
	ScreenButton(0,147,3,"SHOWAUTHOR")
	ScreenButton(130,161,4,"EXIT")
	ScreenButton(116,120,5,"OPTIONS")
	Graphics.drawImage(0, 0, gradient2)
	if AUTHOR==2 then
	Graphics.drawImage(83, 221, AUTHORTEXT)
	end
	screenshotmake()
	Graphics.termBlend()
	--[[backx=backx-2
	backy=backy+1.2
	if backx<=-400 then
	backx = backx + 400
	backy = backy - 240
	end]]--
	
	if Cookie == nil or Shine == nil or Gradient == nil or StoreHead == nil or pressed == nil or favicon == nil or cursor == nil or BackgroundSprites == nil or ObjectsSheet == nil or ButtonsSheet == nil then
	else
		justcurrency = 0
		COOKIE = {size=1,count=0,total=0}
		GRANDMA = {price = 100,count=0,currency = -1}
		CURSOR = {price = 15,count=0,rot=0,speed=0.008,currency = -1}
		FARM = {price = 1000,count=0,currency = -1}
		MINE = {price = 12000,count=0,random={},currency = -1}
		FACTORY = {price = 130000,count=0,currency = -1}
		BANK = {price = 1400000,count=0,currency = -1}
		TEMPLE = {price = 20000000,count=0,currency = -1}
		WIZARDTWR = {price = 330000000,count=0,currency = -1}
		continue()
		state="GAME"
	end	
	elseif state=="OPTIONS" then
	Graphics.initBlend(TOP_SCREEN)
	Graphics.drawImage(backx, backy, BackgroundTop1)
	Graphics.drawImage(0, 0, menugradient)
	Graphics.drawImage(0, 0, menutitle)
	screenshotmake()
	Graphics.termBlend()
	Screen.debugPrint(300,220,"pre: "..version,white,TOP_SCREEN)
	Graphics.initBlend(BOTTOM_SCREEN)
	Graphics.drawImage(backx, backy, BackgroundTop1)
	if System.doesFileExist("/ccsave.sav") then
	ScreenButton(116,90,6,"RESET")
	else
	Graphics.drawImage(116,90,resetNET)
	end
	ScreenButton(130,131,1,"MENU")
	ScreenButton(0,147,3,"SHOWAUTHOR")
	Graphics.drawImage(0, 0, gradient2)
	if AUTHOR==2 then
	Graphics.drawImage(83, 221, AUTHORTEXT)
	end
	screenshotmake()
	Graphics.termBlend()
	
	
	
end
	if Controls.check(pad,KEY_L) and Controls.check(pad,KEY_R) and activatescreenshot==0  then
		System.takeScreenshot("/CookieScreenshot-"..Tm.."-"..Ts..".bmp",false)
		activatescreenshot=255
	end
	Screen.flip()
	Screen.waitVblankStart()
	oldpad = pad
	--[[	-- Sets up HomeMenu syscall
	if Controls.check(Controls.read(),KEY_HOME) or Controls.check(Controls.read(),KEY_POWER) then
		save()
		state="SAVED"
		System.showHomeMenu()
	end
	
	-- Exit if HomeMenu calls APP_EXITING
	if System.checkStatus() == APP_EXITING then
		if state=="GAME" then
		save()
		end
		System.exit()
	end]]--
end