class com.rockstargames.gtav.web.WWW_THEINTERNETISAHELLHOLE_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var OnColour;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOnColour;
   var mcScope;
   function WWW_THEINTERNETISAHELLHOLE_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "QUESTION1";
      this.PAGE_NAMES[3] = "ANSWER1";
      this.PAGE_NAMES[4] = "QUESTION2";
      this.PAGE_NAMES[5] = "ANSWER2";
      this.PAGE_NAMES[6] = "QUESTION3";
      this.PAGE_NAMES[7] = "ANSWER3";
      this.PAGE_NAMES[8] = "QUESTION4";
      this.PAGE_NAMES[9] = "ANSWER4";
      this.PAGE_NAMES[10] = "RESULTS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[3] = false;
      this.CAN_STORE_PAGE[4] = false;
      this.CAN_STORE_PAGE[5] = false;
      this.CAN_STORE_PAGE[6] = false;
      this.CAN_STORE_PAGE[7] = false;
      this.CAN_STORE_PAGE[8] = false;
      this.CAN_STORE_PAGE[9] = false;
      this.CAN_STORE_PAGE[10] = true;
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
            }
         }
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
      this.defaultButtonOnColour = this.OnColour;
   }
}
