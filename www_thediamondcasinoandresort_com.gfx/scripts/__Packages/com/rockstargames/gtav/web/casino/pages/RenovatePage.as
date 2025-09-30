class com.rockstargames.gtav.web.casino.pages.RenovatePage extends com.rockstargames.gtav.web.casino.Page
{
   var nextPageName;
   var prevPageName;
   var view;
   var website;
   function RenovatePage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"renovatePage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initNav();
      this.initText();
      this.initButtons();
      this.initVerticalLayout();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SPLASH_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.SUITE_OPTIONS_PAGE.name;
   }
   function initText()
   {
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_RENO_HEADING",6,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading);
      }
      this.initSubHeading(this.view.subHeading,"CASWEB_RENO_SUBHEADING",false);
      this.view.body.autoSize = "left";
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setLocalisedText(this.view.body,"CASWEB_RENO_BODY");
   }
   function initButtons()
   {
      this.website.dataTextScope.push(this.view.logo.btnTxt);
      this.initLabelButton(this.view.customiseButton,"CASWEB_START");
      this.initTopNav(this.view.topNav.suitesButton);
      this.initBottomNav(this.view.footer.suitesButton);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "logo":
         case "homeButton":
            this.website.browser.GO_TO_WEBPAGE(this.website.browser.GET_CURRENT_WEBSITE());
            break;
         case "casinoButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.CASINO_PAGE.name);
            break;
         case "suitesButton":
            this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.PAGES.RENOVATE_PAGE.name);
            break;
         case "customiseButton":
            this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
         default:
            return;
      }
   }
}
