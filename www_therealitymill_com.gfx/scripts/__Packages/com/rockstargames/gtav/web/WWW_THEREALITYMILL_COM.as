class com.rockstargames.gtav.web.WWW_THEREALITYMILL_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var mcScope;
   var CONTENT;
   var intervalId;
   var dataTextScope;
   var OnColour;
   var defaultButtonOnColour;
   function WWW_THEREALITYMILL_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "ABOUT";
      this.PAGE_NAMES[3] = "YOU";
      this.PAGE_NAMES[4] = "LIMELIGHT";
      this.PAGE_NAMES[5] = "SEX";
      this.PAGE_NAMES[6] = "CASH";
      this.PAGE_NAMES[14] = "PURCHASE_D_ERROR";
      this.PAGE_NAMES[15] = "PURCHASE_D_CONFIRM";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.CAN_STORE_PAGE[5] = true;
      this.CAN_STORE_PAGE[6] = true;
      this.CAN_STORE_PAGE[14] = false;
      this.CAN_STORE_PAGE[15] = false;
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
      clearInterval(this.intervalId);
      this.dataTextScope = new Array();
      var _loc3_ = 0;
      for(var _loc4_ in this.mcScope)
      {
         if(typeof this.mcScope[_loc4_] == "movieclip")
         {
            if(this.mcScope[_loc4_].btnTxt != undefined)
            {
               trace("mcScope[x]._name: " + this.mcScope[_loc4_]._name);
               this.mcScope[_loc4_].offColour = this.mcScope[_loc4_].btnTxt.textColor;
               var _loc2_ = this.mcScope[_loc4_].btnTxt;
               this.dataTextScope[_loc3_] = _loc2_;
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      var _loc0_ = null;
      if((_loc0_ = pageName) === "PURCHASE_D_CONFIRM")
      {
         this.mcScope.completeTF._alpha = 0;
         this.mcScope.messageTF._alpha = 0;
         this.intervalId = setInterval(this,"displayPurchasedText",2000);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
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
   function displayPurchasedText()
   {
      clearInterval(this.intervalId);
      if(this.mcScope.completeTF != undefined)
      {
         this.mcScope.completeTF._alpha = 100;
      }
      if(this.mcScope.messageTF != undefined)
      {
         this.mcScope.messageTF._alpha = 100;
      }
      if(this.mcScope.processingTF != undefined)
      {
         this.mcScope.processingTF._alpha = 0;
      }
   }
}
