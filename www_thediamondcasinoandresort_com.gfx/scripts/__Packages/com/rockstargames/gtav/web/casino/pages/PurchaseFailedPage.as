class com.rockstargames.gtav.web.casino.pages.PurchaseFailedPage extends com.rockstargames.gtav.web.casino.Page
{
   var view;
   var website;
   function PurchaseFailedPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"purchaseFailedPage",pageName,isFirstPage);
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
      if(this.website.dataProviderUI[2][0] != undefined)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.subHeading.label,this.website.dataProviderUI[2][0].toUpperCase(),4,true,true);
         this.view.subHeading.bg._width = this.view.subHeading.label.textWidth + 22;
         this.view.subHeading.label.verticalAlign = "center";
         this.view.subHeading.label._width = this.view.subHeading.bg._width;
         this.view.subHeading.bg.gotoAndStop("purpleSolid");
      }
      this.view.subHeading._x = 0.5 * (this.view.background._width - this.view.subHeading._width);
      if(this.website.dataProviderUI[1][0] != undefined)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,this.website.dataProviderUI[1][0],6,true,true);
      }
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading);
      }
   }
   function initButtons()
   {
      this.initLabelButton(this.view.homeButton,"CASWEB_HOME",3);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
      var _loc0_;
      if((_loc0_ = type) === "homeButton")
      {
         this.website.browser.GO_TO_WEBPAGE(this.website.browser.GET_CURRENT_WEBSITE());
      }
   }
}
