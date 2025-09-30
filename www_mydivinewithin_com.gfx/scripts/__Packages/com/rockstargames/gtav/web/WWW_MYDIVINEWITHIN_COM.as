class com.rockstargames.gtav.web.WWW_MYDIVINEWITHIN_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var mcScope;
   var resultsButtonIndex;
   var tickState;
   var questionCount = 10;
   function WWW_MYDIVINEWITHIN_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 1;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "FORM";
      this.PAGE_NAMES[3] = "RESULTS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.browser = _level0.TIMELINE;
      this.tickState = [];
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      var _loc0_;
      var _loc5_;
      var _loc6_;
      var _loc2_;
      var _loc3_;
      if((_loc0_ = this.browser.pageName) === "FORM")
      {
         if((_loc0_ = AnchorLink) !== "RESULTS")
         {
            var mcScope = this.CONTENT[this.browser.pageName];
            _loc5_ = mcScope[AnchorLink];
            _loc6_ = AnchorLink.substring(1,AnchorLink.length).split("_");
            _loc2_ = _loc6_[0];
            _loc3_ = _loc6_[1];
            if(this.tickState[_loc2_] == undefined)
            {
               this.tickState[_loc2_] = [];
            }
            this.tickState[_loc2_][_loc3_] = this.tickState[_loc2_][_loc3_] == undefined ? true : !this.tickState[_loc2_][_loc3_];
            if(this.tickState[_loc2_][_loc3_])
            {
               _loc5_.tickMC._alpha = 100;
            }
            else
            {
               _loc5_.tickMC._alpha = 0;
            }
         }
         else if(this._isTestComplete())
         {
            this.browser.GO_TO_WEBPAGE("WWW_MYDIVINEWITHIN_COM_S_RESULTS");
         }
         else
         {
            mcScope.RESULTS.gotoAndStop("OFF");
            mcScope.RESULTS.labelTF.text = "FINISH SURVEY FOR RESULTS";
         }
         if(this._isTestComplete())
         {
            mcScope.RESULTS._alpha = 100;
            this.browser.DISABLE_BUTTON(this.resultsButtonIndex,false);
         }
         else
         {
            mcScope.RESULTS._alpha = 20;
            mcScope.RESULTS.gotoAndStop("OFF");
            this.browser.DISABLE_BUTTON(this.resultsButtonIndex,true);
         }
      }
   }
   function _isTestComplete()
   {
      if(this.browser.pageName != "FORM")
      {
         return false;
      }
      var _loc3_ = 0;
      var _loc4_;
      var _loc2_;
      while(_loc3_ < this.questionCount)
      {
         if(this.tickState[_loc3_] == undefined)
         {
            return false;
         }
         _loc4_ = false;
         _loc2_ = 0;
         while(_loc2_ < this.tickState[_loc3_].length)
         {
            _loc4_ = this.tickState[_loc3_][_loc2_];
            if(_loc4_)
            {
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(!_loc4_)
         {
            return false;
         }
         _loc3_ = _loc3_ + 1;
      }
      return true;
   }
   function POPULATE_TEXT(pageName)
   {
      this.CONTENT._y = 0;
      this.tickState = [];
      this.mcScope = this.CONTENT[pageName];
      this.dataTextScope = new Array();
      switch(pageName)
      {
         case "PAGE1":
            this.dataTextScope[0] = this.mcScope.FORM.btnTxt;
            break;
         case "FORM":
            this.dataTextScope[0] = this.mcScope.RESULTS.btnTxt;
      }
      var _loc4_ = 1;
      var _loc2_;
      for(var _loc5_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc5_] == "movieclip")
         {
            if(this.mcScope[_loc5_].btnTxt != undefined)
            {
               this.mcScope[_loc5_].offColour = this.mcScope[_loc5_].btnTxt.textColor;
               _loc2_ = this.mcScope[_loc5_];
               _loc2_.gotoAndStop("OFF");
               _loc2_.tickMC._alpha = 0;
               if(_loc2_._name == "RESULTS")
               {
                  this.resultsButtonIndex = _loc4_;
               }
               this.dataTextScope[_loc4_] = _loc2_.btnTxt;
               _loc4_ = _loc4_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.scan_and_set_localised_text(this.mcScope);
      var _loc3_;
      var _loc6_;
      switch(pageName)
      {
         case "PAGE1":
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"MDW_PG1_CLICK",this.mcScope.FORM.btnTxt,true);
            break;
         case "FORM":
            this.browser.DISABLE_BUTTON(this.resultsButtonIndex,true);
            _loc3_ = 0;
            while(_loc3_ < 10)
            {
               com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"MDW_FORM_TICK",this.mcScope["tick" + _loc3_],true);
               _loc3_ = _loc3_ + 1;
            }
            this.mcScope.RESULTS.btnTxt.autoSize = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"MDW_FORM_CLICK",this.mcScope.RESULTS.btnTxt,true);
            if(this.mcScope.RESULTS.btnTxt.numLines > 1)
            {
               this.mcScope.RESULTS._y -= this.mcScope.RESULTS._height / 4;
            }
            break;
         case "RESULTS":
            this.mcScope.MDW_RES_UNFULFILLED.autoSize = true;
            this.mcScope.MDW_RES_FREE.autoSize = true;
            _loc6_ = this.mcScope.MDW_RES_UNFULFILLED._y + this.mcScope.MDW_RES_UNFULFILLED._height;
            this.mcScope.MDW_RES_FREE._y = _loc6_ + (610 - _loc6_ - this.mcScope.MDW_RES_FREE._height) / 2;
            this.mcScope.WWW_THECHILDRENOFTHEMOUNTAIN_COM.btnTxt.autoSize = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"MDW_RES_CLICK",this.mcScope.WWW_THECHILDRENOFTHEMOUNTAIN_COM.btnTxt,true);
            if(this.mcScope.WWW_THECHILDRENOFTHEMOUNTAIN_COM.btnTxt.numLines > 1)
            {
               this.mcScope.WWW_THECHILDRENOFTHEMOUNTAIN_COM._y -= this.mcScope.WWW_THECHILDRENOFTHEMOUNTAIN_COM._height / 4;
            }
      }
      this.defaultButtonOnColour = 7237274;
      this.defaultButtonOffColour = 16777215;
   }
   function scan_and_set_localised_text(scope)
   {
      var _loc2_;
      var _loc1_;
      for(var _loc4_ in scope)
      {
         _loc2_ = scope[_loc4_]._name;
         if(_loc2_.indexOf("MDW_") == 0)
         {
            _loc1_ = scope[_loc4_];
            _loc1_.html = true;
            _loc1_.multiline = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_,_loc1_,true);
         }
      }
   }
}
