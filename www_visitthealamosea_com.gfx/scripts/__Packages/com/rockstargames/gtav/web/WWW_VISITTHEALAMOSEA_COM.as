class com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM extends com.rockstargames.ui.core.BaseWebsite
{
   var CAN_STORE_PAGE;
   var CONTENT;
   var PAGE_NAMES;
   var browser;
   var dataTextScope;
   var defaultButtonOffColour;
   var defaultButtonOnColour;
   var mcScope;
   static var PAGE1 = "PAGE1";
   static var FAQ = "FAQ";
   static var ALAMO_SEA = "ALAMO_SEA";
   static var GRAND_SENORA_DESERT = "GRAND_SENORA_DESERT";
   static var GRAPESEED = "GRAPESEED";
   static var ONEIL_RANCH = "ONEIL_RANCH";
   static var SANDY_SHORES = "SANDY_SHORES";
   static var STAB_CITY = "STAB_CITY";
   static var ZANCUDO_RIVER = "ZANCUDO_RIVER";
   function WWW_VISITTHEALAMOSEA_COM()
   {
      super();
      this.IS_SITE_DYNAMIC = 0;
      _level0.TIMELINE.DebugTextContent = true;
      this.PAGE_NAMES = ["",com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.PAGE1,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.FAQ,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.ALAMO_SEA,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.GRAND_SENORA_DESERT,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.GRAPESEED,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.ONEIL_RANCH,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.SANDY_SHORES,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.STAB_CITY,com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.ZANCUDO_RIVER];
      this.CAN_STORE_PAGE = [true,true,true,true,true,true,true,true,true,true];
      this.browser = _level0.TIMELINE;
      this.defaultButtonOnColour = 4671303;
      this.defaultButtonOffColour = 0;
   }
   function READY()
   {
   }
   function POPULATE_TEXT(pageName)
   {
      this.mcScope = this.CONTENT[pageName];
      this.dataTextScope = [];
      switch(pageName)
      {
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.PAGE1:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.ALAMO_SEA.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.FAQ:
            this.dataTextScope.push(this.mcScope.ALAMO_SEA.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            this.dataTextScope.push(this.mcScope.WWW_AMMUNATION_NET.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.ALAMO_SEA:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.GRAPESEED.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            this.dataTextScope.push(this.mcScope.WWW_AMMUNATION_NET.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.GRAPESEED:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.ALAMO_SEA.btnTxt);
            this.dataTextScope.push(this.mcScope.ONEIL_RANCH.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.ONEIL_RANCH:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.GRAPESEED.btnTxt);
            this.dataTextScope.push(this.mcScope.ZANCUDO_RIVER.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.ZANCUDO_RIVER:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.ONEIL_RANCH.btnTxt);
            this.dataTextScope.push(this.mcScope.STAB_CITY.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            this.dataTextScope.push(this.mcScope.WWW_AMMUNATION_NET.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.STAB_CITY:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.ZANCUDO_RIVER.btnTxt);
            this.dataTextScope.push(this.mcScope.SANDY_SHORES.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.SANDY_SHORES:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.STAB_CITY.btnTxt);
            this.dataTextScope.push(this.mcScope.GRAND_SENORA_DESERT.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            break;
         case com.rockstargames.gtav.web.WWW_VISITTHEALAMOSEA_COM.GRAND_SENORA_DESERT:
            this.dataTextScope.push(this.mcScope.FAQ.btnTxt);
            this.dataTextScope.push(this.mcScope.SANDY_SHORES.btnTxt);
            this.dataTextScope.push(this.mcScope.PAGE1.btnTxt);
            this.dataTextScope.push(this.mcScope.WWW_AMMUNATION_NET.btnTxt);
      }
      this.browser.SET_PAGE_BUTTONS(this.dataTextScope);
   }
}
