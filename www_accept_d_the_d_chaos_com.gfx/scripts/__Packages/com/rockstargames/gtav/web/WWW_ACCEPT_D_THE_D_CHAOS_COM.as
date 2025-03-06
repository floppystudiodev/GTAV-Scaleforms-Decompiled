class com.rockstargames.gtav.web.WWW_ACCEPT_D_THE_D_CHAOS_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var PAGE_NAMES;
   var CAN_STORE_PAGE;
   var browser;
   var defaultButtonOnColour;
   var defaultButtonOffColour;
   var CONTENT;
   var dataTextScope;
   var mcScope;
   var playgodIndex = 0;
   var isJapanese = false;
   function WWW_ACCEPT_D_THE_D_CHAOS_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = new Array();
      this.PAGE_NAMES[1] = "PAGE1";
      this.PAGE_NAMES[2] = "PLAYGOD";
      this.PAGE_NAMES[3] = "FAQ";
      this.PAGE_NAMES[4] = "LECTURE";
      this.CAN_STORE_PAGE = new Array();
      this.CAN_STORE_PAGE[1] = true;
      this.CAN_STORE_PAGE[2] = true;
      this.CAN_STORE_PAGE[3] = true;
      this.CAN_STORE_PAGE[4] = true;
      this.browser = _level0.TIMELINE;
      this.defaultButtonOnColour = 4671303;
      this.defaultButtonOffColour = 3504562;
   }
   function READY()
   {
   }
   function goToAnchor(AnchorLink)
   {
      this.playgodIndex = this.playgodIndex + 1;
      if(this.playgodIndex > 3)
      {
         this.playgodIndex = 0;
      }
      this.CONTENT.PLAYGOD.playgodMC.gotoAndStop(this.playgodIndex + 1);
   }
   function POPULATE_TEXT(pageName)
   {
      this.isJapanese = this.browser.isJapanese;
      this.dataTextScope = new Array();
      switch(pageName)
      {
         case "PAGE1":
            this.mcScope = this.CONTENT.PAGE1;
            break;
         case "PLAYGOD":
            this.mcScope = this.CONTENT.PLAYGOD;
            this.playgodIndex = 0;
            this.dataTextScope[4] = this.mcScope.play_god.btnTxt;
            break;
         case "FAQ":
            this.mcScope = this.CONTENT.FAQ;
            break;
         case "LECTURE":
            this.mcScope = this.CONTENT.LECTURE;
      }
      if(this.isJapanese == true)
      {
         this.mcScope.PLAYGOD._y = -100;
         this.mcScope.FAQ._x = 318;
         this.mcScope.LECTURE._x = 692;
      }
      else
      {
         this.dataTextScope[1] = this.mcScope.PLAYGOD.btnTxt;
         this.mcScope.PLAYGOD._alpha = 100;
      }
      this.mcScope.FAQ._alpha = 100;
      this.mcScope.LECTURE._alpha = 100;
      this.dataTextScope[0] = this.mcScope.PAGE1.btnTxt;
      this.dataTextScope[2] = this.mcScope.FAQ.btnTxt;
      this.dataTextScope[3] = this.mcScope.LECTURE.btnTxt;
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
}
