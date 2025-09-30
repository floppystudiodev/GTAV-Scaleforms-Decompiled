class com.rockstargames.gtav.web.WWW_YOURDEADFAMILY_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var IS_SITE_DYNAMIC;
   var OnColour;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOnColour;
   var mcScope;
   function WWW_YOURDEADFAMILY_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "SEARCH";
      this.PAGE_NAMES[3] = "RESULTS";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = false;
      this.CAN_STORE_PAGE[3] = false;
      this.browser = _level0.TIMELINE;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      var _loc0_;
      if(this.browser.pageName == "PAGE1")
      {
         if((_loc0_ = AnchorLink) === "SEARCH")
         {
            if(this.mcScope.nameMC.btnTxt.text == "" || this.mcScope.surnameMC.btnTxt.text == "" || this.mcScope.ageMC.btnTxt.text == "")
            {
               this.mcScope.formErrorTF.text = "Please complete form!";
               this.mcScope.formErrorTF._visible = true;
            }
            else
            {
               this.mcScope.formErrorTF.text = "";
               this.mcScope.formErrorTF._visible = false;
               this.browser.GO_TO_WEBPAGE("WWW_YOURDEADFAMILY_COM_S_SEARCH");
            }
         }
      }
   }
   function POPULATE_TEXT(pageName)
   {
      this.CONTENT._y = 0;
      this.mcScope = this.CONTENT[pageName];
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
      var _loc0_;
      if((_loc0_ = this.browser.pageName) === "PAGE1")
      {
         this.mcScope.formErrorTF._visible = false;
         this.mcScope.ageMC.numberBox = true;
         this.mcScope.ageMC.charLimit = 3;
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
