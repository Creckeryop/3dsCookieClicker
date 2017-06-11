Graphics.init()
oldpad = Controls.read()
red=Color.new(255,80,80)
yellow=Color.new(255,255,80)
redformenu=Color.new(255,0,0)
green=Color.new(80,255,80)
gray=Color.new(80,80,80)
white=Color.new(255,255,255)
black=Color.new(0,0,0)
WhiteShade=Color.new(255,255,255,100)
blue=Color.new(80,80,255)
Th,Tm,Ts = System.getTime()
math.randomseed(Th*3600+Tm*60+Ts)
COOKIE = {size=1,count=0,total=0,tableone={},tabletwo={},upgrade=1}
GRANDMA = {price = 100,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
CURSOR = {price = 15,count=0,rot=0,speed=0.008,currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
FARM = {price = 1000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
MINE = {price = 12000,count=0,random={},currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
FACTORY = {price = 130000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
BANK = {price = 1400000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
TEMPLE = {price = 20000000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
WIZARDTWR = {price = 330000000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1}
glyph_l = {}
glyph_r = {}
glyph_w = {}
NowPrice = 0
Abig = nil
function g_init(char, l, r) --this saves to an array the left and right pixels, as well as the width of each character, and the character's string is the index
    glyph_l[char] = l
    glyph_r[char] = r
    glyph_w[char] = r-l+1
end
--glyph_w = {} --precalculate this so it's faster on the text drawing system
g_init('0',414,430)
g_init('1',431,439)
g_init('2',440,454)
g_init('3',455,468)
g_init('4',469,483)
g_init('5',484,497)
g_init('6',498,512)
g_init('7',512,525)
g_init('8',526,540)
g_init('9',541,554)
g_init('A',1,19)
g_init('B',20,35)
g_init('C',36,52)
g_init('D',53,70)
g_init('E',71,84)
g_init('F',85,98)
g_init('G',99,116)
g_init('H',117,133)
g_init('I',134,139)
g_init('J',140,148)
g_init('K',149,164)
g_init('L',165,177)
g_init('M',178,196)
g_init('N',197,213)
g_init('O',214,232)
g_init('P',233,248)
g_init('Q',249,268)
g_init('R',269,284)
g_init('S',285,296)
g_init('T',297,310)
g_init('U',311,327)
g_init('V',328,344)
g_init('W',345,367)
g_init('X',368,383)
g_init('Y',384,399)
g_init('Z',400,413)
g_init('.',562,568)
g_init(' ',580,581)
g_init(':',555,561)
g_init('-',569,580)
g_init('#',582,599)
function UPGRADEMENU(a,num,price,levelofup)
	if STORE.stat == num then
		gpu_drawtext(291,40,"x2",white)
		Graphics.drawPartialImage(256, 47, 0+num*24, 0+levelofup*24, 24, 24, icons)
		if COOKIE.count<price then
			Graphics.drawImage(250, 41, frameupgrade2)
			if price>1000000 then
				gpu_drawtext(291,58,(math.floor(math.floor(price)/1000)/1000).." M",red)
			else
				gpu_drawtext(291,58,price,red)
			end
			elseif COOKIE.count>=price then
			Graphics.drawImage(250, 41, frameupgrade)
			if price>1000000 then
				gpu_drawtext(291,58,(math.floor(math.floor(price)/1000)/1000).." M",green)
			else
				gpu_drawtext(291,58,price,green)
			end
		end
		NowPrice = price
		Abig = a
	end
end
function gpu_drawtext(x, y, text, font_color)
    local text_u = string.upper(text) --my font system is caps-only.
    local i_str=0 --the current position in the string
    local i_chr='' --the current character in the string
    local str_width = 0 --width in pixels of the string
    local str_length = string.len(text)
    local cw --character width
    while i_str < str_length do
        i_str = i_str + 1
        i_chr = string.sub(text_u, i_str, i_str)
        cw = glyph_w[i_chr]
        if cw ~= nil then --as long as the character exists
            Graphics.drawPartialImage(x+str_width, y, glyph_l[i_chr], 0, cw, 22, img_font, font_color)
            str_width = str_width + cw - 1
		end
	end
end
if System.currentDirectory() == "/" then
	System.currentDirectory("romfs:/")
end
img_font = Graphics.loadImage(System.currentDirectory().."data/Font2.png")
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
cookieshower = Graphics.loadImage(System.currentDirectory().."data/cookieShower1.png")
sellborder = Graphics.loadImage(System.currentDirectory().."data/sellborder.png")
icons = Graphics.loadImage(System.currentDirectory().."data/icons.png")
frameupgrade = Graphics.loadImage(System.currentDirectory().."data/frameupgrade.png")
frameupgrade2 = Graphics.loadImage(System.currentDirectory().."data/frameupgrade2.png")
controls = Graphics.loadImage(System.currentDirectory().."data/controls.png")
SAVESYSTEM = 0
cookieshowery = 0
backx=0
backy=0
rota=255
rotanum = 0
version="1.0"
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
			COOKIE.count=COOKIE.count+1*CURSOR.upgrade
			COOKIE.total=COOKIE.total+1*CURSOR.upgrade
		end
		TOUCHYstatus = "NOT PRESSED"
		if COOKIE.size > 1 and TOUCHALTER~=1 then COOKIE.size = COOKIE.size-0.1 end
	end
end
function alternativeclick()
	if Controls.check(pad,KEY_X) and not Controls.check(oldpad,KEY_X) then
		COOKIE.count=COOKIE.count+1*CURSOR.upgrade
		COOKIE.total=COOKIE.total+1*CURSOR.upgrade
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
		if i<=8 then 
			Graphics.drawRotateImage(160, 120, cursor,-(CURSOR.rot+pi/4*i))
		end
	end
end
function BUFF(a,num,quan,b,k)
	local c = a
	if c.count<=quan and c.count>0 then
		for i=1, c.count do
			if i<=quan then 
				Graphics.drawPartialImage(b+k*(i-1),12+BACK.y+71*c.currency-4, num, 0, 50, 50, ObjectsSheet)
			end
		end
		elseif c.count>quan then
		for i=1,quan do
			Graphics.drawPartialImage(b+k*(i-1),12+BACK.y+71*c.currency-4, num, 0, 50, 50, ObjectsSheet)
		end
		elseif c.count==0 then
		Graphics.drawImage(81,17+BACK.y+71*c.currency,allsoldbanner)
	end
end
function BUYMENU(a,num,high)
	local c = a
	if status=="BUY menu" and COOKIE.count >= c.price  then
		Graphics.drawPartialImage(STORE.x, STORE.y+high, 150, high, 150, 33, ButtonsSheet)
		elseif status=="SELL menu" and c.count>0 then
		Graphics.drawPartialImage(STORE.x, STORE.y+high, 150, high, 150, 33, ButtonsSheet)
		Graphics.drawImage(STORE.x, STORE.y+high,sellborder)
		elseif COOKIE.total >= num and COOKIE.count<c.price or (status=="SELL menu" and c.count==0 and COOKIE.total > num) then
		Graphics.drawPartialImage(STORE.x, STORE.y+high, 150, high, 150, 33, ButtonsSheet,Shade)
		elseif COOKIE.total < num then
		Graphics.drawPartialImage(STORE.x, STORE.y+high, 0, high, 150, 33, ButtonsSheet,Shade)
	end
end
function BUYMENUPLUSONE(a,num)
	local c = a
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==num and COOKIE.count >= c.price then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		c.count=c.count+1
		COOKIE.count=COOKIE.count-c.price
		if c.currency==-1 and num>0 then 
			c.currency = justcurrency 
			justcurrency = justcurrency+1
		end
	end
end
function BUYMENUMINUSONE(a,num)
	local c = a
	if Controls.check(pad,KEY_A) and not Controls.check(oldpad,KEY_A) and STORE.stat==num and c.count > 0 then
		Graphics.drawImage(STORE.x, STORE.y+33*STORE.stat, pressed)
		c.count=c.count-1
		COOKIE.count=COOKIE.count+c.sellprice
	end
end
function save()
	savefile = io.open("/ccsave.sav",FCREATE)
	savestring = COOKIE.count.."#"..GRANDMA.count.."#"..COOKIE.total.."#"..CURSOR.count.."#"..FARM.count.."#"..MINE.count.."#"..GRANDMA.currency.."#"..FARM.currency.."#"..MINE.currency.."#"..justcurrency.."#"..FACTORY.count.."#"..FACTORY.currency.."#"..BANK.count.."#"..BANK.currency.."#"..TEMPLE.count.."#"..TEMPLE.currency.."#"..WIZARDTWR.count.."#"..WIZARDTWR.currency.."#"..CURSOR.upgrade.."#"..GRANDMA.upgrade.."#"..FARM.upgrade.."#"..MINE.upgrade.."#"..FACTORY.upgrade.."#"..BANK.upgrade.."#"..TEMPLE.upgrade.."#"..WIZARDTWR.upgrade.."#"..CURSOR.avupgrade.."#"..GRANDMA.avupgrade.."#"..FARM.avupgrade.."#"..MINE.avupgrade.."#"..FACTORY.avupgrade.."#"..BANK.avupgrade.."#"..TEMPLE.avupgrade.."#"..WIZARDTWR.avupgrade.."#"
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
		CURSOR.upgrade = tonumber(savearray[19]) or 1
		GRANDMA.upgrade = tonumber(savearray[20]) or 1
		FARM.upgrade = tonumber(savearray[21]) or 1
		MINE.upgrade = tonumber(savearray[22]) or 1
		FACTORY.upgrade = tonumber(savearray[23]) or 1
		BANK.upgrade = tonumber(savearray[24]) or 1
		TEMPLE.upgrade = tonumber(savearray[25]) or 1
		WIZARDTWR.upgrade = tonumber(savearray[26]) or 1
		CURSOR.avupgrade = tonumber(savearray[27]) or 0
		GRANDMA.avupgrade = tonumber(savearray[28]) or 0
		FARM.avupgrade = tonumber(savearray[29]) or 0
		MINE.avupgrade = tonumber(savearray[30]) or 0
		FACTORY.avupgrade = tonumber(savearray[31]) or 0
		BANK.avupgrade = tonumber(savearray[32]) or 0
		TEMPLE.avupgrade = tonumber(savearray[33]) or 0
		WIZARDTWR.avupgrade = tonumber(savearray[34]) or 0
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
				elseif st=="OPTIONS" then
				if System.doesFileExist("/ccsave.sav") then
					SAVESYSTEM = 0
					else
					SAVESYSTEM = 1
				end
				state = st
				elseif st=="RESET" then
				System.deleteFile("/ccsave.sav")
				if System.doesFileExist("/ccsave.sav") then
					SAVESYSTEM = 0
					else
					SAVESYSTEM = 1
				end
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
function COUNTING(a,num)
	local c = a
	if STORE.stat==num then 
		gpu_drawtext(125,210,"# "..c.count, white) 
		if status=="BUY menu" then
			Price = c.price
			elseif status=="SELL menu" then
			Price = c.sellprice
		end
	end
end
pi=3.1415
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
		if COOKIE.count>999000000 then
			state = "THEEND"
		end
		SHINE.rot=SHINE.rot+SHINE.speed
		if SHINE.rot >= 2*pi then SHINE.rot = SHINE.rot-2*pi end
		CURSOR.rot=CURSOR.rot+CURSOR.speed
		if CURSOR.rot >= 2*pi then CURSOR.rot = CURSOR.rot-2*pi end
		alternativeclick()
		TOUCHCHECK()
		Graphics.initBlend(TOP_SCREEN)
		Graphics.drawImage(0, 65, BackgroundTop)
		if STORE.y>=86-32 then
			BUYMENU(CURSOR,15,0)
		end
		if STORE.y>=86-65 and STORE.y<183-32 then
			BUYMENU(GRANDMA,100,33)
		end
		if STORE.y>=86-98 and STORE.y<183-65 then
			BUYMENU(FARM,1000,66)
		end
		if STORE.y>=86-131 and STORE.y<183-98 then
			BUYMENU(MINE,12000,99)
		end
		if STORE.y>=86-164 and STORE.y<183-131 then
			BUYMENU(FACTORY,130000,132)
		end
		if STORE.y>=86-197 and STORE.y<183-164 then
			BUYMENU(BANK,1400000,165)
		end
		if STORE.y>=86-230 and STORE.y<183-197 then
			BUYMENU(TEMPLE,20000000,198)
		end
		if STORE.y>=86-263 and STORE.y<183-230 then
			BUYMENU(WIZARDTWR,330000000,231)
		end
		if BACK.y>=-7-71*GRANDMA.currency and BACK.y<196-71*GRANDMA.currency and GRANDMA.currency ~= -1 then
			Graphics.drawPartialImage(BACK.x, BACK.y+71*GRANDMA.currency,0,0,242,71,BackgroundSprites)
			BUFF(GRANDMA,0,6,2,40)
		end
		if BACK.y>=-7-71*FARM.currency and BACK.y<196-71*FARM.currency and FARM.currency ~= -1 then
			Graphics.drawPartialImage(BACK.x, BACK.y+71*FARM.currency,0,71,242,71,BackgroundSprites)
			BUFF(FARM,50,4,10,55)
		end
		if BACK.y>=-7-71*MINE.currency and BACK.y<196-71*MINE.currency and MINE.currency ~= -1 then
			Graphics.drawPartialImage(BACK.x, BACK.y+71*MINE.currency,0,142,242,71,BackgroundSprites)
			BUFF(MINE,100,4,10,55)
		end
		if BACK.y>=-7-71*FACTORY.currency and BACK.y<196-71*FACTORY.currency and  FACTORY.currency ~= -1 then
			Graphics.drawPartialImage(BACK.x, BACK.y+71*FACTORY.currency,0,213,242,71,BackgroundSprites)
			BUFF(FACTORY,150,4,10,55)
		end
		if BACK.y>=-7-71*BANK.currency and BACK.y<196-71*BANK.currency and BANK.currency ~= -1 then
			Graphics.drawPartialImage(BACK.x, BACK.y+71*BANK.currency,0,284,242,71,BackgroundSprites)
			BUFF(BANK,200,4,10,55)
		end
		if BACK.y>=-7-71*TEMPLE.currency and BACK.y<196-71*TEMPLE.currency and TEMPLE.currency ~= -1 then
			Graphics.drawPartialImage(BACK.x, BACK.y+71*TEMPLE.currency,0,355,242,71,BackgroundSprites)
			BUFF(TEMPLE,250,4,10,55)
		end
		if BACK.y>=-7-71*WIZARDTWR.currency and BACK.y<196-71*WIZARDTWR.currency and WIZARDTWR.currency ~= -1 then
			Graphics.drawPartialImage(BACK.x, BACK.y+71*WIZARDTWR.currency,0,426,242,71,BackgroundSprites)
			BUFF(WIZARDTWR,300,4,10,55)
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
		if status=="BUY menu" then
			BUYMENUPLUSONE(CURSOR,0)
			BUYMENUPLUSONE(GRANDMA,1)
			BUYMENUPLUSONE(FARM,2)
			BUYMENUPLUSONE(MINE,3)
			BUYMENUPLUSONE(FACTORY,4)
			BUYMENUPLUSONE(BANK,5)
			BUYMENUPLUSONE(TEMPLE,6)
			BUYMENUPLUSONE(WIZARDTWR,7)
		end
		if status=="SELL menu" then
			BUYMENUMINUSONE(CURSOR,0)
			BUYMENUMINUSONE(GRANDMA,1)
			BUYMENUMINUSONE(FARM,2)
			BUYMENUMINUSONE(MINE,3)
			BUYMENUMINUSONE(FACTORY,4)
			BUYMENUMINUSONE(BANK,5)
			BUYMENUMINUSONE(TEMPLE,6)
			BUYMENUMINUSONE(WIZARDTWR,7)
		end
		if CURSOR.count==0 then
			CURSOR.sellprice=0
			else
			CURSOR.sellprice=math.ceil(15*1.15^(CURSOR.count-1)/2)
		end
		if GRANDMA.count==0 then
			GRANDMA.sellprice=0
			else
			GRANDMA.sellprice=math.ceil(100*1.15^(GRANDMA.count-1)/2)
		end
		if FARM.count==0 then
			FARM.sellprice=0
			else
			FARM.sellprice=math.ceil(1000*1.15^(FARM.count-1)/2)
		end
		if MINE.count==0 then
			MINE.sellprice=0
			else
			MINE.sellprice=math.ceil(12000*1.15^(MINE.count-1)/2)
		end
		if FACTORY.count==0 then
			FACTORY.sellprice=0
			else
			FACTORY.sellprice=math.ceil(130000*1.15^(FACTORY.count-1)/2)
		end
		if BANK.count==0 then
			BANK.sellprice=0
			else
			BANK.sellprice=math.ceil(1400000*1.15^(BANK.count-1)/2)
		end
		if TEMPLE.count==0 then
			TEMPLE.sellprice=0
			else
			TEMPLE.sellprice=math.ceil(20000000*1.15^(TEMPLE.count-1)/2)
		end
		if WIZARDTWR.count==0 then
			WIZARDTWR.sellprice=0
			else
			WIZARDTWR.sellprice=math.ceil(330000000*1.15^(WIZARDTWR.count-1)/2)
		end
		CURSOR.price=15*1.15^CURSOR.count	
		GRANDMA.price=100*1.15^GRANDMA.count
		FARM.price=1000*1.15^FARM.count
		MINE.price=12000*1.15^MINE.count
		FACTORY.price=130000*1.15^FACTORY.count
		BANK.price=1400000*1.15^BANK.count
		TEMPLE.price=20000000*1.15^TEMPLE.count
		WIZARDTWR.price=330000000*1.15^WIZARDTWR.count
		if status=="SELL menu" then
			Graphics.drawImage(250, 86, frameus)
		end
		if Controls.check(pad,KEY_SELECT) and not Controls.check(oldpad,KEY_SELECT) and status=="BUY menu" then
			status="SELL menu"
			
			elseif Controls.check(pad,KEY_SELECT) and not Controls.check(oldpad,KEY_SELECT) and status=="SELL menu" then
			status="BUY menu"
			
		end
		
		if status=="BUY menu" then
			gpu_drawtext(265, 187,"BUY", white)
			gpu_drawtext(332, 187,"SELL", gray)
			elseif status=="SELL menu" then
			gpu_drawtext(332, 187,"SELL", white)
			gpu_drawtext(265, 187,"BUY", gray)
		end
		COUNTING(CURSOR,0)
		COUNTING(GRANDMA,1)
		COUNTING(FARM,2)
		COUNTING(MINE,3)
		COUNTING(FACTORY,4)
		COUNTING(BANK,5)
		COUNTING(TEMPLE,6)
		COUNTING(WIZARDTWR,7)
		if Controls.check(pad,KEY_Y) and not Controls.check(oldpad,KEY_Y) and Abig ~= nil then
			if COOKIE.count >= NowPrice then
				Abig.upgrade = Abig.upgrade*2
				COOKIE.count = COOKIE.count-NowPrice
				Abig=nil
			end
 		end
		if CURSOR.avupgrade == 0 and CURSOR.count>0 and CURSOR.upgrade == 1 then
			CURSOR.avupgrade = 1
		elseif CURSOR.avupgrade == 1 and CURSOR.count>0 and CURSOR.upgrade == 2 then
			CURSOR.avupgrade = 2
		elseif CURSOR.avupgrade == 2 and CURSOR.count>9 and CURSOR.upgrade == 4 then
			CURSOR.avupgrade = 3
		elseif CURSOR.avupgrade == 3 and CURSOR.count>19 and CURSOR.upgrade == 8 then
			CURSOR.avupgrade = 4
		elseif CURSOR.avupgrade == 4 and CURSOR.count>39 and CURSOR.upgrade == 16 then
			CURSOR.avupgrade = 5
		end
		if GRANDMA.avupgrade == 0 and GRANDMA.count>0 and GRANDMA.upgrade == 1 then
			GRANDMA.avupgrade = 1
		elseif GRANDMA.avupgrade == 1 and GRANDMA.count>4 and GRANDMA.upgrade == 2 then
			GRANDMA.avupgrade = 2
		elseif GRANDMA.avupgrade == 2 and GRANDMA.count>24 and GRANDMA.upgrade == 4 then
			GRANDMA.avupgrade = 3
		elseif GRANDMA.avupgrade == 3 and GRANDMA.count>49 and GRANDMA.upgrade == 8 then
			GRANDMA.avupgrade = 4
		end
		if FARM.avupgrade == 0 and FARM.count>0 and FARM.upgrade == 1 then
			FARM.avupgrade = 1
		elseif FARM.avupgrade == 1 and FARM.count>4 and FARM.upgrade == 2 then
			FARM.avupgrade = 2
		elseif FARM.avupgrade == 2 and FARM.count>24 and FARM.upgrade == 4 then
			FARM.avupgrade = 3
		elseif FARM.avupgrade == 3 and FARM.count>49 and FARM.upgrade == 8 then
			FARM.avupgrade = 4
		end
		if MINE.avupgrade == 0 and MINE.count>0 and MINE.upgrade == 1 then
			MINE.avupgrade = 1
		elseif MINE.avupgrade == 1 and MINE.count>4 and MINE.upgrade == 2 then
			MINE.avupgrade = 2
		elseif MINE.avupgrade == 2 and MINE.count>24 and MINE.upgrade == 4 then
			MINE.avupgrade = 3
		end
		if FACTORY.avupgrade == 0 and FACTORY.count>0 and FACTORY.upgrade == 1 then
			FACTORY.avupgrade = 1
		elseif FACTORY.avupgrade == 1 and FACTORY.count>4 and FACTORY.upgrade == 2 then
			FACTORY.avupgrade = 2
		elseif FACTORY.avupgrade == 2 and FACTORY.count>24 and FACTORY.upgrade == 4 then
			FACTORY.avupgrade = 3
		end
		if BANK.avupgrade == 0 and BANK.count>0 and BANK.upgrade == 1 then
			BANK.avupgrade = 1
		elseif BANK.avupgrade == 1 and BANK.count>4 and BANK.upgrade == 2 then
			BANK.avupgrade = 2
		end
		if TEMPLE.avupgrade == 0 and TEMPLE.count>0 and TEMPLE.upgrade == 1 then
			TEMPLE.avupgrade = 1
		end
		if CURSOR.avupgrade == 1 and CURSOR.upgrade == 1 then
			UPGRADEMENU(CURSOR,0,100,0)
		end
		if CURSOR.avupgrade == 2 and CURSOR.upgrade == 2 then
			UPGRADEMENU(CURSOR,0,500,1)
		end
		if CURSOR.avupgrade == 3 and CURSOR.upgrade == 4 then
			UPGRADEMENU(CURSOR,0,10000,2)
		end
		if CURSOR.avupgrade == 4 and CURSOR.upgrade == 8 then
			UPGRADEMENU(CURSOR,0,100000,3)
		end
		if CURSOR.avupgrade == 5 and CURSOR.upgrade == 16 then
			UPGRADEMENU(CURSOR,0,10000000,4)
		end
		if GRANDMA.avupgrade == 1 and GRANDMA.upgrade == 1 then
			UPGRADEMENU(GRANDMA,1,1000,0)
		end
		if GRANDMA.avupgrade == 2 and GRANDMA.upgrade == 2 then
			UPGRADEMENU(GRANDMA,1,5000,1)
		end
		if GRANDMA.avupgrade == 3 and GRANDMA.upgrade == 4 then
			UPGRADEMENU(GRANDMA,1,50000,2)
		end
		if GRANDMA.avupgrade == 4 and GRANDMA.upgrade == 8 then
			UPGRADEMENU(GRANDMA,1,5000000,3)
		end
		if FARM.avupgrade == 1 and FARM.upgrade == 1 then
			UPGRADEMENU(FARM,2,11000,0)
		end
		if FARM.avupgrade == 2 and FARM.upgrade == 2 then
			UPGRADEMENU(FARM,2,55000,1)
		end
		if FARM.avupgrade == 3 and FARM.upgrade == 4 then
			UPGRADEMENU(FARM,2,550000,2)
		end
		if FARM.avupgrade == 4 and FARM.upgrade == 8 then
			UPGRADEMENU(FARM,2,55000000,3)
		end
		if MINE.avupgrade == 1 and MINE.upgrade == 1 then
			UPGRADEMENU(MINE,3,120000,0)
		end
		if MINE.avupgrade == 2 and MINE.upgrade == 2 then
			UPGRADEMENU(MINE,3,600000,1)
		end
		if MINE.avupgrade == 3 and MINE.upgrade == 4 then
			UPGRADEMENU(MINE,3,6000000,2)
		end
		if FACTORY.avupgrade == 1 and FACTORY.upgrade == 1 then
			UPGRADEMENU(FACTORY,4,1300000,0)
		end
		if FACTORY.avupgrade == 2 and FACTORY.upgrade == 2 then
			UPGRADEMENU(FACTORY,4,6500000,1)
		end
		if FACTORY.avupgrade == 3 and FACTORY.upgrade == 4 then
			UPGRADEMENU(FACTORY,4,65000000,2)
		end
		if BANK.avupgrade == 1 and BANK.upgrade == 1 then
			UPGRADEMENU(BANK,5,14000000,0)
		end
		if BANK.avupgrade == 2 and BANK.upgrade == 2 then
			UPGRADEMENU(BANK,5,70000000,1)
		end
		if TEMPLE.avupgrade == 1 and TEMPLE.upgrade == 1 then
			UPGRADEMENU(TEMPLE,6,200000000,0)
		end
		
		--gpu_drawtext(253, 61,"  press SELECT ", white)
		if status=="BUY menu" then
			if Price>COOKIE.count then
				if Price>=1000000 then
				gpu_drawtext(254, 220,(math.floor(math.floor(Price)/1000)/1000).." M", red)
				else
				gpu_drawtext(254, 220,math.floor(Price), red)
				end
				else
				if Price>=1000000 then
				gpu_drawtext(254, 220,(math.floor(math.floor(Price)/1000)/1000).." M", green)
				else
				gpu_drawtext(254, 220,math.floor(Price), green)
				end
			end
		end
		if status=="SELL menu" then
			if Price>=1000000 then
				gpu_drawtext(254, 220,(math.floor(math.floor(Price)/1000)/1000).." M", blue)
			else
				gpu_drawtext(254, 220,math.floor(Price), blue)
			end
		end
		if COOKIE.count<1000000 and COOKIE.count>=0 then
			gpu_drawtext(5, 5,(math.floor(COOKIE.count)).."   Cookies", white)
			elseif COOKIE.count>1000000 and COOKIE.count<1000000000 then
			gpu_drawtext(5, 5,(math.floor(math.floor(COOKIE.count)/1000)/1000).." M  Cookies", white)
		end
		gpu_drawtext(5, 30,"per   sec : "..CpS, white)
		if string.len(Tm)==2 then
			gpu_drawtext(5, 204,Th..": "..Tm, blue)
			else
			gpu_drawtext(5, 204,Th..": 0"..Tm, blue)
		end
		gpu_drawtext(290, 5,"STORE",white)
		screenshotmake()
		Graphics.termBlend()
		Graphics.initBlend(BOTTOM_SCREEN)
		Graphics.drawImage(0, 0, BackgroundBottom)
		Graphics.drawRotateImage(160, 120, Shine, SHINE.rot)
		Graphics.drawRotateImage(160, 120, Shine, -SHINE.rot)
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
			Abig=nil
		end
		if Controls.check(pad,KEY_DDOWN) and not Controls.check(oldpad,KEY_DDOWN) and STORE.stat<STORE.max then
			STORE.stat=STORE.stat+1
			Abig=nil
		end
		CpSCursor=0.1*CURSOR.count*CURSOR.upgrade
		CpSGrandma=GRANDMA.count*GRANDMA.upgrade
		CpSFarm=8*FARM.count*FARM.upgrade
		CpSMine=47*MINE.count*MINE.upgrade
		CpSFactory=260*FACTORY.count*FACTORY.upgrade
		CpSBank=1400*BANK.count*BANK.upgrade
		CpSTemple=7800*TEMPLE.count*TEMPLE.upgrade
		CpSWizard=44000*WIZARDTWR.count*WIZARDTWR.upgrade
		CpS=CpSCursor+CpSGrandma+CpSFarm+CpSMine+CpSFactory+CpSBank+CpSTemple+CpSWizard
		if Timer.getTime(timer)/40>=1 then
			Timer.reset(timer)
			COOKIE.count=COOKIE.count+CpS/25
			COOKIE.total=COOKIE.total+CpS/25
		end
		if Timer.getTime(GetBattery)/60000>=1 then
			Timer.reset(GetBattery)
			Th,Tm,Ts = System.getTime()
			batterylevel = System.getBatteryLife()
			if batterylevel>=4 then BatteryColor = green end
			if batterylevel>=3 and batterylevel<4 then BatteryColor = yellow end
			if batterylevel>=0 and batterylevel<3 then BatteryColor = red end
		end
		elseif state=="THEEND" then
		Graphics.initBlend(TOP_SCREEN)
		gpu_drawtext(0,0,"CONGRATULATIONS    YOU    BECAME",white)
		gpu_drawtext(0,25,"A    BILLIONAIRE",white)
		gpu_drawtext(0,50,"THANKS    FOR    PLAYING",white)
		gpu_drawtext(0,218,"PRESS    A    TO    END    GAME",white)
		if Controls.check(pad,KEY_A) and Controls.check(oldpad,KEY_A) then 
			save()
			Cookie=nil
			holdtoexit=0
			state="MENU"
		end
		Graphics.termBlend()
		elseif state=="LOADING" then
		Graphics.initBlend(TOP_SCREEN)
		Graphics.drawImage(0, 0, titlecreckeryop)
		Graphics.fillRect(0,400,0,240,Color.new(0,0,0,rota))
		screenshotmake()
		Graphics.termBlend()
		if rota>0 and rotanum==0 then
			rota=rota-5
		end
		if rota==0 and rotanum==0 then
			System.wait(2000)
			rotanum=1
		end
		if rota<255 and rotanum==1 then
			rota=rota+5
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
		cookieshowery=cookieshowery+2
		Graphics.drawImage(backx, backy, BackgroundTop1)
		Graphics.drawImage(0, cookieshowery-512, cookieshower)
		Graphics.drawImage(0, cookieshowery, cookieshower)
		if cookieshowery>512 then cookieshowery=0 end 
		Graphics.drawImage(0, 0, menugradient)
		Graphics.drawImage(0, 0, menutitle)
		gpu_drawtext(300,220,"ver: "..version,white,TOP_SCREEN)
		screenshotmake()
		Graphics.termBlend()
		
		Graphics.initBlend(BOTTOM_SCREEN)
		Graphics.drawImage(backx, backy, BackgroundTop1)
		Graphics.drawImage(-40, cookieshowery-512-275, cookieshower)
		Graphics.drawImage(-40, cookieshowery-275, cookieshower)
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
			COOKIE = {size=1,count=0,total=0,tableone={},tabletwo={},upgrade=1,avupgrade=0}
			GRANDMA = {price = 100,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			CURSOR = {price = 15,count=0,rot=0,speed=0.008,currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			FARM = {price = 1000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			MINE = {price = 12000,count=0,random={},currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			FACTORY = {price = 130000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			BANK = {price = 1400000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			TEMPLE = {price = 20000000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			WIZARDTWR = {price = 330000000,count=0,currency = -1,name="???",tableone={},tabletwo={},upgrade=1,avupgrade=0}
			continue()
			state="GAME"
		end	
		elseif state=="OPTIONS" then
		Graphics.initBlend(TOP_SCREEN)
		cookieshowery=cookieshowery+2
		Graphics.drawImage(backx, backy, BackgroundTop1)
		Graphics.drawImage(0, cookieshowery-512, cookieshower)
		Graphics.drawImage(0, cookieshowery, cookieshower)
		if cookieshowery>512 then cookieshowery=0 end
		Graphics.drawImage(0, 0, menugradient)
		Graphics.drawImage(0, 0, controls)
		gpu_drawtext(300,220,"ver: "..version,white,TOP_SCREEN)
		screenshotmake()
		Graphics.termBlend()
		Graphics.initBlend(BOTTOM_SCREEN)
		Graphics.drawImage(backx, backy, BackgroundTop1)
		Graphics.drawImage(-40, cookieshowery-512-275, cookieshower)
		Graphics.drawImage(-40, cookieshowery-275, cookieshower)
		
		if SAVESYSTEM==0 then
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