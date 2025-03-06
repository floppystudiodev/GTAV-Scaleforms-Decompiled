class com.rockstargames.gtav.web.GENERIC_WEBSITE_SCRIPT extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var CONTENT;
   var OnColour;
   var mcScope;
   var dataTextScope;
   var defaultButtonOnColour;
   function GENERIC_WEBSITE_SCRIPT()
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
      this.PAGE_NAMES[16] = "PAGE16";
      this.PAGE_NAMES[17] = "PAGE17";
      this.PAGE_NAMES[18] = "PAGE18";
      this.PAGE_NAMES[19] = "PAGE19";
      this.PAGE_NAMES[20] = "PAGE20";
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
      this.CAN_STORE_PAGE[16] = true;
      this.CAN_STORE_PAGE[17] = true;
      this.CAN_STORE_PAGE[18] = true;
      this.CAN_STORE_PAGE[19] = true;
      this.CAN_STORE_PAGE[20] = true;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function POPULATE_TEXT(pageName)
   {
      if(this.CONTENT.globalColourMouseOver != undefined)
      {
         this.OnColour = this.CONTENT.globalColourMouseOver.textColor;
      }
      this.mcScope = this.CONTENT[pageName];
      if(this.mcScope.colourMouseOver != undefined)
      {
         this.OnColour = this.mcScope.colourMouseOver.textColor;
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
      this.defaultButtonOnColour = this.OnColour;
   }
}
