class com.rockstargames.gtav.web.casino.pages.PurchaseSuccessPage extends com.rockstargames.gtav.web.casino.Page
{
   var view;
   var website;
   function PurchaseSuccessPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"purchaseSuccessPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initText();
      this.initButtons();
      this.initVerticalLayout();
   }
   function initText()
   {
      this.initSubHeading(this.view.subHeading,"CASWEB_CONGRATS",false);
      this.view.subHeading.bg.gotoAndStop("purpleSolid");
      this.view.subHeading._x = 0.5 * (this.view.background._width - this.view.subHeading._width);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_BOUGHT",6,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading);
      }
   }
   function initButtons()
   {
      this.initLabelButton(this.view.waypointButton,"CASWEB_WAYPOINT",3);
      this.initLabelButton(this.view.homeButton,"CASWEB_HOME",3);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
      var _loc0_ = null;
      if((_loc0_ = type) === "homeButton")
      {
         this.website.browser.GO_TO_WEBPAGE(this.website.browser.GET_CURRENT_WEBSITE());
      }
   }
}
