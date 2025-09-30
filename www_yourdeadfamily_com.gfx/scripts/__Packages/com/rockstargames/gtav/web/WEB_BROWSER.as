class com.rockstargames.gtav.web.WEB_BROWSER extends com.rockstargames.ui.core.BaseScriptUI
{
   var BOUNDING_BOX;
   var BrowserKeyBoard;
   var CONTENT;
   var CURSOR;
   var GUTTER;
   var HIGHLIGHT;
   var SCROLLBAR;
   var SCRUBBER;
   var TIMELINE;
   var TOOLBAR;
   var _currentSelectedButton;
   var _currentSelectedTarget;
   var buttonManager;
   var buttonMaskMC;
   var currentInterface;
   var currentUID;
   var currentWebsite;
   var currentlyLoaded;
   var cursorInterval;
   var doesPageExist;
   var fullURL;
   var historyExpiredMessage;
   var keyboardContainer;
   var keyboardField;
   var keyboardFieldOriginalColour;
   var loadingTimoutID;
   var movieClipName;
   var multiplayer;
   var objType;
   var oldMouseX;
   var oldMouseY;
   var pageName;
   var player;
   var prevContentY;
   var removeMovieClip;
   var searchArgs;
   var userTextEntry;
   var web_loader;
   var MOUSE_MODE = false;
   var cursorSpeedMultiplier = 1.5;
   var analogSpeedDivisor = 15;
   var usingLeftAnalog = false;
   var safeFrameX = 72;
   var safeFrameY = 48;
   var contentY = com.rockstargames.gtav.web.WEB_BROWSER.prototype.safeFrameY + 45;
   var contentX = 0;
   var keyboardYposition = 360;
   var _currentSelection = -1;
   var buttonState = "OFF";
   var cursorState = "ARROW";
   static var streamResponseHash = {};
   var nextID = 0;
   var loadingWebPage = false;
   static var homeWebsite = "WWW_EYEFIND_INFO";
   var browserHistory = new Array();
   var browserHistoryIndex = 0;
   var browserHistoryStatus = "new";
   var browserHistoryCanStore = new Array();
   var browserHistorySearchArgs = new Array();
   var pageHeight = 0;
   var resetToPrevContentY = false;
   var keyboardFocus = "";
   var BROWSER_KEYBOARD_SET = new Array("1","2","3","4","5","6","7","8","9","0","Q","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","BACKSPACE","Z","X","C","V","B","N","M",".","-","ENTER","WWW.",">",".COM",">"," ",">",".NET",">",".ORG",">");
   var _isWideScreen = true;
   var isLastWebsite = false;
   var CanStoreThisPage = false;
   var DebugTextContent = false;
   var defaultBrowserOnColour = 16010;
   var defaultBrowserOffColour = 0;
   var WEB_BROWSER_FILENAME = "WEB_BROWSER";
   var shutdown = false;
   var resetScroll = true;
   var isJapanese = false;
   var suppressBackButton = false;
   function WEB_BROWSER()
   {
      super();
      _global.gfxExtensions = true;
      _global.noInvisibleAdvance = true;
      Stage.scaleMode = "noBorder";
      this.currentlyLoaded = null;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.TIMELINE._name = "BROWSER";
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.CONTENT._y = this.safeFrameY;
      this.CONTENT._x = 0;
      this.CONTENT.expired._visible = false;
      this.multiplayer = false;
      this.buttonManager = new com.rockstargames.gtav.web.buttons.ButtonManager();
      this.SET_BROWSER_SKIN(0);
      this.browserHistoryStatus = "new";
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CURSOR = this.TIMELINE.attachMovie("mouse_cursor","CURSOR",70);
      this.CURSOR.topmostLevel = true;
      this.CURSOR._x = 640;
      this.CURSOR._y = 360;
      this.CURSOR._xscale = 150;
      this.CURSOR._yscale = 150;
      this.SCROLLBAR = this.TIMELINE.createEmptyMovieClip("SCROLLBAR",60);
      this.SCROLLBAR._alpha = 0;
      this.GUTTER = this.SCROLLBAR.attachMovie("GUTTER","gutter",this.SCROLLBAR.getNextHighestDepth(),{_x:1068,_y:this.TOOLBAR._y + 45});
      this.GUTTER._height = 627;
      this.SCRUBBER = this.SCROLLBAR.attachMovie("SCRUBBER","scrubber",this.SCROLLBAR.getNextHighestDepth(),{_x:this.GUTTER._x,_y:this.GUTTER._y});
      this.pageHeight = 627;
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_HISTORY_EXPIRED",this.CONTENT.expired.dataExpired2TF);
      this.historyExpiredMessage = this.CONTENT.expired.dataExpired2TF.text;
      this.CONTENT.expired.dataExpired2TF.text = "";
   }
   function setFlags(flagIndex, flagValue)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,flagIndex,flagValue);
   }
   function setScrollBarVisibility(isVisible)
   {
      if(isVisible && this.CONTENT.expired._visible == false)
      {
         if(this.SCROLLBAR._alpha > 0 && this.SCROLLBAR._alpha < 100)
         {
            this.remove_tween(this.SCROLLBAR);
         }
         this.SCROLLBAR._alpha = 100;
         if(this.SCROLLBAR != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.SCROLLBAR,0.75,{_alpha:0,delay:0.25,onComplete:this.remove_tween,onCompleteScope:this,onCompleteArgs:[this.SCROLLBAR]});
         }
      }
      else if(this.SCROLLBAR._alpha > 0)
      {
         this.remove_tween(this.SCROLLBAR);
         this.SCROLLBAR._alpha = 0;
      }
   }
   function SCROLL_WEBPAGE_PIXELS(amount)
   {
      var _loc10_ = this.TIMELINE[this.movieClipName].CONTENT._y;
      var _loc2_ = this.TIMELINE[this.movieClipName].CONTENT._y - amount;
      if(_loc2_ > 0)
      {
         _loc2_ = 0;
      }
      var _loc3_ = this.pageHeight - 627;
      if(_loc2_ < - _loc3_)
      {
         _loc2_ = - _loc3_;
      }
      this.TIMELINE[this.movieClipName].CONTENT._y = _loc2_;
      if(this.TIMELINE[this.movieClipName].CONTENT.LOS_D_SANTOS.MapContainer != undefined)
      {
         if(_loc3_ == 0)
         {
            this.RESIZE_WEBSITE();
         }
         this.TIMELINE[this.movieClipName].CONTENT.LOS_D_SANTOS.MapContainer._y = 304 + Math.abs(_loc2_);
      }
      var _loc4_ = this.GUTTER._height;
      var _loc5_ = this.pageHeight - _loc4_;
      var _loc7_ = 1 - _loc5_ / this.pageHeight;
      this.SCRUBBER._height = Math.round(_loc7_ * _loc4_);
      var _loc6_ = - this.TIMELINE[this.movieClipName].CONTENT._y;
      var _loc11_ = _loc6_ / _loc5_ * 100;
      var _loc8_ = (_loc4_ - this.SCRUBBER._height) / 100;
      var _loc9_ = _loc11_ * _loc8_;
      this.SCRUBBER._y = this.GUTTER._y + _loc9_;
      if(_loc10_ != _loc2_)
      {
         this.setScrollBarVisibility(true);
      }
   }
   function PARSE_FILENAME_TO_TEXT(inputString)
   {
      var _loc2_ = "";
      inputString = inputString.split("_S_").join("/");
      inputString = inputString.split("_D_").join("-");
      inputString = inputString.split("_").join(".");
      _loc2_ = inputString.toLowerCase();
      return _loc2_;
   }
   function PARSE_TEXT_TO_FILENAME(inputString)
   {
      var _loc2_ = "";
      inputString = inputString.split(".").join("_");
      inputString = inputString.split("/").join("_S_");
      inputString = inputString.split("-").join("_D_");
      _loc2_ = inputString.toUpperCase();
      return _loc2_;
   }
   function UPDATE_TOOLBAR_BUTTONS()
   {
      if(this.browserHistoryIndex == 0)
      {
         if(this.TOOLBAR.button_back != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.TOOLBAR.button_back,200,200,200,50);
         }
         this.TOOLBAR.button_back.disabled = true;
      }
      else
      {
         if(this.TOOLBAR.button_back != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.TOOLBAR.button_back,255,255,255,100);
         }
         this.TOOLBAR.button_back.disabled = false;
      }
      if(this.browserHistoryIndex >= this.browserHistory.length - 1)
      {
         if(this.TOOLBAR.button_forward != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.TOOLBAR.button_forward,200,200,200,50);
         }
         this.TOOLBAR.button_forward.disabled = true;
      }
      else
      {
         if(this.TOOLBAR.button_forward != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.TOOLBAR.button_forward,255,255,255,100);
         }
         this.TOOLBAR.button_forward.disabled = false;
      }
   }
   function GO_FORWARD()
   {
      this.REMOVE_LIST();
      var _loc2_;
      if(this.keyboardFocus != "")
      {
         this.HIDE_KEYBOARD();
      }
      else if(this.browserHistoryIndex < this.browserHistory.length - 1)
      {
         this.browserHistoryIndex = this.browserHistoryIndex + 1;
         _loc2_ = this.browserHistory[this.browserHistoryIndex];
         this.browserHistoryStatus = "old";
         if(this.browserHistoryCanStore[this.browserHistoryIndex] == true)
         {
            this.GO_TO_WEBPAGE(_loc2_);
         }
         else
         {
            this.SHOW_DATA_EXPIRED_ERROR(_loc2_);
         }
         this.setFlags(1,1);
      }
      else
      {
         this.browserHistoryStatus = "new";
         this.setFlags(1,1);
      }
   }
   function GO_BACK()
   {
      this.REMOVE_LIST();
      var _loc3_;
      var _loc2_;
      var _loc4_;
      if(this.suppressBackButton != true)
      {
         if(this.keyboardFocus != "")
         {
            this.HIDE_KEYBOARD();
            if(this.browserHistoryIndex > 0)
            {
               this.setFlags(1,1);
            }
            else
            {
               this.setFlags(1,0);
            }
         }
         else if(this.browserHistoryIndex > 0)
         {
            _loc3_ = new Array("WWW_BAWSAQ_COM_S_STOCK_PORTFOLIO_EMPTY","WWW_LCN_D_EXCHANGE_COM_S_STOCK_PORTFOLIO_EMPTY","WWW_BAWSAQ_COM_S_ERROR","WWW_LCN_D_EXCHANGE_COM_S_ERROR","WWW_EPSILONPROGRAM_COM_S_TRANSACTION_D_FAILED");
            _loc2_ = 0;
            while(_loc2_ < _loc3_.length)
            {
               if(this.browserHistory[this.browserHistoryIndex] == _loc3_[_loc2_])
               {
                  this.browserHistoryIndex = this.browserHistoryIndex - 1;
                  break;
               }
               _loc2_ = _loc2_ + 1;
            }
            this.browserHistoryIndex = this.browserHistoryIndex - 1;
            _loc4_ = this.browserHistory[this.browserHistoryIndex];
            this.browserHistoryStatus = "old";
            if(this.browserHistoryCanStore[this.browserHistoryIndex] == true)
            {
               this.GO_TO_WEBPAGE(_loc4_);
            }
            else
            {
               this.SHOW_DATA_EXPIRED_ERROR(_loc4_);
            }
            this.setFlags(1,1);
         }
         else
         {
            this.setFlags(1,0);
         }
      }
   }
   function ADD_URL_ARGS_TO_HISTORY(searchResults)
   {
      if(this.browserHistoryIndex == this.browserHistory.length - 1)
      {
         this.browserHistorySearchArgs[this.browserHistoryIndex] = searchResults.join("&");
         this.updateAddressBarText(this.fullURL);
      }
   }
   function UPDATE_HISTORY_AND_ADDRESS(website)
   {
      if(website != "WWW_EYEFIND_INFO_S_SEARCH")
      {
         if(this.browserHistory[this.browserHistory.length - 1] == website)
         {
            this.browserHistoryStatus = "old";
         }
      }
      if(this.browserHistoryStatus == "old")
      {
         this.browserHistoryStatus = "new";
      }
      else
      {
         this.browserHistory.push(this.PARSE_TEXT_TO_FILENAME(website));
         this.browserHistoryCanStore.push(this.CanStoreThisPage);
         this.browserHistorySearchArgs.push(undefined);
         this.browserHistoryIndex = this.browserHistory.length - 1;
      }
      this.setFlags(2,this.browserHistory.length);
      this.UPDATE_TOOLBAR_BUTTONS();
   }
   function buttonActionSetHistory()
   {
      if(this.TOOLBAR.listContainer == undefined)
      {
         this.MAKE_LIST(this.browserHistory,"history");
      }
   }
   function buttonActionSetBrowserList(buttonIndex)
   {
      var _loc2_;
      if(this.objType == 15)
      {
         this.browserHistoryIndex = buttonIndex;
         this.REMOVE_LIST();
         _loc2_ = this.browserHistory[this.browserHistoryIndex];
         this.browserHistoryStatus = "old";
         if(this.browserHistoryIndex > 0)
         {
            this.setFlags(1,1);
         }
         else
         {
            this.setFlags(1,0);
         }
         if(this.browserHistoryCanStore[this.browserHistoryIndex] == true)
         {
            this.GO_TO_WEBPAGE(_loc2_);
         }
         else
         {
            this.SHOW_DATA_EXPIRED_ERROR(_loc2_);
         }
      }
   }
   function setCloseBrowserFlag()
   {
      this.setFlags(5,1);
   }
   function GO_TO_WEBPAGE_ID(siteId, pageId)
   {
      this.GO_TO_WEBPAGE(com.rockstargames.gtav.web.DynamicSiteContants.GetDynamicSiteContant(siteId,pageId));
   }
   function GO_TO_WEBPAGE(websiteString)
   {
      flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,"WEB_BROWSER");
      if(this.loadingWebPage == true)
      {
         return undefined;
      }
      this.setScrollBarVisibility(false);
      this.CLEAR_HIGHLIGHTS();
      this.CONTENT.expired._visible = false;
      var _loc5_ = false;
      var _loc3_;
      var _loc2_;
      if(this.player == 1)
      {
         _loc3_ = new Array("WWW_BLEETER_BIZ","WWW_FLEECA_COM","WWW_HUSHSMUSH_COM","WWW_IWILLSURVIVEITALL_COM","WWW_LCN_D_EXCHANGE_COM","WWW_THEBANKOFLIBERTY_COM","WWW_THEREALITYMILL_COM");
         _loc2_ = 0;
         while(_loc2_ < _loc3_.length)
         {
            if(_loc3_[_loc2_] == websiteString)
            {
               _loc5_ = true;
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
      var _loc8_;
      var _loc6_;
      var _loc7_;
      if(websiteString != undefined && websiteString != "" && _loc5_ == false)
      {
         if(this.browserHistorySearchArgs[this.browserHistoryIndex] != undefined)
         {
            this.searchArgs = this.browserHistorySearchArgs[this.browserHistoryIndex];
         }
         if(websiteString.substring(0,4) != "WWW_")
         {
            _loc8_ = this.movieClipName + "_S_" + websiteString;
            websiteString = _loc8_;
         }
         _loc6_ = websiteString.split("_S_",2);
         this.movieClipName = _loc6_[0];
         this.pageName = _loc6_[1];
         if(this.pageName == undefined)
         {
            this.pageName = "PAGE1";
         }
         this.REMOVE_LIST();
         this.HIDE_KEYBOARD();
         this.SET_CURSOR_STATE("BUSY");
         if(this.keyboardFocus != "address_box")
         {
            this.TOOLBAR.address_box.addressText.text = this.PARSE_FILENAME_TO_TEXT(websiteString);
         }
         if(this.currentlyLoaded != this.movieClipName)
         {
            if(this.currentlyLoaded != null)
            {
               this.REQUEST_REMOVE_WEBSITE(this.currentlyLoaded);
            }
            this.resetScroll = true;
            this.CURSOR.CursorMove(0,0);
            _loc7_ = this.nextID++;
            com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + _loc7_] = this.movieClipName;
            this.SET_CURRENT_SELECTION(-1);
            this.REQUEST_STREAM(_loc7_,this.movieClipName);
         }
         else
         {
            this.INITIALISE_WEBSITE();
         }
      }
      else
      {
         this.SHOW_ERROR_PAGE();
      }
   }
   function SHOW_ERROR_PAGE()
   {
      this.GO_TO_WEBPAGE("WWW_EYEFIND_INFO_S_ERROR");
   }
   function SHOW_DATA_EXPIRED_ERROR(_website)
   {
      this.TIMELINE[this.movieClipName].CONTENT._visible = false;
      if(this.keyboardFocus != "address_box")
      {
         this.TOOLBAR.address_box.addressText.text = this.PARSE_FILENAME_TO_TEXT(_website);
      }
      this.CONTENT.expired.dataExpired1TF.text = this.PARSE_FILENAME_TO_TEXT(_website);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WEB_DATA_EXPIRED",this.CONTENT.expired.dataExpired2TF);
      this.DISABLE_ALL_BUTTONS();
      this.setScrollBarVisibility(false);
      this.CONTENT.expired._visible = true;
   }
   function INITIALISE_WEBSITE()
   {
      flash.external.ExternalInterface.call("FORCE_GARBAGE_COLLECTION",0,"WEB_BROWSER");
      this.setFlags(1,1);
      this.ENABLE_ALL_BUTTONS();
      this.loadingWebPage = false;
      this.remove_tween(this.TIMELINE[this.movieClipName].CONTENT);
      this.isLastWebsite = false;
      this._currentSelectedButton = null;
      this.doesPageExist = this.GET_PAGE_ID();
      var _loc3_ = this.doesPageExist;
      com.rockstargames.ui.game.GameInterface.call("SET_CURRENT_WEBPAGE_ID",com.rockstargames.ui.game.GameInterface.WEB_TYPE,_loc3_,this.WEB_BROWSER_FILENAME);
      var _loc2_ = this.GET_SITE_ID();
      com.rockstargames.ui.game.GameInterface.call("SET_CURRENT_WEBSITE_ID",com.rockstargames.ui.game.GameInterface.WEB_TYPE,_loc2_,this.WEB_BROWSER_FILENAME);
      if(this.doesPageExist == -1)
      {
         this.SHOW_ERROR_PAGE();
      }
      else
      {
         this.TIMELINE[this.movieClipName].CONTENT.gotoAndStop(this.pageName);
         this.TIMELINE[this.movieClipName].CONTENT._visible = true;
         this.TIMELINE[this.movieClipName].CONTENT.BOUNDING_BOX._visible = false;
      }
      if(this.pageName != "PAGE1")
      {
         this.fullURL = this.movieClipName + "_S_" + this.pageName;
      }
      else
      {
         this.fullURL = this.movieClipName;
      }
      if(this.browserHistoryIndex + 1 < this.browserHistory.length && this.browserHistoryStatus == "new")
      {
         this.browserHistory.splice(this.browserHistoryIndex + 1);
         this.browserHistoryCanStore.splice(this.browserHistoryIndex + 1);
         this.browserHistorySearchArgs.splice(this.browserHistoryIndex + 1);
         this.browserHistoryIndex = this.browserHistory.length - 1;
      }
      if(this.browserHistory.length > 20)
      {
         this.browserHistory.shift();
         this.browserHistoryCanStore.shift();
         this.browserHistorySearchArgs.shift();
         this.browserHistoryIndex = this.browserHistory.length - 1;
      }
      this.UPDATE_HISTORY_AND_ADDRESS(this.fullURL);
      this.updateAddressBarText(this.fullURL);
      if(this.DebugTextContent == true)
      {
         this.UPDATE_TEXT(true);
      }
   }
   function updateAddressBarText(url)
   {
      var _loc2_ = url;
      var _loc3_;
      if(this.browserHistorySearchArgs[this.browserHistoryIndex] != undefined && this.browserHistorySearchArgs[this.browserHistoryIndex] != "")
      {
         _loc3_ = this.browserHistorySearchArgs[this.browserHistoryIndex].split("&");
         _loc2_ += "+" + _loc3_[0];
      }
      if(this.keyboardFocus != "address_box")
      {
         this.TOOLBAR.address_box.addressText.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.TOOLBAR.address_box.addressText,this.PARSE_FILENAME_TO_TEXT(_loc2_));
      }
      else if(this.keyboardFocus == "address_box")
      {
         this.keyboardField = this.TOOLBAR.address_box.addressText;
         this.keyboardField.text = "";
      }
   }
   function UPDATE_TEXT(newPage)
   {
      if(newPage == undefined)
      {
         newPage = false;
      }
      this.searchArgs = this.browserHistorySearchArgs[this.browserHistoryIndex];
      this.TIMELINE[this.movieClipName].TIMELINE.POPULATE_TEXT(this.pageName,this.searchArgs,newPage);
      this.RESIZE_WEBSITE();
      this.hitTestButtons(0,0);
      this.hitTestButtons(this.CURSOR._x,this.CURSOR._y);
      this.resetScroll = this.TIMELINE[this.movieClipName].TIMELINE.resetScroll;
      var _loc2_;
      if(this.TIMELINE[this.movieClipName].CONTENT._y < 0)
      {
         _loc2_ = this.TIMELINE[this.movieClipName].CONTENT._y + this.TIMELINE[this.movieClipName].CONTENT.BOUNDING_BOX._height;
         if(this.resetScroll == true)
         {
            if(_loc2_ < 627)
            {
               this.TIMELINE[this.movieClipName].CONTENT._y = 0;
            }
         }
         else if(_loc2_ < 627)
         {
            this.TIMELINE[this.movieClipName].CONTENT._y = - this.TIMELINE[this.movieClipName].CONTENT.BOUNDING_BOX._height + 627;
         }
      }
   }
   function RESIZE_WEBSITE()
   {
      this.pageHeight = this.TIMELINE[this.movieClipName].CONTENT.BOUNDING_BOX._height;
      if(this.pageHeight < 627)
      {
         this.pageHeight = 627;
      }
   }
   function IS_SITE_DYNAMIC()
   {
      return this.currentWebsite.IS_SITE_DYNAMIC;
   }
   function REQUEST_STREAM(uid, filename)
   {
      if(com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + uid] != com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + this.currentUID])
      {
         this.currentUID = uid;
         clearInterval(this.loadingTimoutID);
         this.loadingTimoutID = setInterval(this,"pingTimer",3000);
         if(this.shutdown == false)
         {
            this.loadingWebPage = true;
            com.rockstargames.ui.game.GameInterface.call("REQUEST_GFX_STREAM",com.rockstargames.ui.game.GameInterface.WEB_TYPE,uid,filename,this.WEB_BROWSER_FILENAME);
         }
      }
   }
   function pingTimer()
   {
      this.STREAM_RESPONSE_FAILED(this.currentUID);
   }
   function STREAM_RESPONSE_FAILED(uid)
   {
      var _loc3_ = com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + uid];
      clearInterval(this.loadingTimoutID);
      delete com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + uid];
      this.loadingWebPage = false;
      this.SHOW_ERROR_PAGE();
   }
   function STREAM_RESPONSE(uid, fileToLoad)
   {
      clearInterval(this.loadingTimoutID);
      var _loc5_ = com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + uid];
      var _loc4_ = com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + this.currentUID];
      if(this.currentUID != uid)
      {
         this.REQUEST_REMOVE_WEBSITE(fileToLoad);
         delete com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + uid];
      }
      else if(this.shutdown == false)
      {
         this.LOAD_CLIP(com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + uid],fileToLoad);
         delete com.rockstargames.gtav.web.WEB_BROWSER.streamResponseHash["RH" + uid];
      }
   }
   function LOAD_CLIP(params, fileToLoad)
   {
      this.movieClipName = fileToLoad;
      this.TIMELINE.createEmptyMovieClip(this.movieClipName,10);
      var _loc3_ = this.movieClipName;
      this.TIMELINE[this.movieClipName]._y = this.contentY;
      this.TIMELINE[this.movieClipName]._x = this.contentX;
      this.web_loader.removeListener(this);
      this.web_loader = new MovieClipLoader();
      this.web_loader.addListener(this);
      this.web_loader.loadClip(fileToLoad,this.TIMELINE[this.movieClipName]);
   }
   function onLoadInit(target_mc)
   {
      this.web_loader.removeListener(this);
      this.web_loader = null;
      this.currentlyLoaded = this.movieClipName;
      this.currentWebsite = target_mc.TIMELINE;
      com.rockstargames.ui.game.GameInterface.call("GFX_READY",com.rockstargames.ui.game.GameInterface.WEB_TYPE,this.movieClipName);
      this.loadingWebPage = false;
   }
   function onLoadError(target_mc)
   {
      this.web_loader.removeListener(this);
      this.web_loader = null;
      this.userTextEntry = target_mc._name;
      this.loadingWebPage = false;
      this.currentlyLoaded = null;
      this.SHOW_ERROR_PAGE();
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         this.currentWebsite.TXD_HAS_LOADED(textureDict,success,uniqueID);
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      this.currentWebsite.TXD_HAS_LOADED(textureDict,true,uniqueID);
   }
   function REMOVE_CHILD_MOVIE(whichMC)
   {
      this.currentlyLoaded = null;
   }
   function REQUEST_REMOVE_WEBSITE(whichMC)
   {
      if(whichMC != undefined && whichMC != null)
      {
         this.TIMELINE[whichMC].TIMELINE.CLEANUP();
         this.SET_DATA_SLOT_EMPTY();
         this.TIMELINE[whichMC].removeMovieClip();
         com.rockstargames.ui.game.GameInterface.call("REQUEST_REMOVAL",com.rockstargames.ui.game.GameInterface.WEB_TYPE,whichMC);
         delete com.rockstargames.gtav.web[whichMC];
      }
      this.currentlyLoaded = null;
      this.cleanupButtons();
      this.SET_TITLEBAR_TEXT("");
      this.DebugTextContent = false;
      this.SUPRESS_HISTORY(false);
   }
   function SHUTDOWN_MOVIE()
   {
      this.shutdown = true;
      this.browserHistory = [];
      this.buttonManager.clearEverything();
      if(this.TIMELINE[this.movieClipName].CONTENT != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.TIMELINE[this.movieClipName].CONTENT);
      }
      this.REQUEST_REMOVE_WEBSITE(this.movieClipName);
      if(this.CURSOR != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CURSOR);
      }
      if(this.TOOLBAR.toolbarWhiteOutMC != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.TOOLBAR.toolbarWhiteOutMC);
      }
      if(this.SCROLLBAR != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.SCROLLBAR);
      }
      if(this.HIGHLIGHT != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.HIGHLIGHT);
      }
      if(this.keyboardContainer != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.keyboardContainer);
      }
      this.HIDE_KEYBOARD();
      var _loc2_;
      if(this.loadingWebPage == true)
      {
         _loc2_ = 300;
         while(this.loadingWebPage == true)
         {
            _loc2_ = _loc2_ - 1;
            if(_loc2_ < 1)
            {
               break;
            }
         }
      }
      if(this.TIMELINE[this.currentlyLoaded] != undefined)
      {
         this.TIMELINE[this.currentlyLoaded].dataTextScope = [];
         this.REQUEST_REMOVE_WEBSITE(this.currentlyLoaded);
         _loc2_ = 100;
         while(this.TIMELINE[this.currentlyLoaded] != undefined)
         {
            _loc2_ = _loc2_ - 1;
            if(_loc2_ < 1)
            {
               break;
            }
         }
      }
      this.isLastWebsite = true;
   }
   function SET_CURRENT_OBJECT_TYPE(currentObj)
   {
      this.objType = currentObj;
   }
   function SET_CURSOR_STATE(state)
   {
      if(state != this.cursorState)
      {
         this.cursorState = state;
         if(this.loadingWebPage == true)
         {
            this.cursorState = "BUSY";
         }
         if(this.cursorState == "BUSY")
         {
            this.CURSOR.gotoAndPlay(this.cursorState);
         }
         else
         {
            this.CURSOR.gotoAndStop(this.cursorState);
         }
      }
   }
   function GET_CURSOR_STATE()
   {
      return this.cursorState;
   }
   function SHOW_CURSOR(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      if(vis == true)
      {
         clearInterval(this.cursorInterval);
         this.SET_CURSOR_STATE("ARROW");
         this.CURSOR._visible = true;
      }
      else
      {
         clearInterval(this.cursorInterval);
         this.cursorInterval = setInterval(this,"setCursorBusy",500);
      }
      if(this.keyboardFocus == "address_box")
      {
         this.CURSOR._visible = false;
      }
   }
   function setCursorBusy()
   {
      this.SET_CURSOR_STATE("BUSY");
      clearInterval(this.cursorInterval);
      this.cursorInterval = setInterval(this,"setCursorInvisabile",1000);
   }
   function setCursorInvisabile()
   {
      clearInterval(this.cursorInterval);
      this.CURSOR._visible = false;
   }
   function SHOW_BACKGROUND(vis)
   {
      if(vis == undefined)
      {
         vis = true;
      }
      this.TIMELINE.browserBackground._visible = vis;
   }
   function createKeyboard(focus)
   {
      this.BrowserKeyBoard = new com.rockstargames.gtav.web.BrowserKeyboard();
      this.currentInterface = this.BrowserKeyBoard;
      this.keyboardFocus = focus;
      if(this.keyboardContainer != undefined)
      {
         this.keyboardContainer.removeMovieClip();
      }
      this.keyboardContainer = this.TIMELINE.attachMovie("keyboardBackground","keyboardBackground",65,{_x:0,_y:730});
      this.keyboardContainer._width = 1280;
      this.keyboardContainer._height = 364;
      this.BrowserKeyBoard.dataProviderUI = this.BROWSER_KEYBOARD_SET;
      this.SHOW_KEYBOARD();
   }
   function setKeyboard(keyboardType)
   {
      if(this.keyboardContainer == undefined)
      {
         this.createKeyboard(keyboardType);
      }
      else
      {
         this.ENTER_TEXT(this.BROWSER_KEYBOARD_SET[this.currentInterface.currentSelection]);
      }
   }
   function SHOW_KEYBOARD()
   {
      var _loc5_ = new Array(255,255,255);
      var _loc4_ = new Array(190,190,190);
      this.setFlags(0,1);
      this.CURSOR._visible = false;
      this.BrowserKeyBoard._name = "KEYBOARD";
      this.BrowserKeyBoard.numberOfColumns = 10;
      this.BrowserKeyBoard.numberOfRows = 5;
      this.BrowserKeyBoard.levelDepth = 10;
      this.BrowserKeyBoard.columnSpace = 4;
      this.BrowserKeyBoard.rowSpace = 4;
      this.BrowserKeyBoard.offsetX = 6;
      this.BrowserKeyBoard.offsetY = -34;
      this.BrowserKeyBoard.primaryColour = _loc5_;
      this.BrowserKeyBoard.secondaryColour = _loc4_;
      this.BrowserKeyBoard.construct(this.keyboardContainer,"keyMC");
      this.BrowserKeyBoard.container._visible = true;
      if(this.keyboardContainer != undefined)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.keyboardContainer,0.25,{_y:this.keyboardYposition,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.remove_tween,onCompleteScope:this,onCompleteArgs:[this.keyboardContainer]});
      }
      var _loc2_;
      if(this.keyboardFocus == "address_box")
      {
         this.keyboardField = this.TOOLBAR.address_box.addressText;
         this.keyboardField.text = "";
         _loc2_ = this.keyboardField._y + this.keyboardField._height / 2;
      }
      else if(this.objType == 5 || this.objType == 8 || this.objType == 9)
      {
         this.keyboardField = this._currentSelectedTarget.btnTxt;
         this.keyboardField.text = "";
         if(this.objType == 9)
         {
            this.keyboardField.password = true;
         }
         _loc2_ = this.TOOLBAR._y + this.TIMELINE[this.movieClipName].CONTENT._y + this.keyboardField._parent._y + this.keyboardField._y + 8;
      }
      this.keyboardFieldOriginalColour = this.keyboardField.textColor;
      this.keyboardField.textColor = 0;
      this.prevContentY = this.TIMELINE[this.movieClipName].CONTENT._y;
      var _loc3_;
      var _loc6_;
      if(_loc2_ > this.keyboardYposition - this.safeFrameY)
      {
         _loc3_ = this.keyboardYposition - _loc2_ - (this.safeFrameY + 26);
         _loc6_ = this.TIMELINE[this.movieClipName].CONTENT._y + _loc3_;
         this.setScrollBarVisibility(false);
         if(this.TIMELINE[this.movieClipName].CONTENT != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.TIMELINE[this.movieClipName].CONTENT,0.25,{_y:_loc6_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.remove_tween,onCompleteScope:this,onCompleteArgs:[this.TIMELINE[this.movieClipName].CONTENT]});
         }
      }
   }
   function HIDE_KEYBOARD()
   {
      var _loc2_ = 0;
      if(this.currentInterface == this.BrowserKeyBoard)
      {
         _loc2_ = 1;
         if(this.keyboardContainer != undefined)
         {
            this.keyboardContainer.removeMovieClip();
            this.keyboardContainer = undefined;
         }
         if(this.resetToPrevContentY)
         {
            if(this.prevContentY != this.TIMELINE[this.movieClipName].CONTENT._y)
            {
               if(this.TIMELINE[this.movieClipName].CONTENT != undefined)
               {
                  com.rockstargames.ui.tweenStar.TweenStarLite.to(this.TIMELINE[this.movieClipName].CONTENT,0.25,{_y:this.prevContentY,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.remove_tween,onCompleteScope:this,onCompleteArgs:[this.TIMELINE[this.movieClipName].CONTENT]});
               }
            }
         }
         if(this.keyboardFocus == "address_box")
         {
            this.keyboardFocus = "";
            this.updateAddressBarText(this.fullURL);
         }
         this.keyboardField.textColor = this.keyboardFieldOriginalColour;
         this.keyboardFocus = "";
         this.keyboardField = undefined;
         this.CURSOR._visible = true;
         this.setFlags(0,0);
         this.setFlags(1,1);
      }
   }
   function SET_PC_KEY(_key)
   {
      var _loc2_;
      if(this.keyboardFocus != "")
      {
         _loc2_ = this.BrowserKeyBoard.set_pc_key(_key.toUpperCase());
      }
      if(_loc2_)
      {
         this.ENTER_TEXT(_key.toUpperCase());
      }
   }
   function ENTER_TEXT(inputString)
   {
      var _loc2_;
      if(inputString != undefined)
      {
         switch(inputString)
         {
            case "ENTER":
               if(this.keyboardFocus == "address_box" || this._currentSelectedTarget.buttonType == com.rockstargames.gtav.constants.WebBrowserButtonLUT.ADDRESS_BOX)
               {
                  this.resetToPrevContentY = false;
                  this.userTextEntry = this.PARSE_TEXT_TO_FILENAME(this.TOOLBAR.address_box.addressText.text);
                  if(this.userTextEntry.substring(0,4) != "WWW_")
                  {
                     this.userTextEntry = "WWW_" + this.userTextEntry;
                  }
                  _loc2_ = this.userTextEntry;
               }
               else if(this.keyboardFocus == "TEXT_search_box" || this._currentSelectedTarget.buttonType == com.rockstargames.gtav.constants.WebBrowserButtonLUT.SEARCH_BOX)
               {
                  this.resetToPrevContentY = false;
                  this.userTextEntry = this._currentSelectedTarget.btnTxt.text;
                  if(this.userTextEntry == "")
                  {
                     this.HIDE_KEYBOARD();
                     return;
                  }
                  _loc2_ = this.currentWebsite._name + "_S_SEARCH";
               }
               else if(this.keyboardFocus == "TEXT_BOX" || this._currentSelectedTarget.buttonType == com.rockstargames.gtav.constants.WebBrowserButtonLUT.TEXT_BOX)
               {
                  this.resetToPrevContentY = true;
                  this.userTextEntry = this._currentSelectedTarget.btnTxt.text;
                  _loc2_ = "";
               }
               else if(this.keyboardFocus == "PASSWORD_TEXT_BOX" || this._currentSelectedTarget.buttonType == com.rockstargames.gtav.constants.WebBrowserButtonLUT.PASSWORD_TEXT_BOX)
               {
                  this.resetToPrevContentY = true;
                  this.userTextEntry = this._currentSelectedTarget.btnTxt.text;
                  _loc2_ = "";
               }
               if(_loc2_.length > 0)
               {
                  this.GO_TO_WEBPAGE(_loc2_);
                  return;
               }
               this.HIDE_KEYBOARD();
               return;
               break;
            case "BACKSPACE":
               if(this.keyboardField.text.length > 0)
               {
                  this.keyboardField.text = this.keyboardField.text.slice(0,this.keyboardField.text.length - 1);
                  this.ALIGN_TEXTFIELD(this.keyboardField);
                  return;
               }
               return;
               break;
            default:
               if(this._currentSelectedTarget.numberBox && isNaN(Number(inputString)))
               {
                  return undefined;
               }
               if(this._currentSelectedTarget.charLimit != undefined && this._currentSelectedTarget.charLimit <= this.keyboardField.text.length)
               {
                  return undefined;
               }
               if(this.keyboardField.textWidth >= this.keyboardField._width - 10)
               {
                  return undefined;
               }
               this.CONTENT.expired.dataExpired1TF.text = inputString;
               if(this.keyboardField.textWidth + this.CONTENT.expired.dataExpired1TF.textWidth >= this.keyboardField._width - 10)
               {
                  return undefined;
               }
               this.keyboardField.text += inputString.toLowerCase();
               return;
         }
      }
   }
   function ALIGN_TEXTFIELD(targetTextfield)
   {
      var _loc3_;
      if(targetTextfield.textWidth > targetTextfield._width - 8)
      {
         _loc3_ = targetTextfield.text;
         targetTextfield.text += " ";
         targetTextfield.hscroll = targetTextfield.maxhscroll;
         targetTextfield.text = _loc3_;
      }
      else
      {
         targetTextfield.hscroll = 0;
      }
      this.keyboardField.autoSize = false;
   }
   function ALIGN_TOOLBAR_TEXTFIELDS()
   {
   }
   function MAKE_LIST(listArray)
   {
      var _loc7_;
      var _loc13_;
      var _loc11_;
      var _loc14_;
      var _loc4_;
      var _loc16_;
      var _loc15_;
      var _loc3_;
      var _loc2_;
      var _loc8_;
      var _loc5_;
      var _loc9_;
      if(listArray.length > 0)
      {
         if(this.TOOLBAR.listContainer != undefined)
         {
            this.TOOLBAR.listContainer.removeMovieClip();
         }
         _loc7_ = this.TOOLBAR.createEmptyMovieClip("listContainer",56);
         _loc14_ = 25;
         _loc13_ = this.TOOLBAR.button_history._x;
         _loc11_ = this.TOOLBAR.button_history._y + 32;
         _loc7_._name = "listContainer";
         this.buttonManager.clearBrowserList();
         _loc16_ = _loc7_.attachMovie("shadowMC","shadowMC",_loc7_.getNextHighestDepth(),{_alpha:0,_x:_loc13_,_y:_loc11_});
         _loc15_ = _loc7_.attachMovie("generic_square","outline",_loc7_.getNextHighestDepth(),{_alpha:0,_x:_loc13_,_y:_loc11_});
         _loc3_ = 0;
         while(_loc3_ < listArray.length)
         {
            _loc2_ = listArray.length - 1 - _loc3_;
            if(listArray[_loc2_] != undefined)
            {
               _loc4_ = _loc7_.attachMovie("btn_list","BROWSER_LIST_ITEM_" + _loc3_,_loc7_.getNextHighestDepth(),{_x:_loc13_,_y:_loc14_ * _loc3_ + _loc11_});
               _loc4_.highlight._alpha = 0;
               _loc8_ = com.rockstargames.gtav.web.buttons.WebBrowserListItem(_loc4_);
               _loc5_ = listArray[_loc2_];
               if(this.browserHistoryCanStore[_loc2_] == false)
               {
                  _loc5_ += " " + this.historyExpiredMessage;
               }
               else if(this.browserHistorySearchArgs[_loc2_] != undefined)
               {
                  _loc9_ = this.browserHistorySearchArgs[_loc2_].split("&");
                  _loc5_ += "+" + _loc9_[0];
               }
               _loc8_.initButton(this.PARSE_FILENAME_TO_TEXT(_loc5_),_loc2_);
               if(_loc2_ == this.browserHistoryIndex)
               {
                  _loc4_.highlight._alpha = 4;
               }
               this.buttonManager.updateBrowserList(_loc4_,_loc3_);
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc15_._width = _loc7_._width + 2;
         _loc15_._height = listArray.length * _loc14_ + 2;
         _loc15_._x = _loc13_ - 1;
         _loc15_._y = _loc11_ - 1;
         if(_loc15_ != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(_loc15_,80,80,80,100);
         }
         _loc16_._width = _loc7_._width;
         _loc16_._height = _loc7_._height;
         _loc16_._x = _loc13_ + 4;
         _loc16_._y = _loc11_ + 4;
         _loc16_._alpha = 50;
      }
   }
   function REMOVE_LIST()
   {
      if(this.TOOLBAR.listContainer != undefined)
      {
         this.TOOLBAR.listContainer.removeMovieClip();
      }
      this.buttonManager.clearBrowserList();
   }
   function SEARCH_ARRAY(arrayData, stringToFind)
   {
      var _loc1_ = 0;
      while(_loc1_ < arrayData.length)
      {
         if(arrayData[_loc1_] == stringToFind)
         {
            return true;
         }
         _loc1_ = _loc1_ + 1;
      }
      return false;
   }
   function handleControllerInput()
   {
      var _loc2_ = Key.getCode();
      switch(_loc2_)
      {
         case 38:
            this.SET_INPUT_EVENT(8);
            break;
         case 39:
            this.SET_INPUT_EVENT(11);
            break;
         case 40:
            this.SET_INPUT_EVENT(9);
            break;
         case 37:
            this.SET_INPUT_EVENT(10);
            break;
         case 109:
            this.SET_INPUT_EVENT(14);
            break;
         case 32:
            this.SET_INPUT_EVENT(16);
            break;
         case 17:
            this.usingLeftAnalog = false;
         default:
            return;
      }
   }
   function handleAnalogInput()
   {
      var _loc3_ = this.TIMELINE._xmouse - this.oldMouseX;
      var _loc2_ = this.TIMELINE._ymouse - this.oldMouseY;
      this.oldMouseX = this.TIMELINE._xmouse;
      this.oldMouseY = this.TIMELINE._ymouse;
      var _loc4_ = Math.sqrt(_loc3_ * _loc3_ + _loc2_ * _loc2_);
      var _loc7_ = _loc3_ / _loc4_;
      var _loc8_ = _loc2_ / _loc4_;
      var _loc6_ = _loc3_ / _loc4_ * this.cursorSpeedMultiplier;
      var _loc5_ = _loc2_ / _loc4_ * this.cursorSpeedMultiplier;
      this.SET_ANALOG_STICK_INPUT(this.usingLeftAnalog,_loc3_,_loc2_);
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case 8:
            if(this.keyboardFocus != "")
            {
               this.currentInterface.navigate("UP");
            }
            break;
         case 9:
            if(this.keyboardFocus != "")
            {
               this.currentInterface.navigate("DOWN");
            }
            break;
         case 10:
            if(this.keyboardFocus != "")
            {
               this.currentInterface.navigate("LEFT");
            }
            break;
         case 11:
            if(this.keyboardFocus != "")
            {
               this.currentInterface.navigate("RIGHT");
            }
            break;
         case 17:
            if(this.keyboardFocus != "")
            {
               this.HIDE_KEYBOARD();
            }
            break;
         case 16:
            this.SET_INPUT_SELECT();
      }
      if(this.keyboardFocus == "")
      {
         if(direction > 7 && direction < 12)
         {
            this.tab_buttons(direction);
         }
      }
   }
   function SET_INPUT_SELECT()
   {
      this.currentInterface.navigate("SELECT");
      if(this.keyboardFocus == "")
      {
         this.buttonState = "SELECT";
      }
      if(this.objType == -1)
      {
         this.buttonState = "OFF";
         if(this.keyboardFocus != "")
         {
            this.HIDE_KEYBOARD();
         }
         this.REMOVE_LIST();
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Generic","WEB_NAVIGATION_SOUNDS_PHONE");
         this.SET_CURRENT_SELECTION(-1);
      }
      else
      {
         this._currentSelectedTarget.buttonEvent();
         if(this.keyboardFocus != "")
         {
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Keyboard","WEB_NAVIGATION_SOUNDS_PHONE");
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Link","WEB_NAVIGATION_SOUNDS_PHONE");
            this.CURSOR.ScrollPage(0);
         }
      }
      if(this.objType == 16)
      {
         this.REMOVE_LIST();
      }
   }
   function SET_ANALOG_STICK_INPUT(isLeftStick, mouseX, mouseY)
   {
      this.usingLeftAnalog = isLeftStick;
      if(isLeftStick == 1)
      {
         this.MOUSE_MODE = false;
         this.CURSOR.CursorMove(mouseX / this.analogSpeedDivisor,mouseY / this.analogSpeedDivisor);
      }
      if(isLeftStick == 0)
      {
         this.CURSOR.ScrollPage(mouseY / (this.analogSpeedDivisor / 2));
      }
   }
   function SET_MOUSE_INPUT(mouseX, mouseY)
   {
      this.MOUSE_MODE = true;
      var _loc5_ = 1280;
      var _loc4_ = 720;
      if(mouseX > 0.987)
      {
         mouseX = 0.987;
      }
      if(mouseY > 0.962)
      {
         mouseY = 0.962;
      }
      this.CURSOR._x = _loc5_ * mouseX;
      this.CURSOR._y = _loc4_ * mouseY;
   }
   function tab_buttons(direction)
   {
      var _loc25_ = new Array();
      _loc25_ = this.buttonManager.buttonMCList.concat(this.buttonManager.browserButtonMCList);
      if(this.TOOLBAR.toolbarWhiteOutMC._alpha == 0)
      {
         _loc25_ = _loc25_.concat(this.buttonManager.toolbarMCList);
      }
      var _loc2_;
      var _loc9_ = this.CURSOR._x;
      var _loc8_ = this.CURSOR._y - this.safeFrameY;
      var _loc7_;
      var _loc5_;
      var _loc26_ = new Array();
      if(direction == 10 || direction == 11)
      {
         if(_loc8_ <= this.TOOLBAR._y + 45)
         {
            _loc25_ = new Array();
            _loc25_ = this.buttonManager.toolbarMCList;
         }
      }
      var _loc18_ = 0;
      var _loc12_;
      var _loc13_;
      var _loc14_;
      var _loc10_;
      var _loc17_;
      var _loc21_;
      var _loc27_;
      var _loc3_;
      var _loc28_;
      var _loc16_;
      var _loc15_;
      var _loc11_;
      var _loc4_;
      while(_loc18_ < _loc25_.length)
      {
         _loc2_ = _loc25_[_loc18_];
         _loc12_ = _loc2_._width;
         _loc13_ = _loc2_._height;
         _loc14_ = _loc12_ / 2;
         _loc10_ = _loc13_ / 2;
         if(_loc2_._parent == this.TOOLBAR)
         {
            _loc7_ = _loc2_._x;
            _loc5_ = _loc2_._y;
         }
         else
         {
            _loc17_ = this.getMinBounds(_loc2_);
            _loc21_ = this.getMaxBounds(_loc2_);
            _loc7_ = _loc17_.x;
            _loc5_ = _loc17_.y - this.safeFrameY;
            _loc12_ = _loc21_.x - _loc17_.x;
            _loc13_ = _loc21_.y - _loc17_.y;
            _loc14_ = _loc12_ / 2;
            _loc10_ = _loc13_ / 2;
         }
         _loc27_ = false;
         if(this.buttonMaskMC != undefined)
         {
            if(_loc2_._parent != this.TOOLBAR.listContainer && _loc2_.getDepth() >= 0)
            {
               if(_loc2_.hitTest(this.buttonMaskMC) == true)
               {
                  _loc27_ = true;
               }
            }
         }
         if(_loc2_ != this._currentSelectedTarget && _loc2_.disabled == false && _loc2_._alpha != 0 && _loc5_ > 0)
         {
            _loc3_ = new Array();
            _loc3_.push({DISTANCE:this.getDistance(_loc9_,_loc8_,_loc7_ + _loc14_,_loc5_ + _loc10_),BX:_loc7_ + _loc14_,BY:_loc5_ + _loc10_});
            if(direction == 8 || direction == 9)
            {
               if(_loc9_ > _loc7_ && _loc9_ < _loc7_ + _loc12_)
               {
                  _loc28_ = this.getDistance(_loc9_,_loc8_,_loc9_,_loc5_ + _loc10_);
                  _loc3_ = new Array();
                  _loc3_.push({DISTANCE:_loc28_,BX:_loc9_,BY:_loc5_ + _loc10_});
               }
            }
            if(direction == 10 || direction == 11)
            {
               if(_loc8_ > _loc5_ && _loc8_ < _loc5_ + _loc13_)
               {
                  _loc28_ = this.getDistance(_loc9_,_loc8_,_loc7_ + _loc14_,_loc8_);
                  _loc3_ = new Array();
                  _loc3_.push({DISTANCE:_loc28_,BX:_loc7_ + _loc14_,BY:_loc8_});
               }
            }
            _loc3_.sortOn("DISTANCE",Array.NUMERIC);
            _loc16_ = Math.round(this.getDistance(_loc9_,_loc8_,_loc3_[0].BX,_loc3_[0].BY));
            _loc15_ = this.getRelativeAngle(_loc9_,_loc8_,_loc3_[0].BX,_loc3_[0].BY,direction);
            _loc11_ = 20;
            while(_loc11_ < 65)
            {
               if(_loc15_ < _loc11_)
               {
                  _loc4_ = false;
                  if(_loc16_ < 25 && this._currentSelectedTarget.buttonType == 15)
                  {
                     if(_loc2_.buttonType != 15)
                     {
                        _loc4_ = true;
                     }
                  }
                  if(_loc2_._parent != this.TOOLBAR && _loc5_ + _loc10_ >= 0 && _loc5_ + _loc10_ <= 48)
                  {
                     _loc4_ = true;
                  }
                  if(_loc7_ + _loc12_ < 0 || _loc7_ > 1280 || _loc2_._y + _loc13_ < 0 || _loc2_._y > this.pageHeight)
                  {
                     _loc4_ = true;
                  }
                  if(direction == 10 || direction == 11)
                  {
                     if(_loc8_ == _loc3_[0].BY)
                     {
                        _loc4_ = false;
                     }
                  }
                  else if(direction == 8 || direction == 9)
                  {
                     if(_loc9_ == _loc3_[0].BX)
                     {
                        _loc4_ = false;
                     }
                  }
                  if(_loc4_ == false)
                  {
                     _loc26_.push({DISTANCE:_loc16_,BUTTON:_loc2_,BX:_loc3_[0].BX,BY:_loc3_[0].BY,ANGLE:_loc15_});
                     break;
                  }
               }
               _loc11_ += 45;
            }
            _loc3_ = [];
         }
         _loc18_ = _loc18_ + 1;
      }
      _loc25_ = [];
      _loc2_;
      _loc26_.sortOn("DISTANCE",Array.NUMERIC);
      _loc2_ = _loc26_[0].BUTTON;
      _loc7_ = _loc26_[0].BX;
      _loc5_ = _loc26_[0].BY;
      var _loc30_ = _loc26_[0].DISTANCE;
      var _loc29_;
      var _loc32_;
      var _loc31_;
      if(_loc2_ != undefined)
      {
         _loc29_ = _loc30_ / 627;
         if(_loc29_ > 0.75)
         {
            _loc29_ = 0.75;
         }
         _loc32_ = _loc7_;
         _loc31_ = _loc5_ + this.safeFrameY;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CURSOR,_loc29_,{_x:_loc32_,_y:_loc31_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.endCursorSnap,onCompleteScope:this,onCompleteArgs:[_loc2_]});
      }
      _loc25_ = [];
      _loc26_ = [];
   }
   function getMinBounds(targetMC)
   {
      var _loc3_ = targetMC.getBounds(this.TIMELINE[this.movieClipName].CONTENT);
      var _loc2_ = {x:_loc3_.xMin,y:_loc3_.yMin};
      this.TIMELINE[this.movieClipName].CONTENT.localToGlobal(_loc2_);
      return _loc2_;
   }
   function getMaxBounds(targetMC)
   {
      var _loc3_ = targetMC.getBounds(this.TIMELINE[this.movieClipName].CONTENT);
      var _loc2_ = {x:_loc3_.xMax,y:_loc3_.yMax};
      this.TIMELINE[this.movieClipName].CONTENT.localToGlobal(_loc2_);
      return _loc2_;
   }
   function testDirection(direction, butX, butY, curX, curY)
   {
      var _loc1_ = false;
      switch(direction)
      {
         case 8:
            if(butY <= curY)
            {
               _loc1_ = true;
            }
            break;
         case 11:
            if(butX >= curX)
            {
               _loc1_ = true;
            }
            break;
         case 9:
            if(butY >= curY)
            {
               _loc1_ = true;
            }
            break;
         case 10:
            if(butX <= curX)
            {
               _loc1_ = true;
            }
      }
      return _loc1_;
   }
   function endCursorSnap(buttonMC)
   {
      this.processButton(buttonMC);
   }
   function getAngle(x1, y1, x2, y2)
   {
      var _loc1_ = Math.round(Math.atan2(y2 - y1,x2 - x1) * 57.29577951308232);
      _loc1_ -= 90;
      return _loc1_ >= 0 ? _loc1_ : _loc1_ + 360;
   }
   function getRelativeAngle(x1, y1, x2, y2, dir)
   {
      var _loc3_ = this.getAngle(x1,y1,x2,y2);
      var _loc4_;
      var _loc2_;
      switch(dir)
      {
         case 8:
            _loc2_ = 180;
            break;
         case 11:
            _loc2_ = 270;
            break;
         case 9:
            if(_loc3_ <= 90)
            {
               _loc2_ = 0;
               break;
            }
            _loc2_ = 360;
            break;
         case 10:
            _loc2_ = 90;
      }
      _loc4_ = _loc3_ - _loc2_;
      return Math.abs(Math.round(_loc4_));
   }
   function getDistance(x1, y1, x2, y2)
   {
      var _loc2_ = x2 - x1;
      var _loc1_ = y2 - y1;
      return Math.sqrt(_loc2_ * _loc2_ + _loc1_ * _loc1_);
   }
   function hitTestButtons(x, y)
   {
      if(this.CURSOR._visible == true)
      {
         if(y < this.TOOLBAR._y + 45 && this.TOOLBAR.toolbarWhiteOutMC._alpha == 0)
         {
            if(this.checkButtonsTest(this.buttonManager.toolbarMCList,x,y))
            {
               return undefined;
            }
         }
         else
         {
            if(this.checkButtonsTest(this.buttonManager.browserButtonMCList,x,y))
            {
               return undefined;
            }
            if(this.checkButtonsTestIncludeMask(this.buttonManager.buttonMCList,x,y))
            {
               return undefined;
            }
         }
         if(this._currentSelectedButton != "NOTHING")
         {
            this.SET_ACTIVE_BUTTON("NOTHING");
         }
      }
   }
   function checkButtonsTest(buttonlist, x, y)
   {
      var _loc5_ = false;
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < buttonlist.length)
      {
         _loc2_ = buttonlist[_loc3_];
         if(_loc2_.disabled != true && _loc2_._alpha != 0)
         {
            if(_loc2_.hitTest(x,y,true))
            {
               this.processButton(_loc2_);
               _loc5_ = true;
               break;
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc5_;
   }
   function checkButtonsTestIncludeMask(buttonlist, x, y)
   {
      var _loc6_ = false;
      if(this.buttonMaskMC != undefined)
      {
         if(this.buttonMaskMC.hitTest(x,y,true) == true)
         {
            _loc6_ = true;
         }
      }
      var _loc4_ = false;
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < buttonlist.length)
      {
         _loc2_ = buttonlist[_loc3_];
         if(_loc2_.disabled != true && _loc2_._alpha != 0)
         {
            if(_loc2_.hitTest(x,y,true))
            {
               if(_loc6_ == false)
               {
                  this.processButton(_loc2_);
                  _loc4_ = true;
                  break;
               }
               if(_loc2_.getDepth() < 0)
               {
                  this.processButton(_loc2_);
                  _loc4_ = true;
                  break;
               }
            }
         }
         _loc3_ = _loc3_ + 1;
      }
      return _loc4_;
   }
   function SET_BUTTON_MASK(buttonMask)
   {
      if(buttonMask != undefined)
      {
         this.buttonMaskMC = buttonMask;
      }
      else
      {
         this.buttonMaskMC = undefined;
      }
   }
   function processButton(targetButton)
   {
      if(targetButton._name != this._currentSelectedButton)
      {
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Click_Hover","WEB_NAVIGATION_SOUNDS_PHONE");
         this.setButtonState(targetButton,true);
      }
      this.SET_ACTIVE_BUTTON(targetButton._name,targetButton);
   }
   function SET_PAGE_BUTTONS(_dataTextScope)
   {
      this.buttonManager.updateButtonList(_dataTextScope);
      this.setButtonsInitialState();
   }
   function setButtonsInitialState()
   {
      var _loc2_;
      var _loc3_ = 0;
      _loc3_ = 0;
      var _loc4_;
      while(_loc3_ < this.buttonManager.buttonMCList.length)
      {
         _loc2_ = this.buttonManager.buttonMCList[_loc3_];
         _loc4_ = _loc2_.buttonType;
         this.getTextLinkOffColour(_loc2_);
         _loc2_.btnTxt.textColor = this.getTextLinkOffColour(_loc2_);
         _loc3_ = _loc3_ + 1;
      }
   }
   function cleanupButtons()
   {
      this.buttonManager.buttonMCList = [];
   }
   function SET_ACTIVE_BUTTON(currentButton, currentButtonTarget)
   {
      if(this._currentSelectedButton != currentButton)
      {
         if(this._currentSelectedTarget != undefined)
         {
            this.setButtonState(this._currentSelectedTarget,false);
         }
      }
      this._currentSelectedButton = currentButton;
      this._currentSelectedTarget = currentButtonTarget;
      var _loc3_ = com.rockstargames.gtav.web.buttons.WebButton(this._currentSelectedTarget);
      var _loc4_ = currentButton != "NOTHING" ? _loc3_.buttonType : com.rockstargames.gtav.constants.WebBrowserButtonLUT.NOTHING;
      var _loc2_ = com.rockstargames.gtav.constants.WebBrowserButtonLUT.lookUp(_loc4_);
      if(_loc2_ != undefined)
      {
         this.buttonState = _loc2_[2];
         this.SET_CURSOR_STATE(_loc2_[3]);
         this.SET_CURRENT_OBJECT_TYPE(_loc2_[0]);
         if(_loc3_.isBrowserButton)
         {
            this.SET_CURRENT_SELECTION(_loc2_[4]);
         }
         else if(this._currentSelectedTarget.slot != undefined)
         {
            this.SET_CURRENT_SELECTION(this._currentSelectedTarget.slot);
         }
      }
   }
   function setButtonState(target, state)
   {
      var _loc3_;
      var _loc5_;
      var _loc4_;
      if(target != undefined)
      {
         _loc5_ = com.rockstargames.gtav.web.buttons.WebButton(target);
         _loc4_ = _loc5_.buttonType;
         switch(state)
         {
            case true:
               if(_loc3_ != this.getTextLinkOnColour(target))
               {
                  target.gotoAndStop("ON");
                  _loc3_ = this.getTextLinkOnColour(target);
               }
               break;
            case false:
               target.gotoAndStop("OFF");
               _loc3_ = this.getTextLinkOffColour(target);
         }
         if(_loc4_ == com.rockstargames.gtav.constants.WebBrowserButtonLUT.WEB_BUTTON || _loc4_ == com.rockstargames.gtav.constants.WebBrowserButtonLUT.ANCHOR_BUTTON)
         {
            if(target)
            {
               target.btnTxt.textColor = _loc3_;
            }
         }
         if(target.topLevel == true)
         {
            target.topmostLevel = state;
         }
      }
   }
   function getTextLinkOnColour(target)
   {
      var _loc2_;
      _loc2_ = target.onColour;
      if(_loc2_ == undefined)
      {
         if(this.currentWebsite.defaultButtonOnColour != undefined)
         {
            _loc2_ = this.currentWebsite.defaultButtonOnColour;
         }
         else
         {
            _loc2_ = this.defaultBrowserOnColour;
         }
      }
      return _loc2_;
   }
   function getTextLinkOffColour(target)
   {
      var _loc2_;
      _loc2_ = target.offColour;
      if(_loc2_ == undefined)
      {
         if(this.currentWebsite.defaultButtonOffColour != undefined)
         {
            _loc2_ = this.currentWebsite.defaultButtonOffColour;
         }
         else
         {
            _loc2_ = this.defaultBrowserOffColour;
         }
      }
      return _loc2_;
   }
   function remove_tween(removeTween, commandString)
   {
      if(removeTween != undefined)
      {
         if(commandString == "hide")
         {
            this.remove_tween._visible = false;
         }
         if(removeTween != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(removeTween);
         }
      }
   }
   function SET_MULTIPLAYER(_multiplayer)
   {
      this.multiplayer = _multiplayer;
   }
   function SUPRESS_HISTORY(_suppressBackButton)
   {
      var _loc2_ = this.TIMELINE.blackoutMC;
      this.suppressBackButton = _suppressBackButton;
      if(this.suppressBackButton == true)
      {
         this.setFlags(0,1);
         if(_loc2_ == undefined)
         {
            _loc2_ = this.TIMELINE.attachMovie("generic_square","blackoutMC",this.TIMELINE.getNextHighestDepth());
         }
         com.rockstargames.ui.utils.Colour.Colourise(_loc2_,0,0,0,0);
         _loc2_._width = this.TIMELINE[this.movieClipName].CONTENT._width;
         _loc2_._height = this.TIMELINE[this.movieClipName].CONTENT._height;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.25,{_alpha:80,onComplete:this.remove_tween,onCompleteScope:this,onCompleteArgs:[_loc2_]});
      }
      else
      {
         this.setFlags(0,0);
         if(_loc2_ != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.25,{_alpha:0,onComplete:this.removeMovieClip,onCompleteScope:this,onCompleteArgs:[_loc2_]});
         }
      }
   }
   function SET_TITLEBAR_TEXT(titlebarText, hexColour)
   {
      if(hexColour != undefined)
      {
         this.TOOLBAR.titlebarText.textColor = hexColour;
      }
      else
      {
         this.TOOLBAR.titlebarText.textColor = 6710886;
      }
      this.TOOLBAR.titlebarText.text = titlebarText;
   }
   function SET_BROWSER_CURSOR_SPEED_MODIFIER(newSpeed)
   {
      if(newSpeed > 0)
      {
         this.analogSpeedDivisor = newSpeed;
      }
   }
   function IS_JAPANESE(_isJapanese)
   {
      this.isJapanese = _isJapanese;
   }
   function SET_BROWSER_SKIN(skinEnum)
   {
      this.player = skinEnum;
      if(skinEnum >= 4)
      {
         this.player = 1;
      }
      this.setFlags(0,0);
      this.setFlags(1,1);
      this.setFlags(2,0);
      this.setFlags(4,0);
      this.setFlags(5,0);
      if(this.TOOLBAR)
      {
         this.TOOLBAR.removeMovieClip();
      }
      var _loc4_ = ["IFRUIT","IFRUIT","BADGER","FACADE","IFRUIT"];
      var _loc3_ = "TOOLBAR_" + _loc4_[skinEnum];
      this.TOOLBAR = this.TIMELINE.attachMovie(_loc3_,"TOOLBAR",55);
      this.TOOLBAR.topmostLevel = true;
      this.TOOLBAR._x = 0;
      this.TOOLBAR._y = this.safeFrameY;
      this.buttonManager.setToolBarList([this.TOOLBAR.button_back,this.TOOLBAR.button_forward,this.TOOLBAR.button_home,this.TOOLBAR.button_history,this.TOOLBAR.address_box,this.TOOLBAR.button_favorites]);
   }
   function SET_PRICES(slotID, price)
   {
      this.currentWebsite.SET_PRICES(slotID,price);
   }
   function SET_RANKS(slotID, rank, current)
   {
      this.currentWebsite.SET_RANKS(slotID,rank,current);
   }
   function DISABLE_VIDEO(disableVideo)
   {
      this.currentWebsite.DISABLE_VIDEO(disableVideo);
   }
   function SET_MOVIECLIP_IS_VISIBLE(isVisible, instanceEnum)
   {
      this.currentWebsite.SET_MOVIECLIP_VISIBILITY(Boolean(isVisible),instanceEnum);
   }
   function PROXY_FUNCTION()
   {
      this.currentWebsite.PROXY_FUNCTION(arguments[0],arguments.slice(1));
   }
   function SET_WIDESCREEN(isWideScreen)
   {
      this._isWideScreen = isWideScreen;
   }
   function GET_SITE_ID()
   {
      var _loc2_ = com.rockstargames.gtav.web.DynamicSiteContants[this.TIMELINE[this.movieClipName]._name][0];
      if(_loc2_ == undefined)
      {
         return -1;
      }
      return _loc2_;
   }
   function GET_PAGE_ID()
   {
      var _loc2_ = 1;
      while(_loc2_ < this.currentWebsite.PAGE_NAMES.length)
      {
         if(this.currentWebsite.PAGE_NAMES[_loc2_] == this.pageName)
         {
            this.CanStoreThisPage = this.currentWebsite.CAN_STORE_PAGE[_loc2_];
            if(this.CanStoreThisPage == undefined)
            {
               this.CanStoreThisPage = true;
            }
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.CanStoreThisPage = false;
      return -1;
   }
   function GET_CURRENT_WEBSITE()
   {
      return this.movieClipName;
   }
   function SET_DATA_SLOT(slotID)
   {
      this.currentWebsite.dataProviderUI[slotID] = arguments.slice(1);
   }
   function APPEND_DATA_SLOT(slotID)
   {
      var _loc4_ = arguments.slice(1);
      var _loc3_ = 0;
      while(_loc3_ < _loc4_.length)
      {
         this.currentWebsite.dataProviderUI[slotID][5 + _loc3_] = _loc4_[_loc3_];
         _loc3_ = _loc3_ + 1;
      }
   }
   function SET_DATA_SLOT_EMPTY()
   {
      this.currentWebsite.dataProviderUI = new Array();
   }
   function SET_TICKERTAPE(speed, name)
   {
      this.TIMELINE[this.movieClipName].TIMELINE.UPDATE_TICKERTAPE(speed,name);
   }
   function GET_CURRENT_OBJECT_TYPE()
   {
      if(this.objType == undefined)
      {
         return -1;
      }
      return this.objType;
   }
   function GET_CURRENT_SELECTION()
   {
      return Number(this._currentSelection);
   }
   function SET_CURRENT_SELECTION(newCurrentSelection)
   {
      this._currentSelection = newCurrentSelection;
   }
   function IS_KEYBOARD_ACTIVE()
   {
      var _loc2_ = false;
      if(this.currentInterface == this.BrowserKeyBoard)
      {
         _loc2_ = true;
      }
      return _loc2_;
   }
   function CREATE_HIGHLIGHT(targetSlot, colR, colG, colB, colA)
   {
      var _loc3_;
      var _loc2_;
      var _loc7_;
      var _loc8_;
      var _loc10_;
      if(this.TIMELINE[this.movieClipName].CONTENT.HIGHLIGHT == undefined)
      {
         this.HIGHLIGHT = this.TIMELINE[this.movieClipName].CONTENT.createEmptyMovieClip("HIGHLIGHT",this.TIMELINE[this.movieClipName].CONTENT.getNextHighestDepth());
         _loc3_ = 0;
         _loc2_ = 0;
         _loc7_ = 1280;
         _loc8_ = this.TIMELINE[this.movieClipName].CONTENT._height;
         if(colR == undefined && colG == undefined && colB == undefined)
         {
            colR = 255;
            colG = 255;
            colB = 255;
         }
         if(colA == undefined)
         {
            colA = 80;
         }
         _loc10_ = com.rockstargames.ui.utils.Colour.RGBToHex(colR,colG,colB);
         if(this.TOOLBAR.toolbarWhiteOutMC != undefined)
         {
            com.rockstargames.ui.utils.Colour.Colourise(this.TOOLBAR.toolbarWhiteOutMC,colR,colG,colB,0);
         }
         this.HIGHLIGHT._alpha = 0;
         this.HIGHLIGHT.beginFill(_loc10_,colA);
         this.HIGHLIGHT.moveTo(_loc3_,_loc2_);
         this.HIGHLIGHT.lineTo(_loc3_ + _loc7_,_loc2_);
         this.HIGHLIGHT.lineTo(_loc3_ + _loc7_,_loc2_ + _loc8_);
         this.HIGHLIGHT.lineTo(_loc3_,_loc2_ + _loc8_);
         this.HIGHLIGHT.lineTo(_loc3_,_loc2_);
         this.HIGHLIGHT.endFill();
         if(this.HIGHLIGHT != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.HIGHLIGHT,0.65,{_alpha:100,onComplete:this.remove_tween,onCompleteScope:this,onCompleteArgs:[this.HIGHLIGHT]});
         }
         if(this.TOOLBAR.toolbarWhiteOutMC != undefined)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.TOOLBAR.toolbarWhiteOutMC,0.65,{_alpha:100,onComplete:this.remove_tween,onCompleteScope:this,onCompleteArgs:[this.TOOLBAR.toolbarWhiteOutMC]});
         }
         this.REMOVE_LIST();
         this.DISABLE_ALL_BUTTONS();
         if(this.TIMELINE[this.movieClipName].CONTENT.playerCashMC != undefined)
         {
            this.TIMELINE[this.movieClipName].CONTENT.playerCashMC.topmostLevel = true;
         }
      }
      this.DISABLE_BUTTON(targetSlot,false);
   }
   function CLEAR_HIGHLIGHTS()
   {
      var _loc2_;
      if(this.TIMELINE[this.movieClipName].CONTENT.HIGHLIGHT != undefined)
      {
         this.TIMELINE[this.movieClipName].CONTENT.HIGHLIGHT.removeMovieClip();
         this.TOOLBAR.toolbarWhiteOutMC._alpha = 0;
         _loc2_ = 0;
         while(_loc2_ < this.currentWebsite.dataTextScope.length)
         {
            this.DISABLE_BUTTON(_loc2_,false);
            _loc2_ = _loc2_ + 1;
         }
         if(this.TIMELINE[this.movieClipName].CONTENT.playerCashMC != undefined)
         {
            this.TIMELINE[this.movieClipName].CONTENT.playerCashMC.topmostLevel = false;
         }
      }
   }
   function DISABLE_BUTTON(targetSlot, isDisabled)
   {
      var _loc2_ = this.currentWebsite.dataTextScope[targetSlot];
      if(_loc2_ != undefined)
      {
         if(_loc2_._name == "btnTxt")
         {
            _loc2_ = _loc2_._parent;
         }
         if(_loc2_ != undefined && typeof _loc2_ == "movieclip")
         {
            _loc2_.disabled = isDisabled;
            if(isDisabled == true)
            {
               if(_loc2_ != undefined)
               {
                  com.rockstargames.ui.utils.Colour.Colourise(_loc2_,200,200,200,50);
               }
            }
            else if(_loc2_ != undefined)
            {
               com.rockstargames.ui.utils.Colour.Colourise(_loc2_,255,255,255,100);
            }
         }
      }
   }
   function DISABLE_ALL_BUTTONS(hideButtons, supressHistory)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.currentWebsite.dataTextScope.length)
      {
         this.DISABLE_BUTTON(_loc2_,true);
         if(hideButtons == true)
         {
            _loc3_ = this.currentWebsite.dataTextScope[_loc2_];
            _loc3_._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function ENABLE_ALL_BUTTONS()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < this.currentWebsite.dataTextScope.length)
      {
         this.DISABLE_BUTTON(_loc2_,false);
         _loc3_ = this.currentWebsite.dataTextScope[_loc2_];
         _loc3_._visible = true;
         _loc2_ = _loc2_ + 1;
      }
   }
}
