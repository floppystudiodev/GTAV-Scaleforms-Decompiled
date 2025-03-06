class com.rockstargames.gtav.web.casino.pages.MembershipPendingPage extends com.rockstargames.gtav.web.casino.Page
{
   var view;
   var website;
   function MembershipPendingPage(website, viewContainer, pageName, isFirstPage)
   {
      super(website,viewContainer,"membershipPendingPage",pageName,isFirstPage);
      this.init();
   }
   function init()
   {
      this.initText();
      this.initVerticalLayout();
   }
   function initText()
   {
      com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.setSpacedTextField(this.view.heading,"CASWEB_PEND",6,true,false);
      if(this.website.displayConfig.isAsian)
      {
         com.rockstargames.gtav.web.WWW_THEDIAMONDCASINOANDRESORT_COM.resizeAsianText(this.view.heading);
      }
   }
   function initVerticalLayout()
   {
      this.website.setPageHeight(this.view.background._height);
   }
}
