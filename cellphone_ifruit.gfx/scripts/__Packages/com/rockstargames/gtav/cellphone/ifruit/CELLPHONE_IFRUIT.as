class com.rockstargames.gtav.cellphone.ifruit.CELLPHONE_IFRUIT extends MovieClip
{
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   var dataProviderUI;
   var homemenuDataProviderUI;
   var contactsDataProviderUI;
   var callscreenDataProviderUI;
   var emailListDataProviderUI;
   var emailViewDataProviderUI;
   var emailResponseDataProviderUI;
   var messageListDataProviderUI;
   var messageViewDataProviderUI;
   var jobListDataProviderUI;
   var settingsDataProviderUI;
   var toDoListDataProviderUI;
   var toDoViewDataProviderUI;
   var missionRepeatDataProviderUI;
   var missionStatsDataProviderUI;
   var xyzDataProvider;
   var bossJobListProvider;
   var bossJobViewProvider;
   var securoServHackingViewProvider;
   var applayer;
   var infoBar;
   var cellphoneButtons;
   var componentArray;
   var backgroundImageArray;
   var currentStyle;
   var headerTextFormat;
   var gamertagTextFormat;
   var loadingApp;
   var wallpaper_loader;
   var lastViewID;
   var lastCurrentID;
   var previousViewID;
   var currentlyLoadedApp;
   var cellphoneApp;
   var app_loader;
   var currentHour = 0;
   var currentMinute = 0;
   var currentDay = "";
   var backgroundImage = 0;
   var uid = 1;
   var currentInterface = undefined;
   var previousInterface = undefined;
   var iFruitTransitionTime = 0.25;
   var providerIcon = 0;
   var signalStrength = 5;
   var gfxFileName = "CELLPHONE_IFRUIT";
   var TextWhiteHex = 16777215;
   var TextBlackHex = 0;
   var TextGreyHex = 9211020;
   var whiteRGB = new Array(255,255,255);
   var offWhiteRGB = new Array(235,235,235);
   var greyRGB = new Array(140,140,140);
   var darkGreyRGB = new Array(50,54,59);
   var blackRGB = new Array(0,0,0);
   var style = new Array();
   function CELLPHONE_IFRUIT()
   {
      super();
      _global.gfxExtensions = true;
      this.style.push(new Array([152,182,230],[90,151,232],this.whiteRGB,this.offWhiteRGB,[210,210,210],[32,42,59]));
      this.style.push(new Array([32,132,39],[57,160,51],this.whiteRGB,this.offWhiteRGB,[210,210,210],[0,39,0]));
      this.style.push(new Array([174,37,37],[115,16,16],this.whiteRGB,this.offWhiteRGB,[210,210,210],[84,2,2]));
      this.style.push(new Array([230,113,43],[213,121,47],this.whiteRGB,this.offWhiteRGB,[210,210,210],[91,35,1]));
      this.style.push(new Array([125,125,125],[100,100,100],this.whiteRGB,this.offWhiteRGB,[210,210,210],[19,19,19]));
      this.style.push(new Array([86,12,123],[159,99,189],this.whiteRGB,this.offWhiteRGB,[210,210,210],[42,0,65]));
      this.style.push(new Array([219,56,146],[208,95,161],this.whiteRGB,this.offWhiteRGB,[210,210,210],[93,9,55]));
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      var _loc3_ = new flash.geom.Transform(this.CONTENT);
      var _loc4_ = new flash.geom.ColorTransform(1,1,1,1,-25,-25,-25,0);
      _loc3_.colorTransform = _loc4_;
      this.dataProviderUI = [];
      this.homemenuDataProviderUI = [];
      this.contactsDataProviderUI = [];
      this.callscreenDataProviderUI = [];
      this.emailListDataProviderUI = [];
      this.emailViewDataProviderUI = [];
      this.emailResponseDataProviderUI = [];
      this.messageListDataProviderUI = [];
      this.messageViewDataProviderUI = [];
      this.jobListDataProviderUI = [];
      this.settingsDataProviderUI = [];
      this.toDoListDataProviderUI = [];
      this.toDoViewDataProviderUI = [];
      this.missionRepeatDataProviderUI = [];
      this.missionStatsDataProviderUI = [];
      this.xyzDataProvider = [];
      this.bossJobListProvider = [];
      this.bossJobViewProvider = [];
      this.securoServHackingViewProvider = [];
      this.applayer = this.CONTENT.applayer;
      this.infoBar = this.CONTENT.infoBar;
      this.infoBar.topmostLevel = true;
      this.cellphoneButtons = this.CONTENT.cellphoneButtons;
      this.cellphoneButtons.topmostLevel = true;
      this.componentArray = ["SHUTDOWN_MOVIE","HOMEMENU","CONTACTLIST","","CALLSCREEN","","TEXT_MESSAGE_LIST","TEXT_MESSAGE_VIEW","EMAIL_LIST","EMAIL_VIEW","","APP_NUMBERPAD","","SETTINGS","APP_TODO_LIST","APP_TODO_VIEW","SHUTTER","APP_TODO_VIEW","MISSION_REPEAT_LIST","APP_MISSION_STATS_VIEW","JOB_LIST","EMAIL_RESPONSE","SETTINGS","APP_TRACKIFY","XYZ","BOSS_JOB_LIST","BOSS_JOB_LIST_VIEW","APP_SECUROSERV_HACKING"];
      this.backgroundImageArray = ["Phone_Wallpaper_ifruitdefault","","","","Phone_Wallpaper_purpleglow","Phone_Wallpaper_greensquares","Phone_Wallpaper_orangeherringbone","Phone_Wallpaper_orangehalftone","Phone_Wallpaper_greentriangles","Phone_Wallpaper_greenshards","Phone_Wallpaper_blueangles","Phone_Wallpaper_blueshards","Phone_Wallpaper_bluecircles","Phone_Wallpaper_diamonds","Phone_Wallpaper_greenglow","Phone_Wallpaper_orange8bit","Phone_Wallpaper_orangetriangles","Phone_Wallpaper_purpletartan"];
      this.currentStyle = this.style[0];
      this.headerTextFormat = new TextFormat();
      this.headerTextFormat.font = "$Font2";
      this.headerTextFormat.size = 25;
      var _loc2_ = new com.rockstargames.ui.utils.HudColour();
      com.rockstargames.ui.utils.Colour.setHudColour(com.rockstargames.ui.utils.HudColour.HUD_COLOUR_WHITE,_loc2_);
      this.headerTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc2_.r,_loc2_.g,_loc2_.b);
      this.gamertagTextFormat = new TextFormat();
      this.gamertagTextFormat.font = "$Font2_cond";
      this.gamertagTextFormat.size = 26;
      this.gamertagTextFormat.color = com.rockstargames.ui.utils.Colour.RGBToHex(_loc2_.r,_loc2_.g,_loc2_.b);
   }
   function GET_CURRENT_SELECTION()
   {
      var _loc2_ = undefined;
      if(this.loadingApp != undefined)
      {
         _loc2_ = 0;
      }
      else
      {
         _loc2_ = this.currentInterface.GET_CURRENT_SELECTION();
         if(_loc2_ == -1 || _loc2_ == undefined)
         {
            _loc2_ = 0;
         }
      }
      return _loc2_;
   }
   function SET_TITLEBAR_TIME(newHour, newMinute, newDay)
   {
      if(newHour != undefined)
      {
         this.currentHour = newHour;
      }
      if(newMinute != undefined)
      {
         this.currentMinute = newMinute;
      }
      if(newDay != undefined)
      {
         this.currentDay = newDay;
      }
      var _loc3_ = "";
      var _loc2_ = "";
      var _loc4_ = "";
      if(this.currentHour < 10)
      {
         _loc3_ = "0";
      }
      if(this.currentMinute < 10)
      {
         _loc2_ = "0";
      }
      _loc3_ += String(this.currentHour) + ":";
      _loc2_ += String(this.currentMinute);
      _loc4_ = this.currentDay;
      this.infoBar.timeBar.hour.text = _loc3_;
      this.infoBar.timeBar.minutes.text = _loc2_;
      this.infoBar.dayBar.mainMenuDay.text = _loc4_;
   }
   function SET_SLEEP_MODE(isSleepModeActive)
   {
      this.infoBar.sleepModeIcon._visible = isSleepModeActive;
   }
   function SET_HEADER(newHeader)
   {
      var _loc2_ = true;
      if(newHeader == undefined)
      {
         _loc2_ = false;
         newHeader = "";
      }
      this.infoBar.headerText._visible = _loc2_;
      this.infoBar.headerBackground._visible = _loc2_;
      this.infoBar.headerText.textAutoSize = "shrink";
      if(this.loadingApp != undefined)
      {
         this.infoBar.headerText._visible = false;
      }
      this.parseForGamerName(this.infoBar.headerText,newHeader);
   }
   function SET_SOFT_KEYS_COLOUR(buttonID, red, green, blue)
   {
      var _loc3_ = ["positiveButton","otherButton","negativeButton"];
      var _loc2_ = _loc3_[buttonID - 1];
      if(this.cellphoneButtons[_loc2_] != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.cellphoneButtons[_loc2_],red,green,blue);
      }
   }
   function SET_SOFT_KEYS(buttonID, isVisible, iconEnum)
   {
      var _loc3_ = ["positiveButton","otherButton","negativeButton"];
      var _loc2_ = _loc3_[buttonID - 1];
      this.cellphoneButtons[_loc2_]._visible = isVisible;
      this.cellphoneButtons[_loc2_].gotoAndStop(com.rockstargames.gtav.cellphone.SoftKeyLabels.SOFTKEYS[iconEnum][1]);
   }
   function toggleCellphoneButtonsVisible(isVisible)
   {
      this.CONTENT.cellphoneButtons._visible = isVisible;
   }
   function updateSoftKeys(currentClip)
   {
      if(currentClip.isLandscape)
      {
         this.cellphoneButtons._rotation = 90;
         this.cellphoneButtons.background._width = 345;
         this.cellphoneButtons._x = 40;
         this.cellphoneButtons._y = 0;
         this.cellphoneButtons.positiveButton._x = 56;
         this.cellphoneButtons.divider1._x = 114;
         this.cellphoneButtons.otherButton._x = 170;
         this.cellphoneButtons.divider2._x = 228;
         this.cellphoneButtons.negativeButton._x = 283;
      }
      else
      {
         this.cellphoneButtons._rotation = 0;
         this.cellphoneButtons.background._width = 256;
         this.cellphoneButtons._x = 0;
         this.cellphoneButtons._y = 304;
         this.cellphoneButtons.positiveButton._x = 42;
         this.cellphoneButtons.divider1._x = 85;
         this.cellphoneButtons.otherButton._x = 127;
         this.cellphoneButtons.divider2._x = 170;
         this.cellphoneButtons.negativeButton._x = 211;
      }
   }
   function updateInfoBar(currentClip)
   {
      if(currentClip._name == "SHUTTER")
      {
         this.infoBar._visible = false;
      }
      else
      {
         this.infoBar._visible = true;
      }
      if(currentClip.isLandscape)
      {
         this.infoBar._rotation = 90;
         this.infoBar.gotoAndStop("LANDSCAPE");
         this.infoBar._x = 256;
         this.infoBar.timeBar._x = 172;
         this.infoBar.sleepModeIcon._x = 290;
         this.infoBar.headerText._width = 344;
         this.infoBar.headerBackground._width = 344;
      }
      else
      {
         this.infoBar.gotoAndStop("PORTRAIT");
         this.infoBar._rotation = 0;
         this.infoBar._x = 0;
         this.infoBar.timeBar._x = 128;
         this.infoBar.sleepModeIcon._x = 203;
         this.infoBar.headerText._width = 256;
         this.infoBar.headerBackground._width = 256;
      }
      this.infoBar.badgerIcon.gotoAndStop(this.providerIcon * 20);
      this.infoBar.signalStrengthIcon.gotoAndStop(6 - this.signalStrength);
      this.SET_TITLEBAR_TIME();
   }
   function REPLACE_BACKGROUND_IMAGE(image_enum, image_string)
   {
      this.backgroundImageArray[image_enum] = image_string;
   }
   function SET_BACKGROUND_IMAGE(image_enum, removeOnly)
   {
      var _loc2_ = this.CONTENT.phoneBackground.bgMC;
      if(_loc2_ != undefined)
      {
         _loc2_.removeMovieClip();
         var _loc3_ = this.backgroundImageArray[this.backgroundImage];
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc3_);
      }
      if(this.CONTENT.phoneBackground.bgColourMC != undefined)
      {
         this.CONTENT.phoneBackground.bgColourMC.removeMovieClip();
      }
      this.backgroundImage = image_enum;
      if(removeOnly != true)
      {
         _loc2_ = this.CONTENT.phoneBackground.createEmptyMovieClip("bgMC",this.CONTENT.phoneBackground.getNextHighestDepth());
         _loc2_._alpha = 90;
         _loc3_ = this.backgroundImageArray[image_enum];
         com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc3_,"wallpaper",true);
         this.CONTENT.phoneBackground._visible = true;
      }
   }
   function SET_BACKGROUND_CREW_IMAGE(_texture)
   {
      this.SET_BACKGROUND_IMAGE(0,true);
      this.backgroundImage = 1;
      this.REPLACE_BACKGROUND_IMAGE(this.backgroundImage,_texture);
      var _loc4_ = this.CONTENT.phoneBackground.attachMovie("phoneBackgroundColour","bgColourMC",this.CONTENT.phoneBackground.getNextHighestDepth(),{_alpha:0});
      var _loc3_ = this.CONTENT.phoneBackground.attachMovie("phoneBackground","bgMC",this.CONTENT.phoneBackground.getNextHighestDepth());
      var _loc2_ = _texture;
      com.rockstargames.ui.game.GameInterface.call("REQUEST_TXD_AND_ADD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.gfxFileName,_loc2_,"crew",true);
   }
   function LOAD_BACKGROUND(txdString)
   {
      this.wallpaper_loader = new MovieClipLoader();
      this.wallpaper_loader.addListener(this);
      var _loc2_ = "img://" + txdString + "/" + txdString;
      this.wallpaper_loader.loadClip(_loc2_,this.CONTENT.phoneBackground.bgMC);
   }
   function SET_PROVIDER_ICON(icon_enum, signal_strength)
   {
      if(icon_enum != undefined)
      {
         this.providerIcon = icon_enum;
         this.CONTENT.infoBar.badgerIcon.gotoAndStop(this.providerIcon * 20);
      }
      this.SET_SIGNAL_STRENGTH(signal_strength);
   }
   function SET_SIGNAL_STRENGTH(signal_strength)
   {
      if(signal_strength == undefined)
      {
         signal_strength = 5;
      }
      this.signalStrength = signal_strength;
      this.infoBar.signalStrengthIcon.gotoAndStop(6 - this.signalStrength);
   }
   function SET_THEME(themeID)
   {
      this.currentStyle = this.style[themeID - 1];
      this.currentInterface.currentStyle = this.currentStyle;
      this.infoBar.headerText.textColor = this.TextWhiteHex;
      com.rockstargames.ui.utils.Colour.Colourise(this.infoBar.headerBackground,this.currentStyle[0][0],this.currentStyle[0][1],this.currentStyle[0][2],100);
      this.currentInterface.currentStyle = this.currentStyle;
      if(this.backgroundImage == 1 && this.CONTENT.phoneBackground.bgColourMC != undefined)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.phoneBackground.bgColourMC,this.currentStyle[5][0],this.currentStyle[5][1],this.currentStyle[5][2],0);
      }
   }
   function SET_DATA_SLOT_EMPTY(viewID)
   {
      switch(viewID)
      {
         case 2:
            this.contactsDataProviderUI = [];
            break;
         case 4:
            this.callscreenDataProviderUI = [];
            break;
         case 6:
            this.messageListDataProviderUI = [];
            break;
         case 7:
            this.messageViewDataProviderUI = [];
            break;
         case 8:
            this.emailListDataProviderUI = [];
            break;
         case 9:
            this.emailViewDataProviderUI = [];
            break;
         case 13:
         case 22:
            this.settingsDataProviderUI = [];
            break;
         case 14:
         case 17:
            this.toDoListDataProviderUI = [];
            break;
         case 15:
            this.toDoViewDataProviderUI = [];
            break;
         case 18:
            this.missionRepeatDataProviderUI = [];
            break;
         case 19:
            this.missionStatsDataProviderUI = [];
            break;
         case 20:
            this.jobListDataProviderUI = [];
            break;
         case 21:
            this.emailResponseDataProviderUI = [];
            break;
         case 24:
            this.xyzDataProvider = [];
            break;
         case 25:
            this.bossJobListProvider = [];
            break;
         case 26:
            this.bossJobViewProvider = [];
            break;
         case 27:
            this.securoServHackingViewProvider = [];
            break;
         default:
            this.dataProviderUI = [];
      }
   }
   function SET_DATA_SLOT(viewID, slotID)
   {
      switch(viewID)
      {
         case 1:
            this.homemenuDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 2:
            this.contactsDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 4:
            this.callscreenDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 6:
            this.messageListDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 7:
            this.messageViewDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 8:
            this.emailListDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 9:
            this.emailViewDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 13:
         case 22:
            this.settingsDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 14:
         case 17:
            this.toDoListDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 15:
            this.toDoViewDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 18:
            this.missionRepeatDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 19:
            this.missionStatsDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 20:
            this.jobListDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 21:
            this.emailResponseDataProviderUI[slotID] = arguments.slice(2);
            break;
         case 24:
            this.xyzDataProvider[slotID] = arguments.slice(2);
            break;
         case 25:
            this.bossJobListProvider[slotID] = arguments.slice(2);
            break;
         case 26:
            this.bossJobViewProvider[slotID] = arguments.slice(2);
            break;
         case 27:
            this.securoServHackingViewProvider[slotID] = arguments.slice(2);
            break;
         default:
            this.dataProviderUI[slotID] = arguments.slice(2);
      }
   }
   function DISPLAY_VIEW(_viewID, _currentID)
   {
      if(_viewID == 0)
      {
         this.SHUTDOWN_MOVIE();
      }
      if(_currentID == undefined)
      {
         _currentID = 0;
         if(_viewID == 1)
         {
            _currentID = 4;
         }
      }
      this.lastViewID = _viewID;
      this.lastCurrentID = _currentID;
      var _loc4_ = true;
      if(this.componentArray[_viewID] != this.componentArray[this.previousViewID])
      {
         _loc4_ = false;
         this.currentlyLoadedApp = undefined;
      }
      this.previousViewID = _viewID;
      if(this.currentlyLoadedApp == undefined && this.loadingApp == undefined)
      {
         this.LOAD_APP(this.componentArray[_viewID]);
      }
      else
      {
         this.CELLPHONE_APP(_currentID,this.componentArray[_viewID],_loc4_);
      }
      return true;
   }
   function CELLPHONE_APP(_currentID, _appString, isSameView)
   {
      if(this.applayer[_appString] == undefined)
      {
         if(this.currentlyLoadedApp == _appString && this.loadingApp == undefined)
         {
            this.LOAD_APP(_appString);
         }
      }
      else
      {
         this.cellphoneApp.currentID = _currentID;
         this.cellphoneApp.currentStyle = this.currentStyle;
         if(this.currentInterface != this.cellphoneApp)
         {
            this.cellphoneApp._name = this.currentlyLoadedApp;
            this.cellphoneApp.gfxFileName = this.gfxFileName;
            this.cellphoneApp.TextBlackHex = this.TextBlackHex;
            this.cellphoneApp.TextWhiteHex = this.TextWhiteHex;
            this.cellphoneApp.TextGreyHex = this.TextGreyHex;
            this.cellphoneApp.whiteRGB = this.whiteRGB;
            this.cellphoneApp.offWhiteRGB = this.offWhiteRGB;
            this.cellphoneApp.greyRGB = this.greyRGB;
            this.cellphoneApp.darkGreyRGB = this.darkGreyRGB;
            this.cellphoneApp.blackRGB = this.blackRGB;
            this.cellphoneApp.construct(this.dataProviderUI);
            this.createIfruitTransition(this.currentInterface,this.cellphoneApp);
            this.currentInterface = this.cellphoneApp;
         }
         else if(isSameView == true)
         {
            this.cellphoneApp.construct(this.dataProviderUI);
         }
         else
         {
            this.cellphoneApp.populateContent(this.dataProviderUI);
         }
         if(this.infoBar.headerBackground._visible == true)
         {
            this.infoBar.headerText._visible = true;
         }
      }
      return true;
   }
   function SHUTDOWN_MOVIE()
   {
      if(this.currentInterface == this.cellphoneApp)
      {
         this.REQUEST_REMOVE_APP(this.currentInterface._name);
      }
      else
      {
         this.currentInterface.CLEAN_UP_DATA();
      }
      if(this.previousInterface == this.cellphoneApp)
      {
         this.REQUEST_REMOVE_APP(this.previousInterface._name);
      }
      else
      {
         this.previousInterface.CLEAN_UP_DATA();
      }
      this.SET_BACKGROUND_IMAGE(0,true);
   }
   function LOAD_APP(fileToLoad)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,9,0);
      this.loadingApp = fileToLoad;
      if(fileToLoad.substr(0,4) == "APP_")
      {
         com.rockstargames.ui.game.GameInterface.call("REQUEST_GFX_STREAM",com.rockstargames.ui.game.GameInterface.WEB_TYPE,this.uid,fileToLoad,this.gfxFileName);
         this.uid = this.uid + 1;
      }
      else
      {
         if(this.applayer[fileToLoad] == undefined)
         {
            var _loc3_ = 20000 + this.lastViewID;
            var _loc4_ = this.applayer.attachMovie(fileToLoad,fileToLoad,_loc3_);
         }
         this.currentlyLoadedApp = fileToLoad;
         this.loadingApp = undefined;
         this.cellphoneApp = this.applayer[this.currentlyLoadedApp];
         this.cellphoneApp._name = fileToLoad;
         this.CELLPHONE_APP(this.lastCurrentID,this.currentlyLoadedApp,false);
      }
   }
   function STREAM_RESPONSE(uid, fileToLoad)
   {
      this.loadingApp = fileToLoad;
      this.currentlyLoadedApp = fileToLoad;
      var _loc4_ = 20000 + this.lastViewID;
      var _loc3_ = this.applayer.createEmptyMovieClip(fileToLoad,_loc4_);
      _loc3_._name = fileToLoad;
      this.app_loader = new MovieClipLoader();
      this.app_loader.addListener(this);
      this.app_loader.loadClip(fileToLoad,_loc3_);
   }
   function STREAM_RESPONSE_FAILED(uid)
   {
      this.LOAD_APP(this.loadingApp);
   }
   function onLoadInit(target_mc)
   {
      if(target_mc != this.CONTENT.phoneBackground.bgMC)
      {
         this.app_loader.removeListener(this);
         this.app_loader = null;
         if(this.loadingApp == this.componentArray[this.lastViewID])
         {
            this.currentlyLoadedApp = this.loadingApp;
            this.loadingApp = undefined;
            this.cellphoneApp = this.applayer[this.currentlyLoadedApp].TIMELINE;
            this.CELLPHONE_APP(this.lastCurrentID,this.currentlyLoadedApp,false);
         }
         else
         {
            this.REQUEST_REMOVE_APP(this.loadingApp);
            this.loadingApp = undefined;
            this.currentlyLoadedApp = this.componentArray[this.lastViewID];
            this.CELLPHONE_APP(this.lastCurrentID,this.componentArray[this.lastViewID],false);
         }
      }
      else
      {
         this.wallpaper_loader.removeListener(this);
         this.wallpaper_loader = null;
         if(this.backgroundImage != 1)
         {
            this.CONTENT.phoneBackground.bgMC._x = 0;
            this.CONTENT.phoneBackground.bgMC._y = 0;
            this.CONTENT.phoneBackground.bgMC._width = 256;
            this.CONTENT.phoneBackground.bgMC._height = 344;
         }
         else
         {
            this.CONTENT.phoneBackground.bgMC._x = 3;
            this.CONTENT.phoneBackground.bgMC._y = 68;
            this.CONTENT.phoneBackground.bgMC._width = 250;
            this.CONTENT.phoneBackground.bgMC._height = 233;
            if(this.CONTENT.phoneBackground.bgColourMC != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(this.CONTENT.phoneBackground.bgColourMC,this.currentStyle[5][0],this.currentStyle[5][1],this.currentStyle[5][2],0);
            }
         }
      }
   }
   function onLoadError(targetMC)
   {
      if(targetMC == this.CONTENT.phoneBackground.bgMC)
      {
         this.wallpaper_loader.removeListener(this);
         this.wallpaper_loader = null;
      }
      else
      {
         this.app_loader.removeListener(this);
         this.app_loader = null;
      }
   }
   function REQUEST_REMOVE_APP(whichMC)
   {
      if(whichMC != "SHUTDOWN_MOVIE")
      {
         if(this.applayer[whichMC] != undefined)
         {
            this.applayer[whichMC].TIMELINE.CLEAN_UP_DATA();
            this.applayer[whichMC].TIMELINE.CLOSE_APP();
            delete this.applayer[whichMC];
            this.applayer[whichMC].removeMovieClip();
            if(whichMC.substr(0,4) == "APP_")
            {
               com.rockstargames.ui.game.GameInterface.call("REQUEST_REMOVAL",com.rockstargames.ui.game.GameInterface.WEB_TYPE,whichMC,this.gfxFileName);
            }
         }
         if(this.lastViewID != this.previousViewID)
         {
            this.SET_DATA_SLOT_EMPTY(this.previousViewID);
         }
      }
      flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,this.gfxFileName);
      return true;
   }
   function REMOVE_CHILD_MOVIE(whichMC)
   {
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(uniqueID == "wallpaper" || uniqueID == "crew")
      {
         this.LOAD_BACKGROUND(textureDict);
      }
      else
      {
         this.currentInterface.TXD_HAS_LOADED(textureDict,success,uniqueID);
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      this.TXD_HAS_LOADED(textureDict,true,uniqueID);
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(uniqueID == "crew")
      {
         this.LOAD_BACKGROUND(textureDict);
      }
      else
      {
         this.currentInterface.ADD_TXD_REF_RESPONSE(textureDict,uniqueID,success);
      }
   }
   function SET_INPUT_EVENT(direction)
   {
      if(this.loadingApp == undefined)
      {
         switch(direction)
         {
            case 1:
               this.currentInterface.navigate("UP");
               break;
            case 2:
               this.currentInterface.navigate("RIGHT");
               break;
            case 3:
               this.currentInterface.navigate("DOWN");
               break;
            case 4:
               this.currentInterface.navigate("LEFT");
         }
      }
   }
   function createIfruitTransition(previousClip, currentClip)
   {
      this.updateInfoBar(currentClip);
      this.updateSoftKeys(currentClip);
      if(currentClip.isLandscape == true)
      {
         currentClip.container._x = 0;
         currentClip.container._y = 256;
      }
      else
      {
         currentClip.container._x = 0;
         currentClip.container._y = 0;
      }
      if(currentClip._name == "HOMEMENU")
      {
         this.IFRUIT_TRANSITION_IN(currentClip);
      }
      currentClip._visible = true;
      this.REQUEST_REMOVE_APP(previousClip._name);
      if(this.lastViewID != 14 && this.lastViewID != 15 && this.lastViewID != 17 && this.lastViewID != 20)
      {
         com.rockstargames.ui.utils.Colour.Colourise(this.infoBar.headerBackground,this.currentStyle[0][0],this.currentStyle[0][1],this.currentStyle[0][2],100);
      }
   }
   function IFRUIT_TRANSITION_IN(currentClip)
   {
      currentClip.container._alpha = 0;
      currentClip.container._xscale = 50;
      currentClip.container._yscale = 50;
      currentClip.container._x = 64;
      currentClip.container._y = 86;
      if(currentClip.container != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(currentClip.container,this.iFruitTransitionTime,{_alpha:100,_x:0,_y:0,_xscale:100,_yscale:100,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[currentClip.container]});
      }
      currentClip._visible = true;
   }
   function parseForGamerName(TF, str)
   {
      var _loc5_ = str.indexOf("<C>");
      var _loc7_ = str.indexOf("</C>");
      if(_loc5_ != -1 && _loc7_ != -1)
      {
         var _loc2_ = str.substring(0,_loc5_);
         var _loc4_ = str.substring(_loc5_ + 3,_loc7_);
         var _loc9_ = str.substring(_loc7_ + 4);
         TF.text = _loc2_ + _loc4_ + _loc9_;
         var _loc8_ = this.headerTextFormat;
         var _loc10_ = this.gamertagTextFormat;
         TF.setTextFormat(0,_loc2_.length,_loc8_);
         TF.setTextFormat(_loc2_.length,_loc2_.length + _loc4_.length,_loc10_);
         TF.setTextFormat(_loc2_.length + _loc4_.length,_loc2_.length + _loc4_.length + _loc9_.length,_loc8_);
      }
      else
      {
         TF.text = str;
      }
   }
}
