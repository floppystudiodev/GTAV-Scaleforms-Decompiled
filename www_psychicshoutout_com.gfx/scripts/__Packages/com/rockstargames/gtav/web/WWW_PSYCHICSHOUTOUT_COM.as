class com.rockstargames.gtav.web.WWW_PSYCHICSHOUTOUT_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var chatButtonIndex;
   var chatButtonActiveString;
   var chatButtonUnavailableString;
   var chatButtonThinkingString;
   var people;
   var chatMichael1;
   var chatMichael2;
   var chatMichael3;
   var chatFranklin1;
   var chatFranklin2;
   var chatFranklin3;
   var chatTrevor1;
   var chatTrevor2;
   var chatTrevor3;
   var allChats;
   var chatHolder;
   var mcScope;
   var currentChat;
   var chatCharacter;
   var chatNumber;
   var currentLine;
   var maxChatNumber;
   var CONTENT;
   var dataTextScope;
   var browserPlayers = ["michael","multiplayer","franklin","trevor"];
   function WWW_PSYCHICSHOUTOUT_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "ENLIGHTEN";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function setupChats()
   {
      this.chatButtonIndex = 1;
      this.chatButtonActiveString = "CLICK HERE TO SEND YOUR THOUGHTS";
      this.chatButtonUnavailableString = "SERVICE UNAVAILABLE. PLEASE TRY AGAIN LATER";
      this.chatButtonThinkingString = " IS THINKING...";
      this.people = new Array();
      this.people[0] = "Michael";
      this.people[1] = "Trevor";
      this.people[2] = "Franklin";
      this.people[3] = "Miss Marcy";
      this.people[4] = "Ms Tammy";
      this.chatMichael1 = new Array();
      this.chatMichael1.push({user:this.people[4],userText:"Hello Michael - I\'m Ms Tammy"});
      this.chatMichael1.push({user:this.people[0],userText:"How did you know my name?"});
      this.chatMichael1.push({user:this.people[4],userText:"Oh? I\'m psychic, remember?"});
      this.chatMichael1.push({user:this.people[0],userText:"Oh, yeah."});
      this.chatMichael1.push({user:this.people[4],userText:"What can I help you with today?  I\'m a fantastic relationship psychic"});
      this.chatMichael1.push({user:this.people[0],userText:"My relationship is just fine"});
      this.chatMichael1.push({user:this.people[4],userText:"I see a big house. And a garden. The sprits are telling me to go into the bedroom."});
      this.chatMichael1.push({user:this.people[0],userText:"The spirits normally tell me to pass out on the sofa."});
      this.chatMichael1.push({user:this.people[4],userText:"The bedroom is very crowded."});
      this.chatMichael1.push({user:this.people[0],userText:"The decorator told me it was maximal minimalism."});
      this.chatMichael1.push({user:this.people[4],userText:"I see a yoga mat, and a tennis racket."});
      this.chatMichael1.push({user:this.people[0],userText:"We\'re a sporty family."});
      this.chatMichael1.push({user:this.people[4],userText:"They don\'t belong to you."});
      this.chatMichael1.push({user:this.people[0],userText:"?"});
      this.chatMichael1.push({user:this.people[4],userText:"There\'s a fireman\'s hat, and a plumber\'s wrench."});
      this.chatMichael1.push({user:this.people[0],userText:"give it a rest, okay."});
      this.chatMichael1.push({user:this.people[4],userText:"a lifeguard\'s float, a trucker\'s 60oz flask, a trash collector\'s pair of gloves"});
      this.chatMichael1.push({user:this.people[0],userText:"what are you saying?"});
      this.chatMichael1.push({user:this.people[4],userText:"a gardener\'s trowl, a hipster\'s moustache"});
      this.chatMichael1.push({user:this.people[0],userText:"What the hell are you implying here?"});
      this.chatMichael1.push({user:this.people[4],userText:"I\'m not implying anything.  The spirits on the other hand imply a lot"});
      this.chatMichael1.push({user:this.people[0],userText:"the spirits are telling me you\'re an asshole, alright. Now, fuck off."});
      this.chatMichael1.push({user:this.people[4],userText:"you came to us, Michael. We\'re not going to tell you what you want to hear."});
      this.chatMichael1.push({user:this.people[0],userText:"I thought you\'d tell me something I didn\'t already know, you ass. Goodbye."});
      this.chatMichael1.push({user:this.people[0],userText:"We had an open relationship BTW "});
      this.chatMichael1.push({user:this.people[0],userText:"She\'s her own woman."});
      this.chatMichael1.push({user:this.people[0],userText:"I\'m happy for her"});
      this.chatMichael1.push({user:this.people[0],userText:"And I cheated too unless you can\'t tell"});
      this.chatMichael1.push({user:this.people[0],userText:"like a lot"});
      this.chatMichael1.push({user:this.people[0],userText:"so we\'re even"});
      this.chatMichael1.push({user:this.people[0],userText:"scumbag"});
      this.chatMichael2 = new Array();
      this.chatMichael2.push({user:this.people[4],userText:"So you\'re back"});
      this.chatMichael2.push({user:this.people[0],userText:"I guess so"});
      this.chatMichael2.push({user:this.people[4],userText:"Have you been having fun?"});
      this.chatMichael2.push({user:this.people[0],userText:"don\'t you know?"});
      this.chatMichael2.push({user:this.people[4],userText:"Ha ha. Very funny. Of course I know. You\'re in a world of pain and suffering you cannot quite articulate"});
      this.chatMichael2.push({user:this.people[0],userText:"wait..."});
      this.chatMichael2.push({user:this.people[4],userText:"hiding away, worrying about death, completely self absorbed..."});
      this.chatMichael2.push({user:this.people[0],userText:"hold on"});
      this.chatMichael2.push({user:this.people[4],userText:"surrounded by people but lonely, a disappointment to everyone..."});
      this.chatMichael2.push({user:this.people[0],userText:"not everyone"});
      this.chatMichael2.push({user:this.people[4],userText:"sexually very confused, worrying about aging too fast"});
      this.chatMichael2.push({user:this.people[0],userText:"no"});
      this.chatMichael2.push({user:this.people[4],userText:"struggling with drink and nicotine, an expanding waist line"});
      this.chatMichael2.push({user:this.people[0],userText:"not at all"});
      this.chatMichael2.push({user:this.people[4],userText:"your best years behind you, now it\'s only a question of how long?"});
      this.chatMichael2.push({user:this.people[0],userText:"it\'s not like that, it\'s not like that"});
      this.chatMichael2.push({user:this.people[0],userText:"fuck you. I\'m happy. "});
      this.chatMichael2.push({user:this.people[0],userText:"I\'m really fucking happy. "});
      this.chatMichael3 = new Array();
      this.chatMichael3.push({user:this.people[4],userText:"Oh not you again. Please. We don\'t have time for you. All you do is whine."});
      this.chatFranklin1 = new Array();
      this.chatFranklin1.push({user:this.people[3],userText:"Hello I am Miss Marcy. Would you like me to read your horoscope? Or maybe numerology. I see the number 64. That\'s the square root of 8. Does 8 mean anything to you?"});
      this.chatFranklin1.push({user:this.people[2],userText:"Listen - type fast lady - I don\'t wanna be ripped off. I need a psychic reading"});
      this.chatFranklin1.push({user:this.people[3],userText:"Hmm. Something is brewing... yes..  a love. Long lost love"});
      this.chatFranklin1.push({user:this.people[2],userText:"Love?"});
      this.chatFranklin1.push({user:this.people[3],userText:"yes, with a family member"});
      this.chatFranklin1.push({user:this.people[2],userText:"What? You sick woman."});
      this.chatFranklin1.push({user:this.people[3],userText:"No, not with you - with a friend. A close friend of yours. They\'re in bed - oh it\'s beautiful"});
      this.chatFranklin1.push({user:this.people[2],userText:"what\'s this friend\'s name?"});
      this.chatFranklin1.push({user:this.people[3],userText:"I see a... I see a..."});
      this.chatFranklin1.push({user:this.people[2],userText:"T?"});
      this.chatFranklin1.push({user:this.people[3],userText:"Hmmmm."});
      this.chatFranklin1.push({user:this.people[2],userText:"coz theres this girl called Tanisha I grew up with. She\'s with some other dude now. But I always like thought maybe like one day like we\'d..."});
      this.chatFranklin1.push({user:this.people[3],userText:"No, I don\'t think that\'s what is coming thru"});
      this.chatFranklin1.push({user:this.people[2],userText:"u 4 real? If it\'s an old friend I\'m goin\' hook up wit its fucking Tanisha"});
      this.chatFranklin1.push({user:this.people[3],userText:"I\'m reading a more masculine energy"});
      this.chatFranklin1.push({user:this.people[2],userText:"don\'t be ridiculous"});
      this.chatFranklin1.push({user:this.people[3],userText:"P or L or J..."});
      this.chatFranklin1.push({user:this.people[2],userText:"Not L, please not L"});
      this.chatFranklin1.push({user:this.people[3],userText:"exactly L - with someone you know... in your house."});
      this.chatFranklin1.push({user:this.people[2],userText:"Not Lamar"});
      this.chatFranklin1.push({user:this.people[3],userText:"exactly! That\'s it... in your house. Where you grew up. In your bed. All the time."});
      this.chatFranklin1.push({user:this.people[2],userText:"girl fuck you seriously fuck you"});
      this.chatFranklin1.push({user:this.people[3],userText:"so I\'m way off mark?"});
      this.chatFranklin2 = new Array();
      this.chatFranklin2.push({user:this.people[3],userText:"Oh, you\'re back"});
      this.chatFranklin2.push({user:this.people[2],userText:"I guess so"});
      this.chatFranklin2.push({user:this.people[3],userText:"what seems to be the problem?"});
      this.chatFranklin2.push({user:this.people[2],userText:"you tell me"});
      this.chatFranklin2.push({user:this.people[3],userText:"You gave up a lot to achieve a lot and was it worth it?"});
      this.chatFranklin2.push({user:this.people[2],userText:"well kind of"});
      this.chatFranklin2.push({user:this.people[3],userText:"you let people down, you got real selfish, you alienated yourself, you sacrificed principles you held dear..."});
      this.chatFranklin2.push({user:this.people[2],userText:"not exactly"});
      this.chatFranklin2.push({user:this.people[3],userText:"you pursued success at whatever the cost, you got obsessed by winning, you let everyone you know down..."});
      this.chatFranklin2.push({user:this.people[2],userText:"no!"});
      this.chatFranklin2.push({user:this.people[3],userText:"you became a selfish ass, and now you\'re successful and lonely and you\'re asking was it worth it? "});
      this.chatFranklin2.push({user:this.people[2],userText:"leave me alone."});
      this.chatFranklin3 = new Array();
      this.chatFranklin3.push({user:this.people[3],userText:"leave us alone please. we don\'t want to get too close. We know what you do to people you get close to"});
      this.chatTrevor1 = new Array();
      this.chatTrevor1.push({user:this.people[1],userText:"So... if your physic, tell me what I\'m holding in my hand."});
      this.chatTrevor1.push({user:this.people[3],userText:"It\'s something special to you"});
      this.chatTrevor1.push({user:this.people[1],userText:"Ok."});
      this.chatTrevor1.push({user:this.people[3],userText:"But small. Compact. Well worn. Maybe frayed with over use"});
      this.chatTrevor1.push({user:this.people[1],userText:"That\'s one way of putting it. Think long and hard."});
      this.chatTrevor1.push({user:this.people[3],userText:"Oh this old gag. It\'s it your penis, isn\'t it?"});
      this.chatTrevor1.push({user:this.people[1],userText:"Hey. Shit. Whoa. You\'re good.  "});
      this.chatTrevor1.push({user:this.people[3],userText:"If you want sexy chat, you should try our sister site. This kind of juvenile nonsense is a waste of my time. I\'m a thousand years old."});
      this.chatTrevor1.push({user:this.people[1],userText:"Alright miss mind melt, what I got now? Eh? Eh?"});
      this.chatTrevor1.push({user:this.people[3],userText:"This is how you speak with strangers? Chatting with one hand? I bet your mother is so proud."});
      this.chatTrevor1.push({user:this.people[1],userText:"What do you know about my mother? Is she coming through to you?"});
      this.chatTrevor1.push({user:this.people[3],userText:"No, I mean, it\'s a figure of..."});
      this.chatTrevor1.push({user:this.people[1],userText:"What do you know about my mother? Is she coming through to you?"});
      this.chatTrevor1.push({user:this.people[3],userText:"No, I mean, it\'s a figure of..."});
      this.chatTrevor1.push({user:this.people[1],userText:"Tell me what you know about my mother!!>!?!?>!?1 Has she passed over?"});
      this.chatTrevor1.push({user:this.people[3],userText:"I\'m not seeing anything... your mother... I"});
      this.chatTrevor1.push({user:this.people[1],userText:"You\'ll be communicating with the dead when I\'m done with you. You\'ll be in close communifuckingcation you hear me?!?!?!?  You hear ,me??! ]2qmnsdfjhwetujh1)o alksfjgdlkh where are you? Leave my mother alone!!!"});
      this.chatTrevor1.push({user:this.people[3],userText:"(Miss Marcy has ended the chat)"});
      this.chatTrevor2 = new Array();
      this.chatTrevor2.push({user:this.people[3],userText:"You go away right now or we will call the police"});
      this.chatTrevor3 = new Array();
      this.chatTrevor3.push({user:this.people[3],userText:"we warned you"});
      this.allChats = {michael_1:this.chatMichael1,michael_2:this.chatMichael2,michael_3:this.chatMichael3,franklin_1:this.chatFranklin1,franklin_2:this.chatFranklin2,franklin_3:this.chatFranklin3,trevor_1:this.chatTrevor1,trevor_2:this.chatTrevor2,trevor_3:this.chatTrevor3};
   }
   function doSetup()
   {
      if(!this.people)
      {
         this.setupChats();
      }
      this.chatHolder = this.mcScope.createEmptyMovieClip("chatHolder",this.mcScope.getNextHighestDepth());
      this.chatHolder._x = this.mcScope.chatmask._x;
      this.chatHolder._y = this.mcScope.chatmask._y + this.mcScope.chatmask._height;
      this.chatHolder.setMask(this.mcScope.chatmask);
      this.currentChat = this.allChats[this.chatCharacter + "_" + this.chatNumber];
      this.currentLine = 0;
   }
   function writeLine()
   {
      if(this.currentLine < this.currentChat.length)
      {
         var _loc4_ = this.currentChat[this.currentLine];
         var _loc3_ = _loc4_.user;
         var _loc7_ = _loc4_.userText;
         var _loc11_ = this.mcScope.testText;
         var _loc5_ = "playerchat";
         var _loc6_ = 0;
         if(_loc3_ != "Michael" && _loc3_ != "Franklin" && _loc3_ != "Trevor")
         {
            _loc5_ = "psychicchat";
            _loc6_ = 2;
         }
         var _loc2_ = this.chatHolder.attachMovie(_loc5_,"chat_" + this.currentLine,this.chatHolder.getNextHighestDepth());
         _loc2_._y = (_loc2_._height + 10) * this.currentLine;
         _loc2_.user.text = _loc3_;
         _loc2_.userText.text = _loc7_;
         var _loc8_ = this.mcScope.chatmask._y + this.mcScope.chatmask._height - (this.currentLine + 1) * (_loc2_._height + 10);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.chatHolder,0.5,{_y:_loc8_,ease:3,onComplete:this.writeNextLine,onCompleteScope:this,delay:_loc6_});
         this.currentLine = this.currentLine + 1;
      }
      else
      {
         this.updateChatButton(this.chatButtonUnavailableString,false);
         var _loc9_ = this.chatNumber + 1;
         this.setChatNumber(_loc9_);
      }
   }
   function updateChatButton(buttonText, active)
   {
      if(active)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.chatButton,153,0,255,100);
         this.browser.DISABLE_BUTTON(this.chatButtonIndex,false);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.mcScope.chatButton,153,0,255,30);
         this.browser.DISABLE_BUTTON(this.chatButtonIndex,true);
      }
      this.mcScope.chatButton.text = buttonText;
      this.mcScope.chat_send._alpha = 1;
   }
   function writeNextLine()
   {
      var _loc3_ = this.currentChat[this.currentLine];
      var _loc2_ = _loc3_.user;
      if(this.currentLine < this.currentChat.length)
      {
         if(_loc2_ != "Michael" && _loc2_ != "Franklin" && _loc2_ != "Trevor")
         {
            this.writeLine();
            this.updateChatButton(_loc2_ + this.chatButtonThinkingString,false);
         }
         else
         {
            this.updateChatButton(this.chatButtonActiveString,true);
         }
      }
      else
      {
         this.updateChatButton(this.chatButtonUnavailableString,false);
         var _loc4_ = this.chatNumber + 1;
         this.setChatNumber(_loc4_);
      }
   }
   function setChatCharacter(char)
   {
      this.chatCharacter = char;
   }
   function setChatNumber(num)
   {
      if(!this.maxChatNumber)
      {
         this.maxChatNumber = 3;
      }
      if(num < this.maxChatNumber)
      {
         this.chatNumber = num;
      }
      else
      {
         this.chatNumber = this.maxChatNumber;
      }
   }
   function goToAnchor(AnchorLink)
   {
      var _loc2_ = new Array();
      _loc2_ = AnchorLink.split("_");
      var _loc0_ = null;
      if((_loc0_ = _loc2_[0]) === "chat")
      {
         this.writeLine();
      }
   }
   function POPULATE_TEXT(pageName)
   {
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            this.CONTENT.BOUNDING_BOX._height = 1256;
            break;
         case "ENLIGHTEN":
            this.mcScope = this.CONTENT.ENLIGHTEN;
            this.CONTENT.BOUNDING_BOX._height = 1256;
            if(!this.chatCharacter)
            {
               this.setChatCharacter(this.browserPlayers[this.browser.player]);
            }
            if(!this.chatNumber)
            {
               this.setChatNumber(1);
            }
            this.doSetup();
            this.writeNextLine();
      }
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               var _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
}
