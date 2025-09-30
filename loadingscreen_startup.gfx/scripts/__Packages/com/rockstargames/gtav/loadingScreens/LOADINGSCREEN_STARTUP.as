class com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
   var CONTENT;
   var DispConf;
   var GTAV_LOGO;
   var LEGALROCKSTAR;
   var LEGALSCREEN;
   var LOADING_BUTTONS;
   var PROGRESS_BAR;
   var PROGRESS_TEXT;
   var TIMELINE;
   var activeLoadingScreen;
   var activeLoadingScreenObject;
   var animationDoneName;
   var bgOverlay;
   var currentScreenIndex;
   var deleteLoadingScreen;
   var deleteLoadingScreenObject;
   var gfxName;
   var intervalId;
   var legalOverlay;
   var loadingNewsScreenMCs;
   var loadingScreenHolder;
   var loadingScreenOrder;
   var ml;
   var mlListener;
   var overlay;
   var previousScreenIndex;
   static var CTX_BLANK = 0;
   static var CTX_LEGAL = 1;
   static var CTX_INSTALL = 2;
   static var CTX_GAMELOAD = 3;
   static var CTX_GAMELOAD_NEWS = 4;
   static var CTX_PC_LANDING = 5;
   var eCurrentContext = com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_BLANK;
   var txdIndex = 0;
   var prevTxdIndex = 0;
   var timerDuration = 14;
   var isAmerican = false;
   var nextScreenReady = false;
   var animationDone = false;
   var loadingScreens = [];
   var loadingScreenEmptyMcs = [];
   var loadingScreenMcs = [];
   var loadScreensArePlaying = false;
   var altTransition = -1;
   var doOverlayFade = false;
   var loadingNewsScreenCharIndex = 0;
   var activeLoadingNewsScreen = 0;
   var screenWidth = 1280;
   var screenHeight = 720;
   var safeTop = 29;
   var safeBottom = 29;
   var safeLeft = 51;
   var safeRight = 51;
   var isWideScreen = true;
   var isHiDef = true;
   var tweenDuration = 0.85;
   var landingBGColours = [com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FRANKLIN,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_MICHAEL,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_TREVOR];
   var loadSequenceSwitched = false;
   var loadingScreenOrderCache = new Array();
   function LOADINGSCREEN_STARTUP()
   {
      super();
      _global.gfxExtensions = true;
      this.gfxName = "LOADINGSCREEN_STARTUP";
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.TIMELINE = mc;
      this.TIMELINE.isAmerican = false;
      this.getIsAmericanBuild();
      this.loadingScreens.push({txd:"loadingscreen_builtin0",isInFla:true,layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("MCBackgroundBeachGirl",{_width:1024,_height:512,_x:98,_y:95,_yrotation:20},{_yrotation:-6,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("MCCharacterBeachGirl",{_width:343,_height:629,_x:480,_y:95},{_x:680})]});
      this.loadingScreens.push({txd:"loadingscreen1",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-12}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:503,_height:206,_x:300,_y:465},{_x:480}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground_franklin",{_width:368,_height:588,_x:440,_y:140},{_x:640})]});
      this.loadingScreens.push({txd:"loadingscreen5",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:7},{_yrotation:-6}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:389,_height:640,_x:450,_y:95},{_x:570})]});
      this.loadingScreens.push({txd:"loadingscreen9",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:7},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:331,_height:675,_x:220,_y:50},{_x:140})]});
      this.loadingScreens.push({txd:"loadingscreen12",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-4}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground_michael",{_width:462,_height:677,_x:345,_y:42},{_x:220})]});
      this.loadingScreens.push({txd:"loadingscreen16",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:300,_height:600,_x:300,_y:150},{_x:400})]});
      this.loadingScreens.push({txd:"loadingscreen17",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:430,_height:659.5,_x:300,_y:60},{_x:400})]});
      this.loadingScreens.push({txd:"loadingscreen18",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:364.5,_height:690,_x:250,_y:40},{_x:350})]});
      this.loadingScreens.push({txd:"loadingscreen19",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:379,_height:693.5,_x:300,_y:45},{_x:400})]});
      this.loadingScreens.push({txd:"loadingscreen20",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:409.5,_height:655.5,_x:250,_y:70},{_x:350})]});
      this.loadingScreens.push({txd:"loadingscreen21",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:417.5,_height:692,_x:300,_y:60},{_x:400})]});
      this.loadingScreens.push({txd:"loadingscreen22",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:466.5,_height:684,_x:220,_y:100},{_x:320})]});
      this.loadingScreens.push({txd:"loadingscreen23",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:1075,_height:719,_x:50,_y:50},{_x:150})]});
      this.loadingScreens.push({txd:"loadingscreen24",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:485.5,_height:664.5,_x:250,_y:100},{_x:350})]});
      this.loadingScreens.push({txd:"loadingscreen25",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:689.5,_height:688.5,_x:250,_y:80},{_x:350})]});
      this.loadingScreens.push({txd:"loadingscreen26",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:110,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:448,_height:671.5,_x:150,_y:50},{_x:250})]});
      this.loadingScreens.push({txd:"loadingscreen27",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:767.5,_height:675,_x:250,_y:100},{_x:350})]});
      this.loadingScreens.push({txd:"loadingscreen28",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:883.5,_height:681.5,_x:140,_y:80},{_x:240})]});
      this.loadingScreens.push({txd:"loadingscreen29",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:374,_height:654,_x:170,_y:70},{_x:270})]});
      this.loadingScreens.push({txd:"loadingscreen30",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:409.5,_height:647,_x:365,_y:75},{_x:465})]});
      this.loadingScreens.push({txd:"loadingscreen31",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:374,_height:647,_x:600,_y:75},{_x:700})]});
      this.loadingScreens.push({txd:"loadingscreen32",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:1203,_height:648,_x:10,_y:25},{_x:110})]});
      this.loadingScreens.push({txd:"loadingscreen33",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:386,_height:660.5,_x:790,_y:60},{_x:690})]});
      this.loadingScreens.push({txd:"loadingscreen34",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:335.5,_height:662.5,_x:350,_y:70},{_x:250})]});
      this.loadingScreens.push({txd:"loadingscreen35",layers:[new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("background",{_width:1024,_height:512,_x:98,_y:95,_yrotation:6},{_yrotation:-3,_xrotation:5}),new com.rockstargames.gtav.loadingScreens.LoadingScreenLayer("foreground",{_width:412,_height:669.5,_x:380,_y:60},{_x:480})]});
      this.SET_SCREEN_ORDER(true);
      this.switchLoadSequence();
      this.SET_NEWS_SCREEN_ORDER(true);
      this.loadingScreenHolder = this.CONTENT.createEmptyMovieClip("loadingScreenHolder",this.CONTENT.getNextHighestDepth());
      this.loadingScreenHolder.setMask(this.CONTENT.contentMaskMC);
   }
   function SET_SCREEN_ORDER(isSingleplayer)
   {
      var _loc2_ = [];
      var _loc4_;
      var _loc3_;
      if(isSingleplayer)
      {
         _loc4_ = this.randRange(0,5);
         switch(_loc4_)
         {
            case 0:
            default:
               _loc2_ = new Array(0,1,10,2,8,7,6,4,12,3,5,11);
               break;
            case 1:
               _loc2_ = new Array(0,1,4,5,7,2,12,8,11,3,6,10);
               break;
            case 2:
               _loc2_ = new Array(0,2,12,11,5,8,1,6,7,3,10,4);
               break;
            case 3:
               _loc2_ = new Array(0,4,7,11,3,12,5,6,10,2,1,8);
               break;
            case 4:
               _loc2_ = new Array(0,3,10,5,12,7,11,1,8,6,4,2);
               break;
            case 5:
               _loc2_ = new Array(0,6,1,11,8,7,2,10,4,5,3,12);
         }
      }
      else
      {
         _loc3_ = this.randRange(0,2);
         switch(_loc3_)
         {
            case 0:
            default:
               _loc2_ = new Array(0,19,20,21,22,23,24,13,14,15,16,17,18);
               break;
            case 1:
               _loc2_ = new Array(0,24,23,22,21,20,19,18,17,16,15,14,13);
               break;
            case 2:
               _loc2_ = new Array(0,19,20,24,21,23,22,16,18,15,13,14,17);
         }
      }
      this.loadSequenceSwitched = true;
      this.loadingScreenOrderCache = _loc2_;
   }
   function switchLoadSequence()
   {
      if(this.loadSequenceSwitched)
      {
         this.loadingScreenOrder = this.loadingScreenOrderCache;
         this.loadSequenceSwitched = false;
      }
   }
   function SET_NEWS_SCREEN_ORDER(isSingleplayer)
   {
      com.rockstargames.ui.utils.Debug.log("SET_NEWS_SCREEN_ORDER " + isSingleplayer);
      this.loadingNewsScreenCharIndex = this.randRange(0,2);
      if(isSingleplayer)
      {
         switch(this.loadingNewsScreenCharIndex)
         {
            case 0:
               this.loadingNewsScreenMCs = [9,7,6,8,10,11,12,16,14,15,17];
               return;
            case 1:
               this.loadingNewsScreenMCs = [14,12,16,15,9,11,10,7,8,17,6];
               return;
            case 2:
            default:
               this.loadingNewsScreenMCs = [17,8,6,9,7,10,11,12,14,15,16];
               return;
         }
      }
      else
      {
         switch(this.loadingNewsScreenCharIndex)
         {
            case 0:
               this.loadingNewsScreenMCs = [20,19,18,3];
               return;
            case 1:
               this.loadingNewsScreenMCs = [18,19,20,4];
               return;
            default:
               this.loadingNewsScreenMCs = [19,20,18,5];
               return;
         }
      }
   }
   function debug(id)
   {
      if(id == undefined)
      {
         this.SET_CONTEXT(com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_GAMELOAD);
      }
      else
      {
         this.SET_CONTEXT(id);
      }
      this.SET_DISPLAY_CONFIG(this.screenWidth,this.screenHeight,0.055,0.945,0.055,0.945,true);
      this.TOGGLE_MOUSE_BUTTONS(false);
      this.CLEAR_ALL();
      this.SET_DATA_SLOT(0,"b_1003","Select");
      this.SET_DATA_SLOT(1,"b_50","Back");
      this.SET_DATA_SLOT(2,"b_1002","Hide Menu");
      this.SET_DATA_SLOT(3,"t_E%t_Q","Browse");
      this.DRAW_INSTRUCTIONAL_BUTTONS(0);
      this.SET_SAVING_TEXT(5,"Loading");
   }
   function randRange(min, max)
   {
      return Math.floor(Math.random() * (max - min + 1)) + min;
   }
   function SET_DISPLAY_CONFIG(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent, _isWideScreen, _isHiDef)
   {
      this.isWideScreen = _isWideScreen;
      this.isHiDef = _isHiDef;
      if(this.isWideScreen == false)
      {
         _screenWidthPixels = 960;
         _screenHeightPixels = 720;
         Stage.scaleMode = "noBorder";
         this.safeLeft = 160 + Math.round(_safeLeftPercent * _screenWidthPixels);
         this.safeRight = Math.round((1 - _safeRightPercent) * _screenWidthPixels) - 160;
      }
      else
      {
         this.safeLeft = Math.round(_safeLeftPercent * _screenWidthPixels);
         this.safeRight = Math.round((1 - _safeRightPercent) * _screenWidthPixels);
      }
      this.safeTop = Math.round(_safeTopPercent * _screenHeightPixels);
      this.safeBottom = Math.round((1 - _safeBottomPercent) * _screenHeightPixels);
      this.screenWidth = _screenWidthPixels;
      this.screenHeight = _screenHeightPixels;
      this.initButtons();
      this.initProgressBar();
      this.updateButtonLayout();
   }
   function SET_CONTEXT(eContext)
   {
      if(this.eCurrentContext != eContext)
      {
         this.eCurrentContext = eContext;
         this.doOverlayFade = false;
         switch(eContext)
         {
            case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_LEGAL:
               this.LEGAL();
               break;
            case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_INSTALL:
               this.fadeLegals();
               this.INSTALL();
               break;
            case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_GAMELOAD:
               this.fadeLegals();
               this.SWITCH();
               break;
            case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_GAMELOAD_NEWS:
               this.doOverlayFade = true;
               this.fadeLegals();
               this.switchToStaticGameLoadingScreens();
               break;
            case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_PC_LANDING:
               this.doOverlayFade = true;
               this.fadeLegals();
               this.switchToStaticGameLoadingScreens();
            case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_BLANK:
            default:
               return;
         }
      }
   }
   function fadeLegals()
   {
      if(this.LEGALROCKSTAR || this.LEGALSCREEN)
      {
         this.legalOverlay = this.createOverlay(this.CONTENT);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.legalOverlay,1,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT,onComplete:this.removeLegals,onCompleteScope:this});
      }
   }
   function removeLegals()
   {
      if(this.LEGALROCKSTAR != undefined)
      {
         this.LEGALROCKSTAR.removeMovieClip();
      }
      if(this.LEGALSCREEN != undefined)
      {
         this.LEGALSCREEN.removeMovieClip();
      }
      this.fadeAndRemoveMovieClip(this.legalOverlay,3);
   }
   function fixJustifiedLegalText(tf, offset)
   {
      if(isNaN(offset))
      {
         offset = 0;
      }
      tf._visible = false;
      var _loc10_ = tf.text;
      var _loc8_ = _loc10_.split("<br>");
      var _loc6_ = tf._parent.createEmptyMovieClip("legalTextFields",tf._parent.getNextHighestDepth());
      _loc6_._x = tf._x;
      _loc6_._y = tf._y;
      var _loc9_ = 0;
      var _loc7_ = 24;
      var _loc4_ = 0;
      var _loc3_;
      var _loc2_;
      while(_loc4_ < _loc8_.length)
      {
         _loc3_ = new TextFormat();
         _loc3_.font = com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT;
         _loc3_.size = tf.getTextFormat().size;
         _loc3_.color = 13421772;
         _loc3_.align = "justify";
         _loc2_ = _loc6_.createTextField("tf" + _loc4_,_loc6_.getNextHighestDepth(),0,_loc9_,tf._width,_loc7_);
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.embedFonts = true;
         _loc2_.htmlText = _loc8_[_loc4_];
         _loc2_.setTextFormat(_loc3_);
         if(_loc2_.textHeight <= _loc7_)
         {
            _loc3_.align = "left";
         }
         _loc2_.autoSize = "left";
         _loc2_.setTextFormat(_loc3_);
         _loc9_ += _loc2_._height + 12;
         _loc4_ = _loc4_ + 1;
      }
      _loc6_._y = this.screenHeight / 2 - _loc6_._height / 2 - offset;
   }
   function getIsAmericanBuild()
   {
      com.rockstargames.ui.game.GameInterface.call("IS_AMERICAN_BUILD",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.TIMELINE);
   }
   function LEGAL(savingLabel, SocialClubLabel, loadingLabel, buildNumber, onlineVersionNumber)
   {
      var _loc4_ = new TextFormat();
      _loc4_.font = com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT;
      _loc4_.color = 13421772;
      if(this.LEGALSCREEN == undefined)
      {
         this.LEGALSCREEN = this.CONTENT.attachMovie("legalScreenMC","legalScreenMC",this.CONTENT.getNextHighestDepth());
      }
      if(this.LEGALROCKSTAR == undefined)
      {
         this.LEGALROCKSTAR = this.CONTENT.attachMovie("legalRockstarMC","legalRockstarMC",this.CONTENT.getNextHighestDepth());
      }
      this.LEGALROCKSTAR.LEGAL_TEXT.html = false;
      this.LEGALROCKSTAR.LEGAL_TEXT.multiline = true;
      this.LEGALROCKSTAR.LEGAL_TEXT.autoSize = true;
      var _loc5_;
      if(this.TIMELINE.isAmerican)
      {
         _loc5_ = "LEGAL_ROCKSTAR_US";
      }
      else
      {
         _loc5_ = "LEGAL_ROCKSTAR";
      }
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.LEGALROCKSTAR.LEGAL_TEXT,_loc5_,0,false);
      this.fixJustifiedLegalText(this.LEGALROCKSTAR.LEGAL_TEXT);
      if(buildNumber == undefined)
      {
         buildNumber = "";
      }
      if(onlineVersionNumber == undefined)
      {
         onlineVersionNumber = "";
      }
      if(buildNumber != "")
      {
         buildNumber = buildNumber.charAt(0).toUpperCase() + buildNumber.substr(1) + ".";
      }
      if(onlineVersionNumber != "")
      {
         onlineVersionNumber = onlineVersionNumber.charAt(0).toUpperCase() + onlineVersionNumber.substr(1) + ".";
      }
      this.LEGALROCKSTAR.VERSION_TEXT.text = buildNumber + " " + onlineVersionNumber;
      this.LEGALROCKSTAR.VERSION_TEXT._x = this.DispConf.screenWidth * this.DispConf.safeRight - this.LEGALROCKSTAR.VERSION_TEXT._width;
      this.LEGALROCKSTAR.VERSION_TEXT._y = this.DispConf.screenHeight * this.DispConf.safeBottom - this.LEGALROCKSTAR.VERSION_TEXT._height;
      this.LEGALROCKSTAR._alpha = 0;
      this.LEGALSCREEN.loading._visible = false;
      this.LEGALSCREEN.spinner._visible = false;
      this.LEGALSCREEN.scstar._visible = false;
      this.LEGALSCREEN.LEGAL_TEXT.html = false;
      this.LEGALSCREEN.LEGAL_TEXT.multiline = true;
      this.LEGALSCREEN.LEGAL_TEXT.autoSize = true;
      com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.LEGALSCREEN.LEGAL_TEXT,"LEGAL_SPLASH",0,false);
      this.fixJustifiedLegalText(this.LEGALSCREEN.LEGAL_TEXT,75);
      this.LEGALSCREEN._alpha = 0;
      if(loadingLabel != undefined)
      {
         this.LEGALSCREEN.LOADING_SPINNER.autoSize = true;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.LEGALSCREEN.LOADING_SPINNER,loadingLabel,0,false);
         this.LEGALSCREEN.LOADING_SPINNER.setTextFormat(_loc4_);
         if(this.LEGALSCREEN.LOADING_SPINNER.textHeight > 22)
         {
            this.LEGALSCREEN.LOADING_SPINNER._y -= 10;
         }
         this.LEGALSCREEN.loading._visible = true;
      }
      if(savingLabel != undefined)
      {
         this.LEGALSCREEN.SAVING_SPINNER.autoSize = true;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.LEGALSCREEN.SAVING_SPINNER,savingLabel,0,false);
         this.LEGALSCREEN.SAVING_SPINNER.setTextFormat(_loc4_);
         if(this.LEGALSCREEN.SAVING_SPINNER.textHeight > 22)
         {
            this.LEGALSCREEN.SAVING_SPINNER._y -= 10;
         }
         this.LEGALSCREEN.spinner._visible = true;
      }
      if(SocialClubLabel != undefined)
      {
         this.LEGALSCREEN.CLOUD_SPINNER.autoSize = true;
         com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.LEGALSCREEN.CLOUD_SPINNER,SocialClubLabel,0,false);
         this.LEGALSCREEN.CLOUD_SPINNER.setTextFormat(_loc4_);
         if(this.LEGALSCREEN.CLOUD_SPINNER.textHeight > 22)
         {
            this.LEGALSCREEN.CLOUD_SPINNER._y -= 10;
         }
         this.LEGALSCREEN.scstar._visible = true;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.LEGALROCKSTAR,1,{_alpha:100,onComplete:this.removeRockstarSplash,onCompleteScope:this});
   }
   function fadeAndRemoveMovieClip(fadeMc, fadeDuration)
   {
      if(isNaN(fadeDuration))
      {
         fadeDuration = 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.to(fadeMc,fadeDuration,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT,onComplete:this.remove,onCompleteScope:this,onCompleteArgs:{removeMc:fadeMc}});
   }
   function remove(removeMc)
   {
      removeMc.removeMovieClip();
   }
   function removeRockstarSplash()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.LEGALROCKSTAR,1,{delay:4,_alpha:0,onComplete:this.remove,onCompleteScope:this,onCompleteArgs:{removeMc:this.LEGALROCKSTAR}});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.LEGALSCREEN,1,{delay:5,_alpha:100});
   }
   function INSTALL()
   {
      this.PROGRESS_BAR._visible = false;
      this.STARTUP_ANIMATED_LOADINGSCREENS();
      this.SET_PROGRESS_TEXT("100 %");
      this.SET_BUTTONS(2,33);
   }
   function SWITCH()
   {
      this.prepLoadingScreens();
      this.STARTUP_ANIMATED_LOADINGSCREENS();
   }
   function prepLoadingScreens()
   {
      this.PROGRESS_TEXT._visible = false;
      this.PROGRESS_BAR._visible = false;
      this.HIDE_PROGRESS_TEXT();
   }
   function SET_GTA_LOGO_VISIBLE(bVisible)
   {
   }
   function switchToStaticGameLoadingScreens()
   {
      this.prepLoadingScreens();
      if(this.legalOverlay)
      {
         this.removeLegals();
      }
      clearInterval(this.intervalId);
      if(!this.loadingScreenHolder.loadingNewsScreenBG)
      {
         this.loadingScreenHolder.attachMovie("GenericImageLoader","loadingNewsScreenBG",this.loadingScreenHolder.getNextHighestDepth());
      }
      if(this.overlay)
      {
         if(this.overlay.getDepth() < this.loadingScreenHolder.loadingNewsScreenBG.getDepth())
         {
            this.overlay.swapDepths(this.loadingScreenHolder.loadingNewsScreenBG);
         }
      }
      else
      {
         this.overlay = this.createOverlay(this.loadingScreenHolder);
      }
      if(this.loadScreensArePlaying)
      {
         this.fadeInBlackOverlay(1,this.onCompleteFadeToNews);
      }
      else
      {
         this.loadNextStaticScreen();
      }
      this.loadScreensArePlaying = true;
   }
   function TEST_BUTTONS(slot, icon, buttonText)
   {
      this.SET_DISPLAY_CONFIG(this.screenWidth,this.screenHeight,0.055,0.945,0.055,0.945,true);
      this.SET_BUTTONS(slot,icon,buttonText);
   }
   function TEST_INSTALL()
   {
      this.SET_DISPLAY_CONFIG(this.screenWidth,this.screenHeight,0.055,0.945,0.055,0.945,true);
      this.SET_PROGRESS_TITLE("Installing");
      this.SET_PROGRESS_TEXT("8888 / 8888MB");
      this.SET_BUTTONS(2,33);
   }
   function updateButtonLayout()
   {
      this.LOADING_BUTTONS._visible = false;
      var _loc16_ = this.LOADING_BUTTONS.SP_BUTTON;
      var _loc17_ = this.LOADING_BUTTONS.MP_BUTTON;
      var _loc19_ = this.LOADING_BUTTONS.RANDOM_BUTTON;
      var _loc15_ = this.LOADING_BUTTONS.SPECIAL_BUTTON;
      var _loc12_ = 2;
      var _loc11_ = 8;
      var _loc10_ = 24;
      var _loc7_ = 6;
      var _loc18_ = 15;
      var _loc13_ = this.screenWidth - this.safeRight;
      var _loc14_;
      if(this.PROGRESS_TEXT._visible && String(this.PROGRESS_TEXT.BUTTON.buttonTF.text).length < 1)
      {
         this.PROGRESS_TEXT._visible = false;
      }
      else if(this.PROGRESS_TEXT._visible)
      {
         this.PROGRESS_TEXT.BUTTON.buttonTF._x = _loc7_;
         this.PROGRESS_TEXT.BUTTON.icon._x = this.PROGRESS_TEXT.BUTTON.buttonTF._width + _loc11_;
         _loc14_ = _loc7_ + this.PROGRESS_TEXT.progressTitle._width + _loc18_ + this.PROGRESS_TEXT.BUTTON.buttonTF._width + _loc10_ + _loc7_;
         this.PROGRESS_TEXT.background._width = _loc14_;
         this.PROGRESS_TEXT.progressTitle._x = _loc7_;
         this.PROGRESS_TEXT.BUTTON._x = _loc14_ - (this.PROGRESS_TEXT.BUTTON.buttonTF._width + _loc10_ + _loc7_ + _loc7_);
         _loc13_ -= _loc14_;
         this.PROGRESS_TEXT._x = _loc13_;
         _loc13_ -= 3;
      }
      var _loc9_ = [_loc16_,_loc17_,_loc19_,_loc15_];
      var _loc5_ = [];
      var _loc8_ = false;
      var _loc4_ = 0;
      var _loc2_;
      while(_loc4_ < _loc9_.length)
      {
         _loc2_ = _loc9_[_loc4_];
         if(_loc2_.buttonTF.text && _loc2_.buttonTF.text != "")
         {
            if(_loc2_.icon.spinner._visible && !_loc8_)
            {
               _loc8_ = true;
               _loc5_.push(_loc2_);
            }
            else
            {
               _loc5_.unshift(_loc2_);
            }
         }
         else
         {
            _loc2_._visible = false;
            _loc2_._x = _loc7_;
         }
         _loc2_.buttonTF._x = 0;
         _loc2_.icon._x = _loc2_.buttonTF._width + _loc12_;
         _loc4_ = _loc4_ + 1;
      }
      var _loc6_ = _loc7_;
      var _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         _loc2_ = _loc5_[_loc3_];
         if(_loc3_ > 0)
         {
            _loc6_ += _loc11_;
         }
         _loc2_._x = _loc6_;
         _loc6_ += _loc2_.buttonTF._width + _loc10_;
         _loc2_._visible = true;
         _loc2_.buttonTF._visible = true;
         _loc2_.icon._visible = true;
         _loc3_ = _loc3_ + 1;
      }
      _loc6_ += _loc7_;
      this.LOADING_BUTTONS.background._width = _loc6_;
      if(!this.isWideScreen)
      {
         this.LOADING_BUTTONS._xscale = this.LOADING_BUTTONS._yscale = 114;
      }
      _loc13_ -= this.LOADING_BUTTONS._width;
      this.LOADING_BUTTONS._x = _loc13_;
      if(_loc5_.length > 0)
      {
         this.LOADING_BUTTONS._visible = true;
      }
   }
   function SET_BUTTONS(slot, icon, buttonText)
   {
      var _loc2_;
      switch(this.eCurrentContext)
      {
         case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_GAMELOAD:
         case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_GAMELOAD_NEWS:
            if(slot == 0)
            {
               _loc2_ = this.LOADING_BUTTONS.SP_BUTTON;
            }
            else if(slot == 1)
            {
               _loc2_ = this.LOADING_BUTTONS.MP_BUTTON;
            }
            else if(slot == 2)
            {
               _loc2_ = this.LOADING_BUTTONS.RANDOM_BUTTON;
            }
            else if(slot == 3)
            {
               _loc2_ = this.LOADING_BUTTONS.SPECIAL_BUTTON;
            }
            else
            {
               com.rockstargames.ui.utils.Debug.log("Slot=" + slot + " invalid for loading screen button icon=" + icon);
            }
            _loc2_.icon.spinner._visible = icon == 44;
            _loc2_.icon.button30._visible = icon == 30;
            _loc2_.icon.button31._visible = icon == 31;
            _loc2_.icon.button32._visible = icon == 32;
            _loc2_.icon.button33._visible = icon == 33;
            _loc2_.icon.button36._visible = icon == 36;
            if(icon != undefined && icon != 0)
            {
               _loc2_.buttonTF.autoSize = true;
               this.setButtonText(_loc2_.buttonTF,buttonText);
               _loc2_._visible = true;
            }
            break;
         case com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_INSTALL:
      }
      this.updateButtonLayout();
   }
   function setButtonText(buttonTF, buttonText)
   {
      if(buttonText.indexOf("<C>") != -1)
      {
         buttonTF.htmlText = com.rockstargames.gtav.utils.GTAVUIUtils.parseHTMLForFonts(buttonText,11);
         buttonTF._y = 1;
      }
      else
      {
         buttonTF.text = buttonText;
         buttonTF._y = 3;
      }
   }
   function HIDE_BUTTONS()
   {
      var _loc3_ = this.LOADING_BUTTONS.SP_BUTTON;
      var _loc5_ = this.LOADING_BUTTONS.MP_BUTTON;
      var _loc6_ = this.LOADING_BUTTONS.RANDOM_BUTTON;
      var _loc4_ = this.LOADING_BUTTONS.SPECIAL_BUTTON;
      _loc3_.buttonTF.text = "";
      _loc3_._visible = false;
      _loc5_.buttonTF.text = "";
      _loc5_._visible = false;
      _loc6_.buttonTF.text = "";
      _loc6_._visible = false;
      _loc4_.buttonTF.text = "";
      _loc4_._visible = false;
      this.LOADING_BUTTONS._visible = false;
      var _loc2_ = TextField(_loc3_.buttonTF).getTextFormat();
      _loc2_.font = com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT;
      _loc3_.buttonTF.setTextFormat(_loc2_);
      _loc5_.buttonTF.setTextFormat(_loc2_);
      _loc6_.buttonTF.setTextFormat(_loc2_);
      _loc4_.buttonTF.setTextFormat(_loc2_);
      this.updateButtonLayout();
   }
   function HIDE_PROGRESS_TEXT()
   {
      this.PROGRESS_TEXT._visible = false;
      this.updateButtonLayout();
   }
   function SET_PROGRESS_TEXT(progressText)
   {
      var _loc2_;
      if(progressText != undefined)
      {
         this.PROGRESS_TEXT.BUTTON.icon.button30._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button31._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button32._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button33._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button36._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.spinner._visible = true;
         this.PROGRESS_TEXT.BUTTON.buttonTF.autoSize = "right";
         this.PROGRESS_TEXT.BUTTON.buttonTF.htmlText = progressText;
         _loc2_ = new TextFormat();
         _loc2_.font = com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT;
         this.PROGRESS_TEXT.BUTTON.buttonTF.setTextFormat(_loc2_);
      }
      if(!this.PROGRESS_TEXT._visible)
      {
         this.PROGRESS_TEXT._visible = true;
      }
      this.updateButtonLayout();
   }
   function HIDE_TEXT_FOR_LANDING()
   {
      this.PROGRESS_TEXT._alpha = 0;
   }
   function SHOW_TEXT_FOR_LANDING()
   {
      this.PROGRESS_TEXT._alpha = 100;
   }
   function SET_PROGRESS_TITLE(progressTitle)
   {
      var _loc2_;
      if(progressTitle != undefined)
      {
         this.PROGRESS_TEXT.BUTTON.icon.button30._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button31._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button32._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button33._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.button36._visible = false;
         this.PROGRESS_TEXT.BUTTON.icon.spinner._visible = true;
         this.PROGRESS_TEXT.progressTitle.htmlText = progressTitle;
         this.PROGRESS_TEXT.progressTitle.autoSize = "right";
         _loc2_ = new TextFormat();
         _loc2_.font = com.rockstargames.gtav.utils.GTAVUIConfig.DEFAULT_FONT;
         this.PROGRESS_TEXT.progressTitle.setTextFormat(_loc2_);
      }
      if(!this.PROGRESS_TEXT._visible)
      {
         this.PROGRESS_TEXT._visible = true;
      }
      this.updateButtonLayout();
   }
   function initLogo()
   {
      if(this.GTAV_LOGO == undefined)
      {
         this.GTAV_LOGO = this.CONTENT.attachMovie("GTAV_LOGO_MC","GTAV_LOGO",this.CONTENT.getNextHighestDepth() + 2010,{_visible:false});
      }
      this.GTAV_LOGO._x = this.safeLeft;
      this.GTAV_LOGO._y = this.screenHeight - this.safeBottom;
   }
   function initButtons()
   {
      if(this.LOADING_BUTTONS == undefined)
      {
         this.LOADING_BUTTONS = this.CONTENT.attachMovie("instructionalButtonMC","LOADING_BUTTONS",this.CONTENT.getDepth() + 2030);
         this.LOADING_BUTTONS._visible = false;
         this.LOADING_BUTTONS.MP_BUTTON._visible = false;
         this.LOADING_BUTTONS.SP_BUTTON._visible = false;
         this.LOADING_BUTTONS.RANDOM_BUTTON._visible = false;
         this.LOADING_BUTTONS.SPECIAL_BUTTON._visible = false;
      }
      this.LOADING_BUTTONS._x = this.screenWidth - this.safeRight;
      this.LOADING_BUTTONS._y = this.screenHeight - this.safeBottom;
   }
   function initProgressBar()
   {
      if(this.PROGRESS_TEXT == undefined)
      {
         this.PROGRESS_TEXT = this.CONTENT.attachMovie("PROGRESS_TEXT_MC","PROGRESS_TEXT",this.CONTENT.getDepth() + 2050,{_visible:false});
      }
      this.PROGRESS_TEXT._y = this.screenHeight - this.safeBottom;
   }
   function STARTUP_ANIMATED_LOADINGSCREENS()
   {
      if(this.legalOverlay)
      {
         this.removeLegals();
      }
      var _loc2_;
      if(!this.loadScreensArePlaying)
      {
         this.updateScreenIndex();
         _loc2_ = this.getLoadingScreenObject(this.currentScreenIndex);
         this.loadTextures(_loc2_.txd);
         this.nextScreenReady = true;
         this.animationDoneName = this.getLoadingScreenMovieClipName(0);
         this.startTransition(1);
         this.intervalId = setInterval(this,"SHOW_NEXT_ANIMATED_LOADINGSCREEN",500);
         this.loadScreensArePlaying = true;
      }
   }
   function SHOW_NEXT_ANIMATED_LOADINGSCREEN()
   {
      var _loc2_;
      if(this.texturesAreReadyAndAnimationIsDone())
      {
         this.switchLoadSequence();
         this.updateScreenIndex();
         clearInterval(this.intervalId);
         this.intervalId = setInterval(this,"SHOW_NEXT_ANIMATED_LOADINGSCREEN",this.timerDuration * 1000);
         this.nextScreenReady = false;
         this.animationDone = false;
         this.animationDoneName = "";
         this.startTransition();
         _loc2_ = this.getLoadingScreenObject(this.currentScreenIndex);
         this.loadTextures(_loc2_.txd);
      }
      else
      {
         this.waitForLoadingScreen();
      }
   }
   function SHOW_NEXT_STATIC_LOADINGSCREEN()
   {
      com.rockstargames.ui.utils.Debug.log("SHOW_NEXT_STATIC_LOADINGSCREEN()");
      this.fadeInBlackOverlay(1);
      this.updateNewsScreenIndex();
   }
   function waitForLoadingScreen()
   {
      clearInterval(this.intervalId);
      if(this.texturesAreReadyAndAnimationIsDone())
      {
         this.SHOW_NEXT_ANIMATED_LOADINGSCREEN();
      }
      else
      {
         this.intervalId = setInterval(this,"waitForLoadingScreen",1000);
      }
   }
   function texturesAreReadyAndAnimationIsDone()
   {
      return this.nextScreenReady && (this.animationDoneName == this.getLoadingScreenMovieClipName(0) || this.activeLoadingScreen._name);
   }
   function updateScreenIndex()
   {
      if(isNaN(this.currentScreenIndex))
      {
         this.currentScreenIndex = 0;
      }
      else
      {
         this.previousScreenIndex = this.currentScreenIndex;
         this.currentScreenIndex = this.currentScreenIndex + 1;
         if(this.currentScreenIndex >= this.loadingScreenOrder.length)
         {
            this.currentScreenIndex = 0;
         }
      }
      this.altTransition <= 0 ? (this.altTransition = 1) : (this.altTransition = -1);
   }
   function updateNewsScreenIndex()
   {
      this.activeLoadingNewsScreen = this.activeLoadingNewsScreen + 1;
      if(this.activeLoadingNewsScreen >= this.loadingNewsScreenMCs.length)
      {
         this.activeLoadingNewsScreen = 0;
      }
   }
   function getLoadingScreenObject(index)
   {
      if(isNaN(index))
      {
         index = this.currentScreenIndex;
      }
      var _loc2_ = this.loadingScreenOrder[index];
      return this.loadingScreens[_loc2_];
   }
   function getLoadingScreenMovieClipName(index)
   {
      if(isNaN(index))
      {
         index = this.currentScreenIndex;
      }
      var _loc3_ = this.getLoadingScreenObject(index);
      return _loc3_.txd;
   }
   function loadTextures(textureDict)
   {
      com.rockstargames.ui.utils.Debug.log("loadTextures: " + arguments);
      var _loc3_ = this.getLoadingScreenObject();
      if(_loc3_.isInFla)
      {
         this.setupLoadscreen(textureDict);
      }
      else
      {
         this.LOAD_TXD(textureDict,this.currentScreenIndex);
      }
   }
   function LOAD_TXD(textureDict, currScreenIndex)
   {
      com.rockstargames.ui.utils.Debug.log("LOAD_TXD: " + arguments);
      com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,textureDict,String(currScreenIndex),true);
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      var _loc3_;
      if(success)
      {
         if(this.eCurrentContext == com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_GAMELOAD || this.eCurrentContext == com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_INSTALL)
         {
            this.setupLoadscreen(textureDict,Number(uniqueID));
         }
         else if((this.eCurrentContext == com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_GAMELOAD_NEWS || this.eCurrentContext == com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_PC_LANDING) && uniqueID == "loadingNewsScreenBG")
         {
            if(this.loadingScreenHolder.loadingNewsScreenBG.textureDict == textureDict)
            {
               com.rockstargames.ui.media.ImageLoaderMC(this.loadingScreenHolder.loadingNewsScreenBG).displayTxdResponse();
               this.fadeOutBlackOverlay();
               if(this.eCurrentContext == com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_PC_LANDING)
               {
                  _loc3_ = this.landingBGColours[this.loadingNewsScreenCharIndex];
                  com.rockstargames.ui.game.GameInterface.call("SET_LANDING_SCREEN_CHARACTER_COLOUR",com.rockstargames.ui.game.GameInterface.HUD_TYPE,_loc3_);
               }
            }
         }
      }
      else
      {
         this.LOAD_TXD(textureDict,Number(uniqueID));
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
   }
   function setupLoadscreen(textureDict, currScreenIndex)
   {
      var _loc12_ = this.loadingScreenHolder.getNextHighestDepth();
      var _loc3_ = this.loadingScreenHolder.createEmptyMovieClip(textureDict + "_" + _loc12_,_loc12_,{_visible:false});
      var _loc11_ = currScreenIndex == undefined ? this.getLoadingScreenObject() : this.getLoadingScreenObject(currScreenIndex);
      var _loc5_ = _loc11_.layers;
      this.loadingScreenEmptyMcs.push({mc:_loc3_,ob:_loc11_});
      var _loc4_;
      var _loc2_;
      var _loc6_;
      if(_loc11_.isInFla)
      {
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc4_];
            _loc6_ = _loc3_.attachMovie(_loc2_.texture,_loc2_.texture,_loc3_.getNextHighestDepth(),{_visible:false});
            _loc4_ = _loc4_ + 1;
         }
         this.nextScreenReady = true;
      }
      else
      {
         if(this.ml)
         {
            delete this.mlListener;
            this.ml.cleanUp(true);
            this.ml = null;
         }
         this.ml = new com.rockstargames.ui.utils.MultiLoader(this,this.gfxName);
         _loc4_ = 0;
         while(_loc4_ < _loc5_.length)
         {
            _loc2_ = _loc5_[_loc4_];
            if(_loc2_.isInFla)
            {
               _loc3_.attachMovie(_loc2_.texture,_loc2_.texture,_loc3_.getNextHighestDepth(),{_visible:false});
            }
            else
            {
               _loc6_ = _loc3_.createEmptyMovieClip(_loc2_.texture,_loc3_.getNextHighestDepth());
               _loc6_._visible = false;
               this.ml.addClip("img://" + textureDict + "/" + _loc2_.texture,_loc6_,{onLoadProgress:this.loadProgress,onLoadInit:this.loadInit});
            }
            _loc4_ = _loc4_ + 1;
         }
         this.ml.loadClips();
         this.mlListener = new Object();
         this.mlListener.onGroupLoadInit = function(evt)
         {
            evt.scope.nextScreenReady = true;
            evt.target = null;
         };
         this.ml.addEventListener("onGroupLoadInit",this.mlListener);
      }
   }
   function loadProgress(targetMC)
   {
   }
   function loadInit(targetMC)
   {
      targetMC._visible = false;
   }
   function setupLayers(loadscreenMc, loadscreenObject)
   {
      var _loc5_ = loadscreenObject.layers;
      var _loc4_ = 0;
      var _loc2_;
      var _loc3_;
      while(_loc4_ < _loc5_.length)
      {
         _loc2_ = _loc5_[_loc4_];
         _loc3_ = loadscreenMc[_loc2_.texture];
         for(var _loc6_ in _loc2_.setup)
         {
            _loc3_[_loc6_] = _loc2_.setup[_loc6_];
         }
         if(!this.isWideScreen)
         {
            if(_loc4_ > 0 && _loc3_._x + _loc3_._width > 1280)
            {
               _loc3_._x -= 160;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function playLoadscreen(loadscreenMc, loadscreenObject)
   {
      this.deleteLoadingScreen = this.activeLoadingScreen;
      this.deleteLoadingScreenObject = this.activeLoadingScreenObject;
      this.activeLoadingScreen = loadscreenMc;
      this.activeLoadingScreenObject = loadscreenObject;
      this.exitLoadscreen(this.deleteLoadingScreen,this.deleteLoadingScreenObject);
      var _loc6_ = this.activeLoadingScreenObject.layers;
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      while(_loc2_ < _loc6_.length)
      {
         _loc3_ = _loc6_[_loc2_];
         _loc5_ = this.activeLoadingScreen[_loc3_.texture];
         _loc5_._visible = true;
         if(!this.isWideScreen)
         {
            _loc4_ = _loc3_.tweenTo;
            if(_loc2_ > 0 && _loc4_._x + _loc5_._width > 1280)
            {
               _loc4_._x -= 160;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      loadscreenMc._x = this.altTransition * 1280;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(loadscreenMc,this.tweenDuration,{_x:0,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT,onComplete:this.loadscreenIsSettled,onCompleteScope:this});
      this.activeLoadingScreen._visible = true;
   }
   function loadscreenIsSettled(layer, duration, tweenargs, setup)
   {
      var _loc5_ = this.activeLoadingScreenObject.layers;
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc5_.length)
      {
         _loc3_ = _loc5_[_loc2_];
         layer = this.activeLoadingScreen[_loc3_.texture];
         com.rockstargames.ui.tweenStar.TweenStarLite.to(layer,this.timerDuration * 3,_loc3_.tweenTo);
         _loc2_ = _loc2_ + 1;
      }
   }
   function exitLoadscreen(loadscreenMc, loadscreenObject)
   {
      var _loc6_ = loadscreenObject.layers;
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      while(_loc2_ < _loc6_.length)
      {
         _loc3_ = _loc6_[_loc2_];
         _loc5_ = loadscreenObject[_loc3_.texture];
         _loc5_._visible = true;
         if(!this.isWideScreen)
         {
            _loc4_ = _loc3_.tweenTo;
            if(_loc2_ > 0 && _loc4_._x + _loc5_._width > 1280)
            {
               _loc4_._x -= 160;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(loadscreenMc);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(loadscreenMc,this.tweenDuration,{_x:(- this.altTransition) * 1280,ease:com.rockstargames.ui.tweenStar.Ease.CUBIC_INOUT,onComplete:this.exitLoadscreenComplete,onCompleteScope:this});
      this.activeLoadingScreen._visible = true;
   }
   function exitLoadscreenComplete()
   {
      this.removeLoadscreen(this.deleteLoadingScreen,this.deleteLoadingScreenObject);
   }
   function startTransition(duration)
   {
      var _loc3_ = 0;
      if(isNaN(duration))
      {
         duration = 2;
         _loc3_ = 1;
      }
      this.cleanUpTransition();
      this.overlay = this.createOverlay(this.loadingScreenHolder);
      var _loc6_;
      var _loc2_;
      var _loc7_;
      if(this.activeLoadingScreen && this.activeLoadingScreenObject)
      {
         _loc6_ = this.activeLoadingScreenObject.layers;
         _loc2_ = _loc6_[0];
         _loc7_ = this.activeLoadingScreen[_loc2_.texture];
      }
      var _loc5_ = !this.doOverlayFade ? 0 : 99;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.overlay,duration,{_alpha:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT,onComplete:this.finishTransition,onCompleteScope:this});
   }
   function fadeInBlackOverlay(duration, onCompleteFunc)
   {
      com.rockstargames.ui.utils.Debug.log("fadeInBlackOverlay(): " + arguments);
      var _loc3_ = 0;
      if(isNaN(duration))
      {
         duration = 2;
         _loc3_ = 1;
      }
      if(!onCompleteFunc)
      {
         onCompleteFunc = this.loadNextStaticScreen;
      }
      var _loc5_ = !this.doOverlayFade ? 0 : 99;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.overlay,duration,{delay:_loc3_,_alpha:_loc5_,ease:com.rockstargames.ui.tweenStar.Ease.QUARTIC_OUT,onComplete:onCompleteFunc,onCompleteScope:this});
   }
   function loadNextStaticScreen()
   {
      com.rockstargames.ui.utils.Debug.log("loadNextStaticScreen()");
      var _loc2_ = this.loadingScreenHolder.loadingNewsScreenBG;
      if(_loc2_.isLoaded)
      {
         _loc2_.removeTxdRef();
      }
      if(this.activeLoadingNewsScreen >= this.loadingNewsScreenMCs.length)
      {
         this.activeLoadingNewsScreen = 0;
      }
      var _loc3_ = "loadingNewsScreenBG" + this.loadingNewsScreenMCs[this.activeLoadingNewsScreen];
      _loc2_.init(this.gfxName,_loc3_,_loc3_,1280,720,0,0);
      _loc2_.requestTxdRef("loadingNewsScreenBG");
   }
   function onCompleteFadeToNews()
   {
      this.removeLoadscreen(this.activeLoadingScreen,this.activeLoadingScreenObject);
      this.loadNextStaticScreen();
   }
   function removeLoadscreen(loadingScreenMc, loadingScreenObject)
   {
      var _loc5_;
      var _loc2_;
      var _loc4_;
      var _loc3_;
      if(loadingScreenMc)
      {
         _loc5_ = this.activeLoadingScreenObject.layers;
         _loc2_ = 0;
         while(_loc2_ < _loc5_.length)
         {
            _loc4_ = _loc5_[_loc2_];
            _loc3_ = loadingScreenMc[_loc4_.texture];
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_);
            _loc3_.removeMovieClip();
            _loc2_ = _loc2_ + 1;
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(loadingScreenMc);
         loadingScreenMc.removeMovieClip();
         if(loadingScreenObject.txd && !loadingScreenObject.isInFla)
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxName,loadingScreenObject.txd);
         }
      }
   }
   function getNextLoadscreenObject()
   {
      var _loc2_ = null;
      if(this.loadingScreenEmptyMcs.length > 0)
      {
         _loc2_ = this.loadingScreenEmptyMcs.shift();
      }
      return _loc2_;
   }
   function finishTransition()
   {
      this.animationDone = true;
      if(this.activeLoadingScreen)
      {
         this.animationDoneName = this.activeLoadingScreen._name;
      }
      else
      {
         this.animationDoneName = this.getLoadingScreenMovieClipName(0);
      }
      var _loc2_ = this.getNextLoadscreenObject();
      this.setupLayers(_loc2_.mc,_loc2_.ob);
      this.playLoadscreen(_loc2_.mc,_loc2_.ob);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.overlay,4,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.cleanUpTransition,onCompleteScope:this});
   }
   function fadeOutBlackOverlay()
   {
      com.rockstargames.ui.utils.Debug.log("fadeOutBlackOverlay()");
      var _loc2_ = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.overlay,4,{_alpha:_loc2_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
      if(this.eCurrentContext != com.rockstargames.gtav.loadingScreens.LOADINGSCREEN_STARTUP.CTX_PC_LANDING)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,this.timerDuration,{onComplete:this.SHOW_NEXT_STATIC_LOADINGSCREEN,onCompleteScope:this});
      }
   }
   function createOverlay(parentMc)
   {
      var _loc1_ = parentMc.createEmptyMovieClip("overlay",parentMc.getNextHighestDepth());
      _loc1_.beginFill(0);
      _loc1_.moveTo(-50,-50);
      _loc1_.lineTo(1380,0);
      _loc1_.lineTo(1380,820);
      _loc1_.lineTo(0,820);
      _loc1_.endFill();
      _loc1_._alpha = 0;
      return _loc1_;
   }
   function cleanUpTransition()
   {
      if(this.overlay)
      {
         this.overlay.removeMovieClip();
      }
      if(this.bgOverlay)
      {
         this.bgOverlay.removeMovieClip();
      }
   }
}
