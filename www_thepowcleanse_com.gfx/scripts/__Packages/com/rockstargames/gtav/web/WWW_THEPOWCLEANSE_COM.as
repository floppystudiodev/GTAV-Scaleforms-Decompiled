class com.rockstargames.gtav.web.WWW_THEPOWCLEANSE_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var mcScope;
   var CONTENT;
   var prevYPos;
   var curAniFrame;
   var dataTextScope;
   var OnColour;
   var defaultButtonOnColour;
   function WWW_THEPOWCLEANSE_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "DAY1";
      this.PAGE_NAMES[3] = "DAY2";
      this.PAGE_NAMES[4] = "DAY3";
      this.PAGE_NAMES[5] = "DAY4";
      this.PAGE_NAMES[6] = "DAY5_D_9";
      this.PAGE_NAMES[7] = "DAY10";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[7] = true;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      this.mcScope = this.CONTENT[this.browser.pageName];
      this.prevYPos = this.CONTENT._y;
      this.curAniFrame = this.mcScope.aniMC._currentFrame;
      switch(AnchorLink)
      {
         case "DAY5":
         case "DAY6":
         case "DAY7":
         case "DAY8":
         case "DAY9":
            if(this.browser.pageName != "DAY5_D_9")
            {
               this.browser.GO_TO_WEBPAGE("WWW_THEPOWCLEANSE_COM_S_DAY5_D_9");
            }
            break;
         default:
            this.browser.GO_TO_WEBPAGE("WWW_THEPOWCLEANSE_COM_S_" + AnchorLink);
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
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
      this.mcScope.aniMC.gotoAndPlay(this.curAniFrame);
      var _loc0_ = null;
      if((_loc0_ = this.browser.pageName) !== "PAGE1")
      {
         this.CONTENT._y = this.prevYPos;
      }
      else
      {
         this.CONTENT._y = 0;
      }
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
}
