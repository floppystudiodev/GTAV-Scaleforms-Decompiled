class com.rockstargames.gtav.web.foreclosures.SplashPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var view;
   var website;
   function SplashPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"splashPage",pageName,isFirstPage,progressPanel,header);
      this.init();
      website.setSelectedClubhouse(-1);
      progressPanel.hide();
      header._y = - header._height;
   }
   function init()
   {
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.message,"FORECLOSURES_SPLASH",false);
      this.view.enterButton.onColour = 16777215;
      this.view.enterButton.offColour = 16777215;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.enterButton.btnTxt,"FORECLOSURES_ENTER",false);
      this.website.dataTextScope.push(this.view.enterButton.btnTxt);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function handleClick(type, id)
   {
      var _loc0_ = null;
      if((_loc0_ = type) === "enterButton")
      {
         this.website.browser.GO_TO_WEBPAGE(com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name);
      }
   }
}
