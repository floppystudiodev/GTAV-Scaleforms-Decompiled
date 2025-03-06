class com.rockstargames.gtav.web.WWW_HUSHSMUSH_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var randomProfiles;
   var CONTENT;
   var dataTextScope;
   var mcScope;
   var _userName;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var _isUser = false;
   var profileIndex = 0;
   var profilesArray = ["7YEARBITCH","ALTAREGO","BABYSICK","BADKITTY","CEOMOM","CURVALICIOUS","FOXYMAMA","FROGGY","MANSMAN","MENAWHORSAL","MISSCUDDLES","MUNGDREAMER","SKANKYPANKY"];
   function WWW_HUSHSMUSH_COM()
   {
      super();
      _global.gfxExtensions = true;
      this.IS_SITE_DYNAMIC = 0;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "SIGNUP";
      this.PAGE_NAMES[3] = "PURCHASE_D_CONFIRM";
      this.PAGE_NAMES[4] = "MESSAGE_D_SENT";
      this.PAGE_NAMES[5] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[6] = "DOWN";
      this.PAGE_NAMES[7] = "RESULTS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = false;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = false;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.browser = _level0.TIMELINE;
      this.browser.DebugTextContent = true;
   }
   function READY()
   {
      var _loc2_ = this.profilesArray.slice();
      this.randomProfiles = [];
      while(_loc2_.length > 0)
      {
         this.randomProfiles.push(_loc2_.splice(Math.floor(Math.random() * _loc2_.length),1));
      }
   }
   function goToAnchor(AnchorLink)
   {
      var _loc0_ = null;
      if((_loc0_ = this.browser.pageName) === "RESULTS")
      {
         if(AnchorLink.indexOf("gooseMC") >= 0 || AnchorLink.indexOf("grabMC") >= 0 || AnchorLink.indexOf("gropeMC") >= 0)
         {
            var _loc6_ = Number(AnchorLink.split("MC")[1]);
            var _loc2_ = this.profileIndex - (3 - _loc6_);
            _loc2_ = _loc2_ >= 0 ? _loc2_ : this.profilesArray.length + _loc2_;
            var _loc4_ = this.randomProfiles[_loc2_];
            var _loc5_ = this.getProfileIndex(_loc4_);
            this.browser.SET_CURRENT_SELECTION(_loc5_);
            this.browser.GO_TO_WEBPAGE("WWW_HUSHSMUSH_COM_S_MESSAGE_D_SENT");
         }
         else if(AnchorLink == "moreMC")
         {
            this.displayProfiles(this.CONTENT[this.browser.pageName],this.profileIndex);
         }
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.CONTENT._y = 0;
      this.dataTextScope = new Array();
      this.mcScope = this.CONTENT[pageName];
      switch(this.browser.player)
      {
         case 0:
            this._isUser = true;
            this._userName = "Michael";
            break;
         case 2:
            this._isUser = true;
            this._userName = "Trevor";
      }
      switch(this.browser.pageName)
      {
         case "PAGE1":
            this.scan_and_set_localised_text(this.mcScope,["HUS_FACT3","HUS_SITE_DESC","HUS_PRIVACY"]);
            var _loc0_ = null;
            this.mcScope.fact3TF.htmlText = _loc0_ = this.mcScope.HUS_FACT.htmlText;
            this.mcScope.fact2TF.htmlText = _loc0_;
            if(this._isUser)
            {
               this.mcScope.HUS_WELCOME.htmlText = this.mcScope.HUS_WELCOME.htmlText.split("*").join(this._userName);
            }
            else
            {
               com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HUS_WELCOME_GUEST",this.mcScope.HUS_WELCOME_GUEST,true);
            }
            this.scanAndSetupButtons();
            break;
         case "SIGNUP":
            this.scan_and_set_localised_text(this.mcScope,["HUS_CREDITS"]);
            this.dataTextScope[0] = this.mcScope.PAGE1.btnTxt;
            this.dataTextScope[1] = this.mcScope.PURCHASE_D_CONFIRM.btnTxt;
            break;
         case "RESULTS":
            this.scanAndSetupButtons();
            var _loc3_ = 0;
            while(_loc3_ < 3)
            {
               var _loc2_ = this.mcScope["result" + _loc3_];
               this.dataTextScope.push(_loc2_.gooseMC.btnTxt);
               this.dataTextScope.push(_loc2_.grabMC.btnTxt);
               this.dataTextScope.push(_loc2_.gropeMC.btnTxt);
               _loc3_ = _loc3_ + 1;
            }
            this.displayProfiles(this.mcScope,this.profileIndex);
            this.scan_and_set_localised_text(this.mcScope);
            break;
         default:
            this.scan_and_set_localised_text(this.mcScope);
            this.scanAndSetupButtons();
      }
      this.defaultButtonOffColour = _loc0_ = 16777215;
      this.defaultButtonOnColour = _loc0_;
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
   function scanAndSetupButtons()
   {
      var _loc3_ = 0;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.htmlTextColor;
               var _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
   }
   function scan_and_set_localised_text(scope, noShrinkList)
   {
      for(var _loc7_ in scope)
      {
         var _loc2_ = scope[_loc7_]._name;
         if(_loc2_.indexOf("HUS_") == 0)
         {
            var _loc3_ = scope[_loc7_];
            _loc3_.html = true;
            _loc3_.multiline = true;
            var _loc5_ = true;
            var _loc1_ = 0;
            while(_loc1_ < noShrinkList.length)
            {
               if(_loc2_ == noShrinkList[_loc1_])
               {
                  _loc5_ = false;
                  noShrinkList.splice(_loc1_,1);
                  break;
               }
               _loc1_ = _loc1_ + 1;
            }
            if(_loc5_)
            {
               _loc3_.textAutoSize = "shrink";
            }
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_,_loc3_,true);
         }
      }
   }
   function displayProfiles(scope, index)
   {
      var _loc3_ = 0;
      while(_loc3_ < 3)
      {
         var _loc2_ = this.mcScope["result" + _loc3_];
         var _loc4_ = this.randomProfiles[this.profileIndex];
         if(!_loc2_.configured)
         {
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HUS_LABELS",_loc2_.labelsTF,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HUS_GOOSE",_loc2_.gooseMC.btnTxt,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HUS_GRAB",_loc2_.grabMC.btnTxt,true);
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HUS_GROPE",_loc2_.gropeMC.btnTxt,true);
            _loc2_.gooseMC._name += _loc3_;
            _loc2_.grabMC._name += _loc3_;
            _loc2_.gropeMC._name += _loc3_;
            _loc2_.configured = true;
         }
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HUS_DETAILS_" + _loc4_,_loc2_.detailsTF,true);
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HUS_BIO_" + _loc4_,_loc2_.bioTF,true);
         if(_loc2_.picMC != undefined)
         {
            _loc2_.picMC.removeMovieClip();
         }
         _loc2_.attachMovie(_loc4_,"picMC",_loc2_.getNextHighestDepth(),{_x:1,_y:1,_width:126,_height:126});
         this.profileIndex = ++this.profileIndex >= this.randomProfiles.length ? 0 : this.profileIndex;
         _loc3_ = _loc3_ + 1;
      }
   }
   function getProfileIndex(profileID)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.profilesArray.length)
      {
         if(profileID == this.profilesArray[_loc2_])
         {
            return _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return -1;
   }
}
