class com.rockstargames.gtav.web.casino.pages.UnderConstructionPage extends com.rockstargames.gtav.web.casino.Page
{
   var view;
   var website;
   function UnderConstructionPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"underConstructionPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initSubHeading(this.view.subHeading,"CASWEB_SOZ",false);
      this.view.subHeading.bg.gotoAndStop("purpleSolid");
      this.view.subHeading._x = 0.5 * (this.view.background._width - this.view.subHeading._width);
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_UNDERC",6,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading);
      }
      this.initVerticalLayout();
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
}
