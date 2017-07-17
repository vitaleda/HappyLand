-- MAKE BIGFOOTS FALL


function MapDispose()
	FreeTileset(0);
	Event01=nil;
	Event02=nil;
	Event03=nil;
	Event04=nil;
end

function Event01()
	-- Way back
	SetPlayerPosition(7,1);
	ChangeMap(FixString("Stuff/Maps/BigFootChamber"));
end
function Event02()
	tempPort = LoadPNG(FixString("Stuff/Portraits/SmileyFace.png"));

	for i=0,GetPartySize()-1 do
		RestorePartyMember(i);
	end

	if (Lang==1) then
		ShowMessageWithPortrait("HP and MP restored.",false,tempPort,0);
	elseif (Lang==2) then
		ShowMessageWithPortrait("HP y MP restauraron.",false,tempPort,0);
	end

	UnloadTexture(tempPort);
	tempPort=nil;
end
function Event03()
	ShowMessage("...",false);
end
function Event04()
	-- POTATOZZZZZZZZ

	BigFootPackPortrait = LoadPNG(FixString("Stuff/Portraits/BigFootPack.png"));
	BlueBigFootPortrait = LoadPNG(FixString("Stuff/Portraits/BigFootBlue.png"));
	PlayerPortrait = LoadPNG(FixString("Stuff/Portraits/Player.png"));
	PlayerAngryPortrait = LoadPNG(FixString("Stuff/Portraits/PlayerAngry.png"));
	PlayerSurprised = LoadPNG(FixString("Stuff/Portraits/PlayerSurprised.png"));
	NamelessPortrait = LoadPNG(FixString("Stuff/Portraits/AngryBasicMan.png"));
	NamelessDeadPortrait = LoadPNG(FixString("Stuff/Portraits/HurtBasicMan.png"));
	EatPortrait = LoadPNG(FixString("Stuff/Portraits/PlayerEat.png"));

	if (Lang==1) then
		ShowMessageWithPortrait("What are you doing? You can't take back the potatoes yet.",false,BigFootPackPortrait,0);
		ShowMessageWithPortrait("Why not?",false,PlayerPortrait,0);
		ShowMessageWithPortrait("You have to fight us first. That was the point of the portal.",false,BigFootPackPortrait,0);
		ShowMessageWithPortrait("What?!",false,PlayerSurprised,0);
		ShowMessageWithPortrait("I see, so you're scared.",false,BigFootPackPortrait,0);
		ShowMessageWithPortrait("No, that's not it. This is not what I signed up for! I was told that all I had to do was fight Big Foot and grab some potatoes. No more, no less. I wasn't informed that there would be more Big Foots! I was scammed!",false,PlayerPortrait,0);
		ShowMessageWithPortrait("Oh....",false,BigFootPackPortrait,0);
		questionAnswer = ShowMessageWithPortrait("Should I fight? (Yes - Level 9) (No - Level 11) (You're level " .. GetLevel(0) .. ".)",true,PlayerPortrait,0);
	elseif (Lang==2) then
		ShowMessageWithPortrait("'?Qu'e est'as haciendo? No puedes tomar las papas.",false,BigFootPackPortrait,0);
		ShowMessageWithPortrait("'?Por que no?",false,PlayerPortrait,0);
		ShowMessageWithPortrait("Tienes que pelear con nosotros.",false,BigFootPackPortrait,0);
		ShowMessageWithPortrait("'!'?Qu'e?!",false,PlayerSurprised,0);
		ShowMessageWithPortrait("Yo entiendo. Eres asustado.",false,BigFootPackPortrait,0);
		ShowMessageWithPortrait('No, ' .. "'el dijo " .. '"' .. "T'u tienes que matar Pie Grande y tocar las papas!" .. '"' .. ". 'el no dijo que yo tengo que matar m'as Pies Grandes. '!Esta es una estafa!",false,PlayerPortrait,0);
		ShowMessageWithPortrait("Oh....",false,BigFootPackPortrait,0);
		questionAnswer = ShowMessageWithPortrait("'?Debo pelear? (S'i - Lv 9) (No - Lv 11) (Eres Lv " .. GetLevel(0) .. ".)",true,PlayerPortrait,0);
	end

	if (questionAnswer==true) then
		if (Lang==1) then
			ShowMessageWithPortrait("I'll still fight.",false,PlayerPortrait,0);
			ShowMessageWithPortrait("Okay, let's go!",false,BigFootPackPortrait,0);
			ShowMessageWithPortrait("I'm Blue Big Foot, I shall fight you with my blue powers!",false,BlueBigFootPortrait,0);
		elseif (Lang==2) then
			ShowMessageWithPortrait("Yo voy a pelear.",false,PlayerPortrait,0);
			ShowMessageWithPortrait("Yo soy Pie Grande Azul, yo voy a te mato con mi fuerza azula.",false,BlueBigFootPortrait,0);
			ShowMessageWithPortrait("'!Vamos, Pies Grandes!",false,BigFootPackPortrait,0);
		end
		
		-- Battle
			InlineEnemy0Member = Malloc(true,2);
			InlineEnemy0Stats = GetPartyMemberStats(InlineEnemy0Member);
			-- IMPORTANT LINE
			SetStats(InlineEnemy0Stats,987,60,255,44,30,99,38,30,70);
			
			InlineEnemy0Idle = Malloc(true,0);
			InlineEnemy0Attack = Malloc(true,0);
			SetAnimation(InlineEnemy0Idle,10,100,100,4,true,0,0,LoadPNG(FixString("Stuff/Enemies/BlueBigFoot.png")));
			SetAnimation(InlineEnemy0Attack,8,100,100,4,true,0,0,LoadPNG(FixString("Stuff/Enemies/BlueBigFootAttack.png")));

			InlineEnemy1Member = Malloc(true,2);
			InlineEnemy1Stats = GetPartyMemberStats(InlineEnemy1Member);
			-- IMPORTRANT LINE
			SetStats(InlineEnemy1Stats,987,16,255,28,30,0,50,30,30);
			
			InlineEnemy1Idle = Malloc(true,0);
			InlineEnemy1Attack = Malloc(true,0);
			SetAnimation(InlineEnemy1Idle,10,100,100,8,false,0,0,LoadPNG(FixString("Stuff/Enemies/BigFoot.png")));
			SetAnimation(InlineEnemy1Attack,15,79,78,3,false,0,0,LoadPNG(FixString("Stuff/Enemies/BigFootAttack.png")));

			didWin = StartSpecificBattle(4,InlineEnemy0Member,InlineEnemy0Idle,InlineEnemy0Attack, InlineEnemy1Member, InlineEnemy1Idle, InlineEnemy1Attack, InlineEnemy1Member, InlineEnemy1Idle, InlineEnemy1Attack, InlineEnemy1Member, InlineEnemy1Idle, InlineEnemy1Attack);
			
			FreeAnimationImage(InlineEnemy0Idle);
			FreeAnimationImage(InlineEnemy0Attack);
			Free(InlineEnemy0Idle);
			Free(InlineEnemy0Attack);
			Free(InlineEnemy0Member);
			FreeAnimationImage(InlineEnemy1Idle);
			FreeAnimationImage(InlineEnemy1Attack);
			Free(InlineEnemy1Idle);
			Free(InlineEnemy1Attack);
			Free(InlineEnemy1Member);
			
			InlineEnemy0Member=nil;
			InlineEnemy0Stats=nil;
			InlineEnemy0Idle = nil;
			InlineEnemy0Attack = nil;
			InlineEnemy1Member=nil;
			InlineEnemy1Stats=nil;
			InlineEnemy1Idle = nil;
			InlineEnemy1Attack = nil;
		if (didWin==true) then
			if (Lang==1) then
				ShowMessageWithPortrait("Ouch.",false,BigFootPackPortrait,0);
				ShowMessageWithPortrait("Yes, I am, the WinnerMan!",false,PlayerPortrait,0);
				ShowMessageWithPortrait("Fine, take your potatoes back.",false,BigFootPackPortrait,0);
				ToBlack();
				--DebugMsg("Epiloguge");
				ShowMessageWithPortrait("Nathan ate the potatoes as a snack on the way back.",false,EatPortrait,0);
				ShowMessage("The End. [Easy End]",false)
				ThanksForPlaying();
			elseif (Lang==2) then
				ShowMessageWithPortrait("'!Ay!",false,BigFootPackPortrait,0);
				ShowMessageWithPortrait("S'i, yo soy el Gan'oHomebre.",false,PlayerPortrait,0);
				ShowMessageWithPortrait("Bueno. '!Toma tu papas!",false,BigFootPackPortrait,0);
				--DebugMsg("Epiloguge");
				ToBlack();
				ShowMessageWithPortrait("Cuando Nathan est'a yendo a su casa, 'el comi'o las papas.",false,EatPortrait,0);
				ShowMessage("Fin. [Fin F'acil]",false);
				ThanksForPlaying();
			end
		else
			if (Lang==1) then
					ShowMessageWithPortrait("Hahahaha! I'm more blue than you!",false,BlueBigFootPortrait,0);
			elseif (Lang==2) then
				ShowMessageWithPortrait("'!Jajajaja! '!You soy m'as azul que t'u!",false,BlueBigFootPortrait,0);
			end
		end

	elseif (questionAnswer==false) then
		-- He wants to fight as to not end his streak of morons falling for his scams.
		if (Lang==1) then
			ShowMessageWithPortrait("No, you must fight the Big Foots!",false,NamelessPortrait,0);
			ShowMessageWithPortrait("Why do you care?",false,PlayerPortrait,0);
			ShowMessageWithPortrait("Because every person I've scammed so far has fallen for the scam. I don't want to end my streak now!",false,NamelessPortrait,0);
			ShowMessageWithPortrait("I'll never abide to your demands, scammer!",false,PlayerAngryPortrait,0);
		elseif (Lang==2) then
			ShowMessageWithPortrait("'!No, tienes que matar los Pies Grandes!",false,NamelessPortrait,0);
			ShowMessageWithPortrait("'?Por qu'e te importa?",false,PlayerPortrait,0);
			ShowMessageWithPortrait("Porque todas las personas que yo trato de estafar perd'ian. Ellos siempre hac'ian mas trabajo.",false,NamelessPortrait,0);
			ShowMessageWithPortrait("'!Yo no voy a acatar, eres un estafador!",false,PlayerAngryPortrait,0);
		end
		-- NAMELESS MAN FIGHT
		InlineEnemy0Member = Malloc(true,2);
		InlineEnemy0Stats = GetPartyMemberStats(InlineEnemy0Member);
		-- IMPORTANT LINE
		-- 100 ATTACK!
		SetStats(InlineEnemy0Stats,987,80,255,100,42,99,59,36,721);
		
		InlineEnemy0Idle = Malloc(true,0);
		InlineEnemy0Attack = Malloc(true,0);
		SetAnimation(InlineEnemy0Idle,15,50,50,4,true,0,0,LoadPNG(FixString("Stuff/Enemies/Nameless.png")));
		SetAnimation(InlineEnemy0Attack,7,50,50,3,true,0,0,LoadPNG(FixString("Stuff/Enemies/NamelessAttack.png")));

		didWin = StartSpecificBattle(1,InlineEnemy0Member,InlineEnemy0Idle,InlineEnemy0Attack);
		
		FreeAnimationImage(InlineEnemy0Idle);
		FreeAnimationImage(InlineEnemy0Attack);
		Free(InlineEnemy0Idle);
		Free(InlineEnemy0Attack);
		Free(InlineEnemy0Member);
		
		InlineEnemy0Member=nil;
		InlineEnemy0Stats=nil;
		InlineEnemy0Idle = nil;
		InlineEnemy0Attack = nil;

		if (didWin==true) then
			if (Lang==1) then
				ShowMessageWithPortrait("No0o0o00oOOoo0o0oo! You win this round. I shall now retreat to my hidden fortress.",false,NamelessDeadPortrait,0);
				ToBlack();
				ShowMessage("Nathan was happy that he wasn't scammed. He returned to his house and slept for the rest of his life because the world was at peace.",false);
				ThanksForPlaying();
			elseif (Lang==2) then
				ShowMessageWithPortrait("'!No0o0o00oOOoo0o0oo! T'u ganate. Yo voy a ir a mi fortaleza castillo.",false,NamelessDeadPortrait,0);
				ToBlack();
				ShowMessage("Nathan era feliz porque 'el no se estaf'o . 'el fu'i a su casa y dorm'i por el resto de su vida porque el mundo era tranquilo.",false);
				ShowMessage("The End. [Harder End]",false);
				ThanksForPlaying();
			end
		elseif (didWin==false) then
			if (Lang==1) then
					ShowMessageWithPortrait("Hahahaha! I have less names than you!",false,NamelessPortrait,0);
			elseif (Lang==2) then
				ShowMessageWithPortrait("'!Jajajaja! '!You tengo menos nombres que t'u!",false,NamelessPortrait,0);
				ShowMessage("Fin. [Fin F'acil]",false);
			end
		end

	end

	UnloadTexture(BigFootPackPortrait); 
	UnloadTexture(PlayerPortrait);
	UnloadTexture(PlayerAngryPortrait); 
	UnloadTexture(PlayerSurprised);
	UnloadTexture(NamelessPortrait);
	UnloadTexture(BlueBigFootPortrait);
	UnloadTexture(EatPortrait);

	BigFootPackPortrait=nil;
	PlayerPortrait=nil;
	PlayerAngryPortrait=nil;
	PlayerSurprised=nil;
	NamelessPortrait=nil;
	BlueBigFootPortrait=nil;
	EatPortrait=nil;
end


tileset0=LoadPNG(FixString("Stuff/Tilesets/BigFootLand.png"));
SetTileset(tileset0,0);
tileset0=nil;