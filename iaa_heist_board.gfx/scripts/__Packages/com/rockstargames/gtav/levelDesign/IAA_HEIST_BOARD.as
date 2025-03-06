class com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var navigation;
   var totalCash;
   var setupLockedStat;
   var setupCompleteStat;
   var navigationEnabled;
   var state;
   var map;
   var textPrintManager;
   var spyCams;
   var loading;
   var setupMissions;
   var replayMissions;
   var launchMission;
   var finalePlayers;
   var finalePlayerCards;
   var finaleStatuses;
   var cashDistributionPanel;
   var planScroller;
   var finaleLaunchButton;
   static var imageManager;
   static var displayConfig;
   static var STATE_NULL = -1;
   static var STATE_LOADING = 0;
   static var STATE_SETUP = 1;
   static var STATE_FINALE = 2;
   static var STATE_REPLAY = 3;
   static var STATE_LAUNCH = 4;
   static var MAX_SETUP_MISSIONS = 5;
   static var MAX_REPLAY_MISSIONS = 5;
   static var MAX_FINALE_PLAYERS = 4;
   static var CENTRE_X = 1666;
   function IAA_HEIST_BOARD()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "IAA_HEIST_BOARD";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ImageManager();
      this.navigation = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.Navigation();
      com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig);
      this.totalCash = 0;
      this.setupLockedStat = 0;
      this.setupCompleteStat = 0;
      this.navigationEnabled = true;
      this.state = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_NULL;
      this.map = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.Map();
      this.textPrintManager = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.TextPrintManager(this.CONTENT.createEmptyMovieClip("textUpdteMC",this.CONTENT.getNextHighestDepth()));
      this.spyCams = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.SpyCams();
      this.loading = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.Loading();
      this.setupMissions = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_SETUP_MISSIONS)
      {
         this.setupMissions.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.SetupMission());
         _loc2_ = _loc2_ + 1;
      }
      this.replayMissions = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_REPLAY_MISSIONS)
      {
         this.replayMissions.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ReplayMission());
         _loc2_ = _loc2_ + 1;
      }
      this.launchMission = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ReplayMission();
      this.finalePlayers = [];
      this.finalePlayerCards = [];
      this.finaleStatuses = [];
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         this.finalePlayers.push(new com.rockstargames.gtav.levelDesign.iaaHeistBoard.FinalePlayer(_loc2_));
         _loc2_ = _loc2_ + 1;
      }
   }
   function TXD_HAS_LOADED(txd, success, id)
   {
      if(success)
      {
         com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.imageManager.textureLoaded(txd);
      }
   }
   function SET_INPUT_EVENT(inputID)
   {
      if(this.navigationEnabled)
      {
         if(inputID == com.rockstargames.gtav.levelDesign.iaaHeistBoard.Navigation.LEFT || inputID == com.rockstargames.gtav.levelDesign.iaaHeistBoard.Navigation.RIGHT || inputID == com.rockstargames.gtav.levelDesign.iaaHeistBoard.Navigation.UP || inputID == com.rockstargames.gtav.levelDesign.iaaHeistBoard.Navigation.DOWN)
         {
            this.navigation.navigate(inputID);
         }
      }
   }
   function ENABLE_NAVIGATION()
   {
      this.navigation.enableActiveElement();
      this.navigationEnabled = true;
   }
   function DISABLE_NAVIGATION()
   {
      this.navigation.disableActiveElement();
      this.navigationEnabled = false;
   }
   function SET_CURRENT_SELECTION(id)
   {
      this.navigation.setActiveElement(id);
   }
   function GET_CURRENT_SELECTION()
   {
      return this.navigation.getActiveElementID();
   }
   function SET_ACTIVE_ITEM_SELECTED(isSelected)
   {
      var _loc2_ = this.navigation.getActiveElement();
      if(_loc2_ && _loc2_.view.selectHighlight)
      {
         _loc2_.view.selectHighlight._visible = isSelected;
      }
   }
   function SHOW_LOADING()
   {
      this.clearUI();
      this.navigation.reset();
      this.CONTENT.gotoAndStop("loading");
      this.loading.setView(this.CONTENT.loading);
      this.state = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_LOADING;
   }
   function SHOW_SETUP(skipLoader, title, gangName, description)
   {
      if(!skipLoader && this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_NULL)
      {
         this.SHOW_LOADING();
         this.loading.setCallback(this.delegate(this,this.SHOW_SETUP,true,title,gangName,description));
         return undefined;
      }
      this.clearUI();
      this.navigation.reset();
      this.CONTENT.gotoAndStop("setup");
      this.setLocalisedText(this.CONTENT.missionTitle,"IAA_MISSION");
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.CONTENT.missionTitle._y = this.CONTENT.missionTitleBG._y - 6;
         var _loc4_ = this.CONTENT.missionTitle.getTextFormat();
         _loc4_.size = 18;
         this.CONTENT.missionTitle.setTextFormat(_loc4_);
         this.CONTENT.missionTitle.verticalAlign = "bottom";
         this.CONTENT.title.textAutoSize = "shrink";
         this.CONTENT.title.text = title;
         _loc4_ = this.CONTENT.title.getTextFormat();
         _loc4_.leading = 2;
         this.CONTENT.title.setTextFormat(_loc4_);
      }
      else
      {
         this.textPrintManager.printText(title.toUpperCase(),this.CONTENT.title,0,2);
      }
      this.CONTENT.missionTitleBG._width = this.CONTENT.missionTitle.textWidth + 12;
      if(description != undefined)
      {
         this.textPrintManager.printText(description,this.CONTENT.description,0,1);
      }
      if(gangName.length == 0)
      {
         this.CONTENT.gangName.text = "";
         this.CONTENT.userTitle.text = "";
         this.CONTENT.userTitleBG._visible = false;
      }
      else
      {
         this.setLocalisedText(this.CONTENT.userTitle,"IAA_USER");
         if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
         {
            this.CONTENT.userTitle._y = this.CONTENT.userTitleBG._y - 6;
            _loc4_ = this.CONTENT.userTitle.getTextFormat();
            _loc4_.size = 18;
            this.CONTENT.userTitle.setTextFormat(_loc4_);
            this.CONTENT.userTitle.verticalAlign = "bottom";
         }
         this.setEllipsis(gangName.toUpperCase(),this.CONTENT.gangName);
         gangName = this.CONTENT.gangName.text;
         this.CONTENT.gangName.text = "";
         this.textPrintManager.printText(gangName,this.CONTENT.gangName,10,2);
         this.CONTENT.userTitleBG._visible = true;
         this.CONTENT.userTitleBG._width = this.CONTENT.userTitle.textWidth + 12;
      }
      this.map.setView(this.CONTENT.map);
      this.spyCams.setView(this.CONTENT.spyCams);
      this.CONTENT.barGraph.blueBar._xscale = this.setupCompleteStat;
      this.CONTENT.barGraph.redBar._xscale = this.setupLockedStat;
      this.initSetupNavigation();
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_SETUP_MISSIONS)
      {
         this.setupMissions[_loc2_].updateTitle(this.navigation.getActiveElementID(),this.textPrintManager,_loc2_);
         _loc2_ = _loc2_ + 1;
      }
      this.state = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_SETUP;
   }
   function SHOW_REPLAY(skipLoader, title, gangName)
   {
      if(!skipLoader && this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_NULL)
      {
         this.SHOW_LOADING();
         this.loading.setCallback(this.delegate(this,this.SHOW_REPLAY,true,title,gangName));
         return undefined;
      }
      this.clearUI();
      this.navigation.reset();
      this.CONTENT.gotoAndStop("replay");
      this.setLocalisedText(this.CONTENT.missionTitle,"IAA_MISSION");
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.CONTENT.missionTitle._y = this.CONTENT.missionTitleBG._y - 6;
         var _loc3_ = this.CONTENT.missionTitle.getTextFormat();
         _loc3_.size = 18;
         this.CONTENT.missionTitle.setTextFormat(_loc3_);
         this.CONTENT.missionTitle.verticalAlign = "bottom";
         this.CONTENT.title.textAutoSize = "shrink";
         this.CONTENT.title.text = title;
         _loc3_ = this.CONTENT.title.getTextFormat();
         _loc3_.leading = 2;
         this.CONTENT.title.setTextFormat(_loc3_);
      }
      else
      {
         this.textPrintManager.printText(title.toUpperCase(),this.CONTENT.title,0,2);
      }
      this.CONTENT.missionTitleBG._width = this.CONTENT.missionTitle.textWidth + 12;
      if(gangName.length == 0)
      {
         this.CONTENT.gangName.text = "";
         this.CONTENT.userTitle.text = "";
         this.CONTENT.userTitleBG._visible = false;
      }
      else
      {
         this.setLocalisedText(this.CONTENT.userTitle,"IAA_USER");
         if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
         {
            this.CONTENT.userTitle._y = this.CONTENT.userTitleBG._y - 6;
            _loc3_ = this.CONTENT.userTitle.getTextFormat();
            _loc3_.size = 18;
            this.CONTENT.userTitle.setTextFormat(_loc3_);
            this.CONTENT.userTitle.verticalAlign = "bottom";
         }
         this.setEllipsis(gangName.toUpperCase(),this.CONTENT.gangName);
         gangName = this.CONTENT.gangName.text;
         this.CONTENT.gangName.text = "";
         this.textPrintManager.printText(gangName,this.CONTENT.gangName,10,2);
         this.CONTENT.userTitleBG._visible = true;
         this.CONTENT.userTitleBG._width = this.CONTENT.userTitle.textWidth + 12;
      }
      this.map.setView(this.CONTENT.map);
      this.spyCams.setView(this.CONTENT.spyCams);
      this.CONTENT.barGraph.blueBar._xscale = 0;
      this.initReplayNavigation();
      this.state = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_REPLAY;
   }
   function SHOW_LAUNCH(skipLoader, title, gangName, missionName, description, cost, texture, txd)
   {
      if(!skipLoader && this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_NULL)
      {
         this.SHOW_LOADING();
         this.loading.setCallback(this.delegate(this,this.SHOW_LAUNCH,true,title,gangName,missionName,description,cost,texture,txd));
         return undefined;
      }
      this.clearUI();
      this.navigation.reset();
      this.CONTENT.gotoAndStop("launch");
      this.launchMission.init(0,missionName,description,cost,texture,false,txd);
      this.setLocalisedText(this.CONTENT.missionTitle,"IAA_MISSION");
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.CONTENT.missionTitle._y = this.CONTENT.missionTitleBG._y - 6;
         var _loc3_ = this.CONTENT.missionTitle.getTextFormat();
         _loc3_.size = 18;
         this.CONTENT.missionTitle.setTextFormat(_loc3_);
         this.CONTENT.missionTitle.verticalAlign = "bottom";
         this.CONTENT.title.textAutoSize = "shrink";
         this.CONTENT.title.text = title;
         _loc3_ = this.CONTENT.title.getTextFormat();
         _loc3_.leading = 2;
         this.CONTENT.title.setTextFormat(_loc3_);
      }
      else
      {
         this.textPrintManager.printText(title.toUpperCase(),this.CONTENT.title,0,2);
      }
      this.CONTENT.missionTitleBG._width = this.CONTENT.missionTitle.textWidth + 12;
      if(gangName.length == 0)
      {
         this.CONTENT.gangName.text = "";
         this.CONTENT.userTitle.text = "";
         this.CONTENT.userTitleBG._visible = false;
      }
      else
      {
         this.setLocalisedText(this.CONTENT.userTitle,"IAA_USER");
         if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
         {
            this.CONTENT.userTitle._y = this.CONTENT.userTitleBG._y - 6;
            _loc3_ = this.CONTENT.userTitle.getTextFormat();
            _loc3_.size = 18;
            this.CONTENT.userTitle.setTextFormat(_loc3_);
            this.CONTENT.userTitle.verticalAlign = "bottom";
         }
         this.setEllipsis(gangName.toUpperCase(),this.CONTENT.gangName);
         gangName = this.CONTENT.gangName.text;
         this.CONTENT.gangName.text = "";
         this.textPrintManager.printText(gangName,this.CONTENT.gangName,10,2);
         this.CONTENT.userTitleBG._visible = true;
         this.CONTENT.userTitleBG._width = this.CONTENT.userTitle.textWidth + 12;
      }
      this.map.setView(this.CONTENT.map);
      this.spyCams.setView(this.CONTENT.spyCams);
      this.CONTENT.barGraph.blueBar._xscale = 0;
      this.initLaunchNavigation();
      this.state = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_LAUNCH;
   }
   function SHOW_FINALE(skipLoader, title, gangName, isLeader)
   {
      if(!skipLoader && this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_NULL)
      {
         this.SHOW_LOADING();
         this.loading.setCallback(this.delegate.apply(this,[this,this.SHOW_FINALE].concat(arguments)));
         return undefined;
      }
      this.clearUI();
      this.navigation.reset();
      this.CONTENT.gotoAndStop("finale");
      this.setLocalisedText(this.CONTENT.missionTitle,"IAA_MISSION");
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.CONTENT.missionTitle._y = this.CONTENT.missionTitleBG._y - 6;
         var _loc6_ = this.CONTENT.missionTitle.getTextFormat();
         _loc6_.size = 18;
         this.CONTENT.missionTitle.setTextFormat(_loc6_);
         this.CONTENT.missionTitle.verticalAlign = "bottom";
         this.CONTENT.title.text = title;
         _loc6_ = this.CONTENT.title.getTextFormat();
         _loc6_.size = 42;
         _loc6_.leading = 0;
         this.CONTENT.title.setTextFormat(_loc6_);
      }
      else
      {
         this.textPrintManager.printText(title.toUpperCase(),this.CONTENT.title,0,2);
      }
      this.CONTENT.missionTitleBG._width = this.CONTENT.missionTitle.textWidth + 12;
      this.CONTENT.userTitleBG._y = 194;
      if(gangName.length == 0)
      {
         this.CONTENT.gangName.text = "";
         this.CONTENT.userTitle.text = "";
         this.CONTENT.userTitleBG._visible = false;
      }
      else
      {
         this.setLocalisedText(this.CONTENT.userTitle,"IAA_USER");
         if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
         {
            this.CONTENT.userTitle._y = this.CONTENT.userTitleBG._y - 6;
            _loc6_ = this.CONTENT.userTitle.getTextFormat();
            _loc6_.size = 18;
            this.CONTENT.userTitle.setTextFormat(_loc6_);
            this.CONTENT.userTitle.verticalAlign = "bottom";
         }
         this.setEllipsis(gangName.toUpperCase(),this.CONTENT.gangName);
         gangName = this.CONTENT.gangName.text;
         this.CONTENT.gangName.text = "";
         this.textPrintManager.printText(gangName,this.CONTENT.gangName,10,2);
         this.CONTENT.userTitleBG._visible = true;
         this.CONTENT.userTitleBG._width = this.CONTENT.userTitle.textWidth + 12;
      }
      this.setLocalisedText(this.CONTENT.planTitle,"IAA_PLAN");
      if(com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.displayConfig.isAsian)
      {
         this.CONTENT.planTitle._y = this.CONTENT.planTitleBG._y - 6;
         _loc6_ = this.CONTENT.planTitle.getTextFormat();
         _loc6_.size = 18;
         this.CONTENT.planTitle.setTextFormat(_loc6_);
         this.CONTENT.planTitle.verticalAlign = "bottom";
      }
      this.CONTENT.planTitleBG._width = this.CONTENT.planTitle.textWidth + 12;
      this.CONTENT.launchButton.labelWrapper.label.textAutoSize = "shrink";
      this.setLocalisedText(this.CONTENT.launchButton.labelWrapper.label,"IAA_LAUNCH_M");
      this.setLocalisedText(this.CONTENT.launchButton.highlight.label,"IAA_LAUNCH_M");
      this.map.setView(this.CONTENT.map);
      this.spyCams.setView(this.CONTENT.spyCams);
      this.cashDistributionPanel = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.CashDistributionPanel(this.CONTENT.distributionPanel);
      this.planScroller = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.ScrollingList(this.CONTENT.planScroller);
      var _loc3_ = 4;
      while(_loc3_ < arguments.length)
      {
         this.planScroller.addItem(arguments[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         this.finalePlayerCards[_loc3_] = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.PlayerCard(_loc3_,this.CONTENT.playerCards["player" + _loc3_],isLeader);
         this.finaleStatuses[_loc3_] = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.Status(_loc3_,this.CONTENT.playerStatuses["status" + _loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.finaleLaunchButton = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationElement(this.CONTENT.launchButton.highlight,com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs.FINALE_LAUNCH_MISSION);
      this.updateFinaleView();
      this.initFinaleNavigation(isLeader);
      this.state = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_FINALE;
   }
   function SET_MAP_DISPLAY(x, y, scale, cutToPosition)
   {
      this.map.setDisplay(x,y,scale,cutToPosition);
   }
   function ADD_MAP_MARKER(id, x, y, label)
   {
      this.map.addMarker(id,x,y,label);
   }
   function REMOVE_MAP_MARKER(id)
   {
      this.map.removeMarker(id);
   }
   function RESET_MAP()
   {
      this.map.reset();
   }
   function FLASH_ACTIVE_ELEMENT()
   {
      this.navigation.getActiveElement().view._parent.flash.gotoAndPlay("flashing");
   }
   function PULSE_ELEMENT(elementID)
   {
      var _loc6_ = 0;
      while(_loc6_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_SETUP_MISSIONS)
      {
         var _loc5_ = this.setupMissions[_loc6_];
         var _loc2_ = 0;
         var _loc4_ = _loc5_.activeNavigationElements.length;
         while(_loc2_ < _loc4_)
         {
            var _loc3_ = _loc5_.activeNavigationElements[_loc2_];
            if(_loc3_.id == elementID)
            {
               _loc3_.view._parent.pulse.gotoAndPlay("pulsing");
               return undefined;
            }
            _loc2_ = _loc2_ + 1;
         }
         _loc6_ = _loc6_ + 1;
      }
   }
   function SET_SPY_CAM_TEXTURES(txd, topTexture, leftTexture1, leftTexture2, leftTexture3, leftTexture4, leftTexture5, rightTexture1, rightTexture2, rightTexture3, bottomTexture)
   {
      this.spyCams.setTextures(txd,topTexture,bottomTexture,leftTexture1,leftTexture2,leftTexture3,leftTexture4,leftTexture5,rightTexture1,rightTexture2,rightTexture3);
   }
   function SET_SETUP_MISSION(index, prep1Title, prep1Description, prep1State, prep1Texture, prep2Title, prep2Description, prep2State, prep2Texture, finalTitle, finalDescription, finalState, finalTexture, lockedMessage, prep1Stat, prep2Stat, finalStat, txd)
   {
      this.setupMissions[index].init(index,prep1Title,prep1Description,prep1State,prep1Texture,prep2Title,prep2Description,prep2State,prep2Texture,finalTitle,finalDescription,finalState,finalTexture,lockedMessage,prep1Stat,prep2Stat,finalStat,txd);
      var _loc5_ = 0;
      var _loc4_ = 0;
      var _loc6_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_SETUP_MISSIONS)
      {
         var _loc2_ = this.setupMissions[_loc3_];
         _loc2_.updateHighlights(this.navigation.getActiveElementID());
         if(_loc2_.isInUse)
         {
            _loc5_ += _loc2_.numComplete;
            _loc4_ += _loc2_.numLocked;
            _loc6_ += _loc2_.numAvailable;
         }
         _loc3_ = _loc3_ + 1;
      }
      var _loc7_ = _loc5_ + _loc4_ + _loc6_;
      this.setupCompleteStat = _loc7_ != 0 ? 100 * _loc5_ / _loc7_ : 0;
      this.setupLockedStat = _loc7_ != 0 ? 100 * _loc4_ / _loc7_ : 0;
      this.CONTENT.barGraph.blueBar._xscale = this.setupCompleteStat;
      this.CONTENT.barGraph.redBar._xscale = this.setupLockedStat;
   }
   function SET_REPLAY_MISSION(index, title, description, cost, texture, isUnavailable, txd)
   {
      this.replayMissions[index].init(index,title,description,cost,texture,isUnavailable,txd);
   }
   function SET_FINALE_PLAYER(index, gamertag, headshotTexture, isLocalPlayer)
   {
      var _loc2_ = this.finalePlayers[index];
      _loc2_.gamertag = gamertag;
      _loc2_.texture = headshotTexture;
      _loc2_.isEnabled = gamertag.length > 0;
      _loc2_.isLocal = isLocalPlayer;
      if(this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_FINALE)
      {
         this.updateFinaleView();
         this.updateFinaleNavigation();
      }
   }
   function REMOVE_FINALE_PLAYER(index)
   {
      this.SET_FINALE_PLAYER(index,"","",this.finalePlayers[index].isLocalPlayer);
   }
   function UPDATE_FINALE_PLAYER_ROLE(index, role)
   {
      var _loc3_ = this.finalePlayers[index];
      _loc3_.role = role;
      if(this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_FINALE)
      {
         var _loc2_ = this.finalePlayerCards[index];
         _loc2_.updateRole(role);
      }
   }
   function UPDATE_FINALE_PLAYER_STATUS(index, isReady)
   {
      var _loc3_ = this.finalePlayers[index];
      _loc3_.isReady = isReady;
      if(this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_FINALE)
      {
         var _loc6_ = this.finaleStatuses[index];
         _loc6_.updateStatus(isReady);
      }
      var _loc4_ = 0;
      var _loc5_ = 0;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         _loc3_ = this.finalePlayers[_loc2_];
         if(_loc3_.isEnabled)
         {
            _loc4_ = _loc4_ + 1;
            if(_loc3_.isReady)
            {
               _loc5_ = _loc5_ + 1;
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.barGraph.blueBar._xscale = _loc4_ != 0 ? 100 * _loc5_ / _loc4_ : 0;
      this.CONTENT.barGraph.redBar._xscale = 100 - this.CONTENT.barGraph.blueBar._xscale;
   }
   function UPDATE_CASH_DISTRIBUTION(player0Cash, player1Cash, player2Cash, player3Cash, unassignedCash)
   {
      if(isNaN(player0Cash))
      {
         player0Cash = 0;
      }
      if(isNaN(player1Cash))
      {
         player1Cash = 0;
      }
      if(isNaN(player1Cash))
      {
         player1Cash = 0;
      }
      if(isNaN(player1Cash))
      {
         player1Cash = 0;
      }
      if(isNaN(unassignedCash))
      {
         unassignedCash = 0;
      }
      this.totalCash = player0Cash + player1Cash + player2Cash + player3Cash + unassignedCash;
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         var _loc4_ = this.finalePlayers[_loc3_];
         _loc4_.cash = arguments[_loc3_];
         _loc4_.percentage = this.totalCash != 0 ? Math.round(100 * arguments[_loc3_] / this.totalCash) : 0;
         if(this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_FINALE)
         {
            var _loc5_ = this.finalePlayerCards[_loc3_];
            _loc5_.updateCashAndPercentage(_loc4_.cash,_loc4_.percentage);
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.state == com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.STATE_FINALE)
      {
         this.cashDistributionPanel.update(this.finalePlayers,this.totalCash);
      }
   }
   function SET_LAUNCH_STATE(enabled, hidden)
   {
      if(this.finaleLaunchButton)
      {
         this.finaleLaunchButton.enabled = enabled;
         this.CONTENT.launchButton._visible = !hidden;
         this.CONTENT.launchButton.gotoAndStop(!enabled ? "inactive" : "active");
      }
   }
   function UPDATE_FINALE_PLAN()
   {
      if(this.planScroller)
      {
         this.planScroller.removeAllItems();
         var _loc3_ = 0;
         while(_loc3_ < arguments.length)
         {
            this.planScroller.addItem(arguments[_loc3_]);
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function clearUI()
   {
      this.textPrintManager.reset();
      this.loading.reset();
      this.spyCams.reset();
      if(this.cashDistributionPanel)
      {
         this.cashDistributionPanel.dispose();
      }
      this.cashDistributionPanel = null;
      if(this.planScroller)
      {
         this.planScroller.dispose();
      }
      this.planScroller = null;
      this.finaleLaunchButton = null;
      var _loc2_ = 0;
      var _loc3_ = this.finalePlayerCards.length;
      while(_loc2_ < _loc3_)
      {
         this.finalePlayerCards[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.finalePlayerCards.length = 0;
      _loc2_ = 0;
      _loc3_ = this.finaleStatuses.length;
      while(_loc2_ < _loc3_)
      {
         this.finaleStatuses[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.finaleStatuses.length = 0;
      _loc2_ = 0;
      _loc3_ = this.setupMissions.length;
      while(_loc2_ < _loc3_)
      {
         this.setupMissions[_loc2_].clearView();
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      _loc3_ = this.replayMissions.length;
      while(_loc2_ < _loc3_)
      {
         this.replayMissions[_loc2_].clearView();
         _loc2_ = _loc2_ + 1;
      }
      this.launchMission.clearView();
   }
   function initSetupNavigation()
   {
      this.navigation.setListener(this.delegate(this,this.onSetupNavigationChange));
      this.updateSetupNavigation();
   }
   function updateSetupNavigation()
   {
      var _loc5_ = this.navigation.getActiveElementID();
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_SETUP_MISSIONS)
      {
         this.setupMissions[_loc2_].setView(this.CONTENT["mission" + _loc2_],this.textPrintManager);
         _loc3_ = _loc3_.concat(this.setupMissions[_loc2_].activeNavigationElements);
         this.setupMissions[_loc2_].updateTitle(_loc5_,this.textPrintManager,0);
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      var _loc4_ = _loc3_.length;
      while(_loc2_ < _loc4_)
      {
         _loc3_[_loc2_].enabled = true;
         _loc2_ = _loc2_ + 1;
      }
      this.navigation.setElements(_loc3_);
   }
   function onSetupNavigationChange(activeElementID)
   {
      var _loc4_ = Math.floor((activeElementID - 1) / 3);
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_SETUP_MISSIONS)
      {
         this.setupMissions[_loc2_].updateHighlights(activeElementID);
         if(_loc2_ == _loc4_)
         {
            this.setupMissions[_loc2_].updateTitle(activeElementID,this.textPrintManager,0);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function initLaunchNavigation()
   {
      this.launchMission.setView(this.CONTENT.mission,this.textPrintManager);
      this.launchMission.navigationElement.enabled = true;
      this.navigation.setElements([this.launchMission.navigationElement]);
      this.launchMission.updateHighlight(this.navigation.getActiveElementID());
   }
   function initReplayNavigation()
   {
      this.navigation.setListener(this.delegate(this,this.onReplayNavigationChange));
      this.updateReplayNavigation();
   }
   function updateReplayNavigation()
   {
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_SETUP_MISSIONS)
      {
         this.replayMissions[_loc2_].setView(this.CONTENT["mission" + _loc2_],this.textPrintManager);
         if(this.replayMissions[_loc2_].isInUse)
         {
            _loc3_.push(this.replayMissions[_loc2_].navigationElement);
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 0;
      var _loc4_ = _loc3_.length;
      while(_loc2_ < _loc4_)
      {
         _loc3_[_loc2_].enabled = true;
         _loc2_ = _loc2_ + 1;
      }
      this.navigation.setElements(_loc3_);
   }
   function onReplayNavigationChange(activeElementID)
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_REPLAY_MISSIONS)
      {
         this.replayMissions[_loc2_].updateHighlight(activeElementID);
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateFinaleView()
   {
      var _loc7_ = -1;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         var _loc3_ = this.finalePlayers[_loc2_];
         var _loc5_ = this.finalePlayerCards[_loc2_];
         var _loc6_ = this.finaleStatuses[_loc2_];
         if(_loc3_.isEnabled)
         {
            _loc7_ = _loc7_ + 1;
         }
         var _loc4_ = Math.max(0,_loc7_);
         _loc5_.update(_loc3_,_loc4_);
         _loc6_.update(_loc3_,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.playerCards._x = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.CENTRE_X - 0.5 * this.CONTENT.playerCards._width;
      this.CONTENT.playerStatuses._x = com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.CENTRE_X - 0.5 * this.CONTENT.playerStatuses._width;
      _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         _loc5_ = this.finalePlayerCards[_loc2_];
         _loc6_ = this.finaleStatuses[_loc2_];
         _loc5_.roleHighlight.updateBounds();
         _loc5_.cashHighlight.updateBounds();
         _loc6_.highlight.updateBounds();
         _loc2_ = _loc2_ + 1;
      }
      this.cashDistributionPanel.update(this.finalePlayers,this.totalCash);
   }
   function initFinaleNavigation(isLeader)
   {
      var _loc4_ = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         var _loc3_ = this.finalePlayerCards[_loc2_];
         var _loc5_ = this.finalePlayers[_loc2_];
         var _loc6_ = this.finaleStatuses[_loc2_];
         if(isLeader)
         {
            _loc4_.push(_loc3_.roleHighlight);
            _loc4_.push(_loc3_.cashHighlight);
         }
         else if(_loc5_.isLocal)
         {
            _loc4_.push(_loc6_.highlight);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.planScroller.appendNavigationElementsTo(_loc4_);
      if(isLeader)
      {
         _loc4_.push(this.finaleLaunchButton);
      }
      this.navigation.setElements(_loc4_);
      this.navigation.setListener(this.delegate(this,this.onFinaleNavigationChange));
      this.updateFinaleNavigation();
   }
   function updateFinaleNavigation()
   {
      var _loc4_ = this.navigation.getActiveElementID();
      if(_loc4_ == -1)
      {
         _loc4_ = 0;
      }
      var _loc3_ = this.navigation.getElementByID(_loc4_);
      if(_loc3_ == null || !_loc3_.enabled)
      {
         var _loc2_ = 0;
         while(_loc2_ < 4)
         {
            _loc4_ = com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["FINALE_PLAYER_" + _loc2_ + "_ROLE"];
            _loc3_ = this.navigation.getElementByID(_loc4_);
            if(_loc3_ != null && _loc3_.enabled)
            {
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      this.navigation.setActiveElement(_loc4_);
   }
   function onFinaleNavigationChange(activeElementID)
   {
      var _loc7_ = -1;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.IAA_HEIST_BOARD.MAX_FINALE_PLAYERS)
      {
         var _loc3_ = activeElementID == com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["FINALE_PLAYER_" + _loc2_ + "_ROLE"] || activeElementID == com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["FINALE_PLAYER_" + _loc2_ + "_CASH"] || activeElementID == com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs["FINALE_PLAYER_" + _loc2_ + "_STATUS"];
         var _loc6_ = this.finalePlayers[_loc2_];
         _loc6_.isActive = _loc3_;
         var _loc5_ = this.finalePlayerCards[_loc2_];
         _loc5_.updateActiveState(_loc3_);
         _loc5_.updateSelectHighlights(activeElementID);
         if(_loc3_)
         {
            _loc7_ = _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.cashDistributionPanel.updateActiveState(_loc7_);
      if(activeElementID >= com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs.SCROLL_ITEM_MIN)
      {
         this.planScroller.setActiveItem(activeElementID - com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs.SCROLL_ITEM_MIN);
      }
      this.CONTENT.launchButton.label._alpha = activeElementID != com.rockstargames.gtav.levelDesign.iaaHeistBoard.NavigationIDs.FINALE_LAUNCH_MISSION ? 100 : 0;
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
   function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   function setEllipsis(label, tf)
   {
      tf.text = label;
      if(tf.textWidth > tf._width - 4)
      {
         var _loc1_ = label.length;
         while(_loc1_ > 0)
         {
            tf.text = label.substring(0,_loc1_) + "...";
            if(tf.textWidth <= tf._width - 4)
            {
               break;
            }
            _loc1_ = _loc1_ - 1;
         }
      }
   }
}
