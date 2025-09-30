class com.rockstargames.gtav.web.WWW_WHOKILLEDLEONORAJOHNSON_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var OnColour;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOnColour;
   var mcScope;
   var isJapanese = false;
   function WWW_WHOKILLEDLEONORAJOHNSON_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "PAGE2";
      this.PAGE_NAMES[3] = "PAGE3";
      this.PAGE_NAMES[4] = "PAGE4";
      this.PAGE_NAMES[5] = "PAGE5";
      this.PAGE_NAMES[6] = "PAGE6";
      this.PAGE_NAMES[7] = "PAGE7";
      this.PAGE_NAMES[8] = "PAGE8";
      this.PAGE_NAMES[9] = "PAGE9";
      this.PAGE_NAMES[10] = "PAGE10";
      this.PAGE_NAMES[11] = "PAGE11";
      this.PAGE_NAMES[12] = "PAGE12";
      this.PAGE_NAMES[13] = "PAGE13";
      this.PAGE_NAMES[14] = "PAGE14";
      this.PAGE_NAMES[15] = "PAGE15";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.CAN_STORE_PAGE[8] = true;
      this.CAN_STORE_PAGE[9] = true;
      this.CAN_STORE_PAGE[10] = true;
      this.CAN_STORE_PAGE[11] = true;
      this.CAN_STORE_PAGE[12] = true;
      this.CAN_STORE_PAGE[13] = true;
      this.CAN_STORE_PAGE[14] = true;
      this.CAN_STORE_PAGE[15] = true;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function POPULATE_TEXT(pageName)
   {
      this.isJapanese = this.browser.isJapanese;
      if(this.CONTENT.globalColourMouseOver != undefined)
      {
         this.OnColour = this.CONTENT.globalColourMouseOver.textColor;
      }
      this.mcScope = this.CONTENT[pageName];
      if(pageName == "PAGE3")
      {
         if(this.isJapanese == true)
         {
            this.mcScope.image_leonora3.gotoAndStop(2);
            this.mcScope.image_leonora4.gotoAndStop(2);
            this.mcScope.image_leonora5.gotoAndStop(2);
         }
         else
         {
            this.mcScope.image_leonora3.gotoAndStop(3);
            this.mcScope.image_leonora4.gotoAndStop(3);
            this.mcScope.image_leonora5.gotoAndStop(3);
         }
      }
      if(this.mcScope.colourMouseOver != undefined)
      {
         this.OnColour = this.mcScope.colourMouseOver.textColor;
      }
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      var _loc2_;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.defaultButtonOnColour = this.OnColour;
      if(this.mcScope.PAGE2 != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WHO_PG1_BUTTON_BIO",this.mcScope.PAGE2.btnTxt,false);
      }
      if(this.mcScope.PAGE3 != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WHO_PG1_BUTTON_WHA",this.mcScope.PAGE3.btnTxt,false);
      }
      if(this.mcScope.PAGE4 != undefined)
      {
         com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"WHO_PG1_BUTTON_THE",this.mcScope.PAGE4.btnTxt,false);
      }
      this.scan_and_set_localised_text(this.mcScope);
   }
   function scan_and_set_localised_text(scope)
   {
      var _loc2_;
      var _loc1_;
      for(var _loc4_ in scope)
      {
         _loc2_ = scope[_loc4_]._name;
         if(_loc2_.substr(0,4) == "WHO_")
         {
            _loc1_ = scope[_loc4_];
            _loc1_.html = true;
            _loc1_.multiline = true;
            com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,_loc2_,_loc1_,true);
         }
      }
   }
}
