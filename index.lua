Graphics.init()
oldpad = Controls.read()
red=Color.new(255,80,80)
redformenu=Color.new(255,0,0)
green=Color.new(80,255,80)
white=Color.new(255,255,255)
if System.currentDirectory() == "/" then
 System.currentDirectory("romfs:/")
end
--bgm = Sound.openOgg(System.currentDirectory().."data/bgm.ogg", true)
titlecreckeryop= Graphics.loadImage(System.currentDirectory().."data/titlecreckeryop.png")
menutitle= Graphics.loadImage(System.currentDirectory().."data/menutitle.png")
menugradient= Graphics.loadImage(System.currentDirectory().."data/menugradient.png")
gradient2= Graphics.loadImage(System.currentDirectory().."data/gradient2.png")
BackgroundTop = Graphics.loadImage(System.currentDirectory().."data/backgroundtop.png")
BackgroundBottom = Graphics.loadImage(System.currentDirectory().."data/backgroundbottom.png")
BackgroundTop1 = Graphics.loadImage(System.currentDirectory().."data/backgroundtop1.png")
backON = Graphics.loadImage(System.currentDirectory().."data/backON.png")
backOFF= Graphics.loadImage(System.currentDirectory().."data/backOFF.png")
backx=0
backy=0
rota=255
rotanum = 0
menufont = Font.load(System.currentDirectory().."font.ttf")
Font.setPixelSizes(menufont,30)
version="0.3.7"
--Sound.init()
--Sound.play(bgm,NO_LOOP)
R12=0
function loadall()
	Cookie = Graphics.loadImage(System.currentDirectory().."data/cookie.png")
	Shine = Graphics.loadImage(System.currentDirectory().."data/shine.png")
	Gradient = Graphics.loadImage(System.currentDirectory().."data/Gradient.png")	
	StoreHead = Graphics.loadImage(System.currentDirectory().."data/storehead.png")
	CursorBuyIcon = Graphics.loadImage(System.currentDirectory().."data/CursorBuyIcon.png")
	CursorBuyIconNo = Graphics.loadImage(System.currentDirectory().."data/CursorBuyIconNo.png")
	GrandmaBuyIcon = Graphics.loadImage(System.currentDirectory().."data/GrandmaBuyIcon.png")
	GrandmaBuyIconNo = Graphics.loadImage(System.currentDirectory().."data/GrandmaBuyIconNo.png")
	FarmBuyIcon = Graphics.loadImage(System.currentDirectory().."data/FarmBuyIcon.png")
	FarmBuyIconNo = Graphics.loadImage(System.currentDirectory().."data/FarmBuyIconNo.png")
	MineBuyIcon = Graphics.loadImage(System.currentDirectory().."data/MineBuyIcon.png")
	MineBuyIconNo = Graphics.loadImage(System.currentDirectory().."data/MineBuyIconNo.png")
	FactoryBuyIcon = Graphics.loadImage(System.currentDirectory().."data/FactoryBuyIcon.png")
	FactoryBuyIconNo = Graphics.loadImage(System.currentDirectory().."data/FactoryBuyIconNo.png")
	BankBuyIcon = Graphics.loadImage(System.currentDirectory().."data/BankBuyIcon.png")
	BankBuyIconNo = Graphics.loadImage(System.currentDirectory().."data/BankBuyIconNo.png")
	
	pressed = Graphics.loadImage(System.currentDirectory().."data/pressed.png")
	favicon = Graphics.loadImage(System.currentDirectory().."data/favicon.png")
	cursor = Graphics.loadImage(System.currentDirectory().."data/cursor.png")
	grandma = Graphics.loadImage(System.currentDirectory().."data/grandma.png")
	farm = Graphics.loadImage(System.currentDirectory().."data/farm.png")
	mine = Graphics.loadImage(System.currentDirectory().."data/mine.png")
	factory = Graphics.loadImage(System.currentDirectory().."data/factory.png")
	bank = Graphics.loadImage(System.currentDirectory().."data/bank.png")
	backgroundgrandma = Graphics.loadImage(System.currentDirectory().."data/backgroundgrandma.png")
	backgroundfarm = Graphics.loadImage(System.currentDirectory().."data/backgroundfarm.png")
	backgroundmine = Graphics.loadImage(System.currentDirectory().."data/backgroundmine.png")
	backgroundfactory = Graphics.loadImage(System.currentDirectory().."data/backgroundfactory.png")
	backgroundbank = Graphics.loadImage(System.currentDirectory().."data/backgroundbank.png")
end
state="LOADING"
Buttons={texture = {backON},texture2 = {backOFF},sizex={},sizey={},dntch={}}
SHINE={}
SHINE.rot=0
SHINE.speed=0.005
MENU={stat=1,max=3,"New Game","Options","Exit"}
justcurrency = 0
COOKIE = {size=1,count=0,total=0}
TOUCHes = {}
STORE={x = 250,y = 86,stat = 0,max = 5}
Shade=Color.new(250,250,250,100)
CpS=0
CpSCursor=0
BACK={x=0,y=64}
holdtoexit = 0
startloading=0
function freefunction()
	Graphics.freeImage(Cookie)
	Graphics.freeImage(Shine)
	Graphics.freeImage(Gradient)
	Graphics.freeImage(StoreHead)
	Graphics.freeImage(CursorBuyIcon)
	Graphics.freeImage(CursorBuyIconNo)
	Graphics.freeImage(GrandmaBuyIcon)
	Graphics.freeImage(GrandmaBuyIconNo)
	Graphics.freeImage(FarmBuyIcon)
	Graphics.freeImage(FarmBuyIconNo)
	Graphics.freeImage(MineBuyIcon)
	Graphics.freeImage(MineBuyIconNo)
	Graphics.freeImage(FactoryBuyIcon)
	Graphics.freeImage(FactoryBuyIconNo)
	Graphics.freeImage(BankBuyIcon)
	Graphics.freeImage(BankBuyIconNo)
	Graphics.freeImage(pressed)
	Graphics.freeImage(favicon)
	Graphics.freeImage(cursor)
	Graphics.freeImage(grandma)
	Graphics.freeImage(farm)
	Graphics.freeImage(mine)
	Graphics.freeImage(factory)
	Graphics.freeImage(bank)
	Graphics.freeImage(gamesaved)
	Graphics.freeImage(backgroundgrandma)
	Graphics.freeImage(backgroundfarm)
	Graphics.freeImage(backgroundmine)
	Graphics.freeImage(backgroundfactory)
	Graphics.freeImage(backgroundbank)
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
	if TOUCHx > (160-64*COOKIE.size) and TOUCHx < (160+64*COOKIE.size) and TOUCHy > (120-64*COOKIE.size) and TOUCHy < (120+64*COOKIE.size) then
		if COOKIE.size < 1.2 then COOKIE.size = COOKIE.size + 0.1 end
		TOUCHYstatus = "PRESSED"
		TOUCHes.xlast = TOUCHx
		TOUCHes.ylast = TOUCHy
	else
		if TOUCHx == 0 and TOUCHy == 0 and TOUCHYstatus == "PRESSED" then
		COOKIE.count=COOKIE.count+1
		COOKIE.total=COOKIE.total+1
		end
		TOUCHYstatus = "NOT PRESSED"
		if COOKIE.size > 1 then COOKIE.size = COOKIE.size-0.1 end
	end
end
function Cursor()
	for i=1, CURSOR.count do
		if i<=14 then
			Graphics.drawImageExtended(160, 120, 0, 0, 17, 180 ,-(CURSOR.rot+pi/7*i), 1.2,1.2, cursor)
		end
	end
end
function Grandmother()
	for i=1, GRANDMA.count do
		if i<=6 then 
			Graphics.drawImage(0+35*(i-1), BACK.y+71*GRANDMA.currency, grandma)
		end
	end
end
function Farms()
	for i=1, FARM.count do
		if i<=5 then 
			if i==1 or i==3 or i==5 then
				Graphics.drawImage(0+45*(i-1), BACK.y+71*FARM.currency, farm)
			end
			if i==2 or i==4 then
				Graphics.drawImage(0+45*(i-1), BACK.y+71*FARM.currency+10, farm)
			end
		end
	end
end
function Mines()
	for i=1, MINE.count do
		if i<=5 then 
			MINE.random[i]=MINE.random[i] or math.random(0,30)
			Graphics.drawImage(0+45*(i-1), BACK.y+71*MINE.currency+MINE.random[i], mine)
		end
	end
end
function Factories()
	for i=1, FACTORY.count do
		if i<=5 then 
			Graphics.drawImage(0+45*(i-1), BACK.y+71*FACTORY.currency, factory)
		end
	end
end
function Banks()
	for i=1, BANK.count do
		if i<=5 then 
			Graphics.drawImage(0+45*(i-1), BACK.y+71*BANK.currency, bank)
		end
	end
end
function save()
	savefile = io.open("/ccsave.sav",FCREATE)
	savestring = COOKIE.count.."#"..GRANDMA.count.."#"..COOKIE.total.."#"..CURSOR.count.."#"..FARM.count.."#"..MINE.count.."#"..GRANDMA.currency.."#"..FARM.currency.."#"..MINE.currency.."#"..justcurrency.."#"..FACTORY.count.."#"..FACTORY.currency.."#"..BANK.count.."#"..BANK.currency
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
		FACTORY.count = tonumber(savearray[11])
		FACTORY.currency = tonumber(savearray[12])
		BANK.count = tonumber(savearray[13]) or 0
		BANK.currency = tonumber(savearray[14]) or -1
		
	end
end
function ScreenButton(xbut,ybut,i,st)
		Buttons.sizex[i] = Graphics.getImageWidth(Buttons.texture[i])
		Buttons.sizey[i] = Graphics.getImageHeight(Buttons.texture[i])
	if TOUCHx == 0 and TOUCHy==0 then 
		if Buttons.dntch[st] == "YES" then
			state=st
			Buttons.dntch[st] = "NO"
			if st=="MENU1" then
			save()
			Cookie=nil
			holdtoexit=0
			state="MENU"
			if System.doesFileExist("/ccsave.sav") then
			MENU[1]="Continue"
	end
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
saving = Timer.new()
Timer.resume(saving)
autosavinginteger=0
autosavinginteger2=0

function System.wait(milliseconds)
   tmp = Timer.new()
   while Timer.getTime(tmp) < milliseconds do end
   Timer.destroy(tmp)
end
while true do
	Screen.refresh()
	Screen.clear(TOP_SCREEN)
	Screen.clear(BOTTOM_SCREEN)
	TOUCHx,TOUCHy = Controls.readTouch()
	STICKx,STICKy = Controls.readCirclePad()
	pad = Controls.read()
	
	
	
	if state=="GAME" then
	SHINE.rot=SHINE.rot+SHINE.speed
	if SHINE.rot >= 2*pi then SHINE.rot = SHINE.rot-2*pi end
		CURSOR.rot=CURSOR.rot+CURSOR.speed
	if CURSOR.rot >= 2*pi then CURSOR.rot = CURSOR.rot-2*pi end
	TOUCHCHECK()
	Graphics.initBlend(TOP_SCREEN)
	Graphics.drawImage(0, 0, BackgroundTop)
	if COOKIE.total>=15 then
	CURSOR.buyicon = CursorBuyIcon
	CURSOR.name="Cursor"
	end
	if COOKIE.total>=100 then 
	GRANDMA.buyicon = GrandmaBuyIcon
	GRANDMA.name="Grandma"
	end
	if COOKIE.total>=1000 then 
	FARM.buyicon = FarmBuyIcon
	FARM.name="Farm"
	end
	if COOKIE.total>=12000 then 
	MINE.buyicon = MineBuyIcon
	MINE.name="Mine"
	end
	if COOKIE.total>=130000 then 
	FACTORY.buyicon = FactoryBuyIcon
	FACTORY.name="Factory"
	end
	if COOKIE.total>=1400000 then 
	BANK.buyicon = BankBuyIcon
	BANK.name="Bank"
	end
	if COOKIE.count >= CURSOR.price then
	Graphics.drawImage(STORE.x, STORE.y, CURSOR.buyicon)
	else
	Graphics.drawImage(STORE.x, STORE.y, CURSOR.buyicon,Shade)
	end
	if COOKIE.count >= GRANDMA.price then
	Graphics.drawImage(STORE.x, STORE.y+33, GRANDMA.buyicon)
	else
	Graphics.drawImage(STORE.x, STORE.y+33, GRANDMA.buyicon,Shade)
	end
	if COOKIE.count >= FARM.price then
	Graphics.drawImage(STORE.x, STORE.y+66, FARM.buyicon)
	else
	Graphics.drawImage(STORE.x, STORE.y+66, FARM.buyicon,Shade)
	end
	if COOKIE.count >= MINE.price then
	Graphics.drawImage(STORE.x, STORE.y+99, MINE.buyicon)
	else
	Graphics.drawImage(STORE.x, STORE.y+99, MINE.buyicon,Shade)
	end
	if COOKIE.count >= FACTORY.price then
	Graphics.drawImage(STORE.x, STORE.y+132, FACTORY.buyicon)
	else
	Graphics.drawImage(STORE.x, STORE.y+132, FACTORY.buyicon,Shade)
	end
	if COOKIE.count >= BANK.price then
	Graphics.drawImage(STORE.x, STORE.y+165, BANK.buyicon)
	else
	Graphics.drawImage(STORE.x, STORE.y+165, BANK.buyicon,Shade)
	end
	
	if GRANDMA.count>0 and GRANDMA.currency ~= -1 then
	Graphics.drawImage(BACK.x, BACK.y+71*GRANDMA.currency, backgroundgrandma)
	Grandmother()
	end
	if FARM.count>0 and FARM.currency ~= -1 then
	Graphics.drawImage(BACK.x, BACK.y+71*FARM.currency, backgroundfarm)
	Farms()
	end
	if MINE.count>0 and MINE.currency ~= -1 then
	Graphics.drawImage(BACK.x, BACK.y+71*MINE.currency, backgroundmine)
	Mines()
	end
	if FACTORY.count>0 and FACTORY.currency ~= -1 then
	Graphics.drawImage(BACK.x, BACK.y+71*FACTORY.currency, backgroundfactory)
	Factories()
	end
	if BANK.count>0 and BANK.currency ~= -1 then
	Graphics.drawImage(BACK.x, BACK.y+71*BANK.currency, backgroundbank)
	Banks()
	end
	
	Graphics.drawImage(0, 0, StoreHead)
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
		if BANK.currency==-1 then 
		BANK.currency = justcurrency 
		justcurrency = justcurrency+1
		end
	end
	
	CURSOR.price=15*1.15^CURSOR.count
	GRANDMA.price=100*1.15^GRANDMA.count
	FARM.price=1000*1.15^FARM.count
	MINE.price=12000*1.15^MINE.count
	FACTORY.price=130000*1.15^FACTORY.count
	BANK.price=1400000*1.15^BANK.count
	
	Graphics.drawImage(254, 221, favicon)
	Graphics.termBlend()
	if STORE.stat==0 then 
	Screen.debugPrint(260, 55,"Quantity - "..CURSOR.count.." ", Color.new(255,255,255), TOP_SCREEN) 
	Price = CURSOR.price
	end
	if STORE.stat==1 then 
	Screen.debugPrint(260, 55,"Quantity - "..GRANDMA.count.." ", Color.new(255,255,255), TOP_SCREEN)
	Price = GRANDMA.price
	end
	if STORE.stat==2 then 
	Screen.debugPrint(260, 55,"Quantity - "..FARM.count.." ", Color.new(255,255,255), TOP_SCREEN)
	Price = FARM.price
	end
	if STORE.stat==3 then 
	Screen.debugPrint(260, 55,"Quantity - "..MINE.count.." ", Color.new(255,255,255), TOP_SCREEN)
	Price = MINE.price
	end
	if STORE.stat==4 then 
	Screen.debugPrint(260, 55,"Quantity - "..FACTORY.count.." ", Color.new(255,255,255), TOP_SCREEN)
	Price = FACTORY.price
	end
	if STORE.stat==5 then 
	Screen.debugPrint(260, 55,"Quantity - "..BANK.count.." ", Color.new(255,255,255), TOP_SCREEN)
	Price = BANK.price
	end
	if Price>COOKIE.count then
	Screen.debugPrint(270, 224,math.floor(Price), red, TOP_SCREEN)
	else
	Screen.debugPrint(270, 224,math.floor(Price), green, TOP_SCREEN)
	end
	 
	 Screen.debugPrint(25, 10, math.floor(COOKIE.count).." Cookies                                                                                                       ", Color.new(255,255,255), TOP_SCREEN)
	 Screen.debugPrint(5, 30,"per second : "..CpS, Color.new(255,255,255), TOP_SCREEN)
	Graphics.initBlend(BOTTOM_SCREEN)
	Graphics.drawImage(0, 0, BackgroundBottom)
	Graphics.drawImageExtended(160, 120, 0, 0, 256, 256 ,SHINE.rot, 1,1, Shine)
	Graphics.drawImageExtended(160, 120, 0, 0, 256, 256 ,-SHINE.rot, 1,1, Shine)
	Graphics.drawImageExtended(160, 120, 0, 0, 128, 128 ,0, COOKIE.size,COOKIE.size, Cookie)

	Graphics.drawImage(0, 0, Gradient)
	ScreenButton(260,210,1,"MENU1")
	Cursor()
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
	
	CpS=CpSCursor+CpSGrandma+CpSFarm+CpSMine+CpSFactory+CpSBank
	if Timer.getTime(timer)/100>=1 then
		Timer.reset(timer)
		COOKIE.count=COOKIE.count+CpS/10
		COOKIE.total=COOKIE.total+CpS/10
	end
--[[	if Timer.getTime(saving)/60000>=1 then
		autosaving(saving)
	end--]]

	elseif state=="LOADING" then
	
	Graphics.initBlend(TOP_SCREEN)
	Graphics.drawImage(0, 0, titlecreckeryop)
	Graphics.fillRect(0,400,0,240,Color.new(0,0,0,rota))
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
	if System.doesFileExist("/ccsave.sav") then
		MENU[1]="Continue"
	end
	end
	
	if Controls.check(pad,KEY_START) and Controls.check(pad,KEY_START) then
		System.exit()
		freefunction()
	end
	
	elseif state=="MENU" then
	Graphics.initBlend(TOP_SCREEN)
	Graphics.drawImage(backx, backy, BackgroundTop1)
	Graphics.drawImage(0, 0, menugradient)
	Graphics.drawImage(0, 0, menutitle)
	Graphics.termBlend()
	Screen.debugPrint(300,220,"pre: "..version,white,TOP_SCREEN)
	Graphics.initBlend(BOTTOM_SCREEN)
	Graphics.drawImage(backx, backy, BackgroundTop1)
	Graphics.fillRect(0,320,70+28*(MENU.stat-1),98+30*(MENU.stat-1),Color.new(0,0,0,150))
	Graphics.drawImage(0, 0, gradient2)
	Graphics.termBlend()
	--[[backx=backx-2
	backy=backy+1.2
	if backx<=-400 then
	backx = backx + 400
	backy = backy - 240
	end]]--
	if Controls.check(pad,KEY_A) and Controls.check(oldpad,KEY_A) and MENU[MENU.stat]=="Exit" then
		System.exit()
		freefunction()
		bgm = nil
		Font.unload(menufont)
	end
	
		for i=1, MENU.max do
				Font.print(menufont,70,70+30*(i-1),MENU[i].."                                      ",white,BOTTOM_SCREEN)
		end
	if Controls.check(pad,KEY_DUP) and not Controls.check(oldpad,KEY_DUP) and MENU.stat>1 then
		MENU.stat=MENU.stat-1
	end
	if Controls.check(pad,KEY_DDOWN) and not Controls.check(oldpad,KEY_DDOWN) and MENU.stat<MENU.max then
		MENU.stat=MENU.stat+1
	end
	if Controls.check(pad,KEY_A) and (MENU[MENU.stat]=="New Game" or MENU[MENU.stat]=="Continue") and CursorBuyIcon == nil and presssing=="NOT PRESSED" then
		loadall()
	end
	if Controls.check(pad,KEY_A) and Controls.check(oldpad,KEY_A) and MENU[MENU.stat]=="Options" and presssing=="NOT PRESSED" then
		if System.doesFileExist("/ccsave.sav") then
		MENU[1]="Erease data"
		else
		MENU[1]="Data Ereased"
		end
		MENU[2]="Back"
		MENU.max = 2
		MENU.stat = 1
		presssing="PRESSED"
	end
		if System.doesFileExist("/ccsave.sav") and MENU[1]=="Data Ereased" then
			MENU[1]="Erease data"
		elseif MENU[1]=="Erease data" and System.doesFileExist("/ccsave.sav")==false then
			MENU[1]="Data Ereased"
		end
	if Controls.check(pad,KEY_A) and Controls.check(oldpad,KEY_A) and MENU[MENU.stat]=="Erease data" and presssing=="NOT PRESSED" then
		System.deleteFile("/ccsave.sav")
		
		presssing="PRESSED"
	end
	if Controls.check(pad,KEY_A) and Controls.check(oldpad,KEY_A) and MENU[MENU.stat]=="Back" and presssing=="NOT PRESSED" then
		MENU.max = 3
		MENU.stat = 2
		MENU[1]="New Game"
		MENU[2]="Options"
		MENU[3]="Exit"
		if System.doesFileExist("/ccsave.sav") then
		MENU[1]="Continue"
		end
		presssing="PRESSED"
	end
	if Controls.check(pad,KEY_A) then
		
	else
		presssing="NOT PRESSED"
	end
	if Controls.check(pad,KEY_A) and (MENU[MENU.stat]=="New Game" or MENU[MENU.stat]=="Continue") and CursorBuyIcon ~= nil then
		Cookie = Graphics.loadImage(System.currentDirectory().."data/cookie.png")
	end
	
	
	if Cookie == nil or Shine == nil or Gradient == nil or StoreHead == nil or CursorBuyIcon == nil or CursorBuyIconNo == nil or GrandmaBuyIcon == nil or GrandmaBuyIconNo == nil or FarmBuyIcon == nil  or FarmBuyIconNo == nil or MineBuyIcon == nil or MineBuyIconNo == nil or FactoryBuyIcon == nil or FactoryBuyIconNo == nil or pressed == nil or favicon == nil or cursor == nil or grandma == nil or farm == nil or mine == nil or factory == nil or backgroundgrandma == nil or backgroundfarm == nil or backgroundmine == nil or backgroundfactory == nil then
	
	else
		justcurrency = 0
		COOKIE = {size=1,count=0,total=0}
		GRANDMA = {buyicon=GrandmaBuyIconNo,price = 100,count=0,name="???",currency = -1}
		CURSOR = {buyicon=CursorBuyIconNo,price = 15,count=0,name="???",rot=0,speed=0.008,currency = -1}
		FARM = {buyicon=FarmBuyIconNo,price = 1000,count=0,name="???",currency = -1}
		MINE = {buyicon=MineBuyIconNo,price = 12000,count=0,name="???",random={},currency = -1}
		FACTORY = {buyicon=FactoryBuyIconNo,price = 130000,count=0,name="???",random={},currency = -1}
		BANK = {buyicon=BankBuyIconNo,price = 1400000,count=0,name="???",random={},currency = -1}
		continue()
		state="GAME"
	end	
end
	
	if Controls.check(pad,KEY_L) and Controls.check(pad,KEY_R) then
		R12=R12+1
		System.takeScreenshot("/screenshot"..R12..".bmp",false)
	end
	
	Screen.flip()
	Screen.waitVblankStart()
	oldpad = pad
--[[	
		-- Sets up HomeMenu syscall
	if Controls.check(Controls.read(),KEY_HOME) or Controls.check(Controls.read(),KEY_POWER) then
		System.showHomeMenu()
	end
	
	-- Exit if HomeMenu calls APP_EXITING
	if System.checkStatus() == APP_EXITING then
		if state=="GAME" then
		save()
		end
		System.exit()
	if System.checkStatus() == APP_RUNNING then
	loadall()
	end
	end]]--
end