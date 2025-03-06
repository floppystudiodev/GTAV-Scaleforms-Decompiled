class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.SplashPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var view;
   var website;
   function SplashPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"splashPage",pageName,isFirstPage,progressPanel,header);
      this.init();
      website.setSelectedOffice(-1);
      progressPanel.hide();
      header._y = - header._height;
   }
   function init()
   {
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.message,"DYN8_SPLASH",false);
      this.view.enterButton.onColour = 16777215;
      this.view.enterButton.offColour = 1141559;
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.enterButton.btnTxt,"DYN8_EXEC_ENTER",false);
      this.website.dataTextScope.push(this.view.enterButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function handleClick(type, id)
   {
      var _loc0_ = null;
      if((_loc0_ = type) === "enterButton")
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.MAP_PAGE.name);
      }
   }
}
