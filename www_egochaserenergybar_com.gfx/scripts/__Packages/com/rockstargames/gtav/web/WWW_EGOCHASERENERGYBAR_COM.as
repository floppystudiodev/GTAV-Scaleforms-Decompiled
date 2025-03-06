class com.rockstargames.gtav.web.WWW_EGOCHASERENERGYBAR_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var mcScope;
   var CONTENT;
   var dataTextScope;
   var OnColour;
   var defaultButtonOnColour;
   function WWW_EGOCHASERENERGYBAR_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "INGREDIENTS";
      this.PAGE_NAMES[3] = "PERFORMANCE";
      this.PAGE_NAMES[4] = "TRIATHLONS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EGO_BUTTON_YOU",this.mcScope.PAGE1.btnTxt,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EGO_BUTTON_INGREDIENTS",this.mcScope.INGREDIENTS.btnTxt,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EGO_BUTTON_PERFORMANCE",this.mcScope.PERFORMANCE.btnTxt,true);
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"EGO_BUTTON_TRIATHLONS",this.mcScope.TRIATHLONS.btnTxt,true);
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
      this.scan_and_set_localised_text(this.mcScope);
      if(this.CONTENT.globalColourMouseOver != undefined)
      {
         this.OnColour = this.CONTENT.globalColourMouseOver.textColor;
      }
      if(this.mcScope.colourMouseOver != undefined)
      {
         this.OnColour = this.mcScope.colourMouseOver.textColor;
      }
      this.defaultButtonOnColour = this.OnColour;
   }
   function scan_and_set_localised_text(scope)
   {
      for(var _loc4_ in scope)
      {
         var _loc2_ = scope[_loc4_]._name;
         if(_loc2_.indexOf("EGO_") == 0)
         {
            var _loc1_ = scope[_loc4_];
            _loc1_.html = true;
            _loc1_.multiline = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_,_loc1_,true);
         }
      }
   }
}
