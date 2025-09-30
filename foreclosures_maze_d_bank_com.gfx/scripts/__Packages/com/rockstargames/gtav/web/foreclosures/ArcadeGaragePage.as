class com.rockstargames.gtav.web.foreclosures.ArcadeGaragePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_ARC";
   function ArcadeGaragePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"arcadeGaragePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.arcadeMural == -1)
      {
         this.website.arcadeMural = 0;
      }
      if(this.website.arcadeStyle == -1)
      {
         this.website.arcadeStyle = 0;
      }
      if(this.website.arcadeFloor == -1)
      {
         this.website.arcadeFloor = 0;
      }
      if(this.website.arcadeNeon == -1)
      {
         this.website.arcadeNeon = 0;
      }
      if(this.website.arcadeQuarters == -1)
      {
         this.website.arcadeQuarters = 0;
      }
      if(this.website.arcadeHighScores == -1)
      {
         this.website.arcadeHighScores = 0;
      }
      if(this.website.arcadeGarage == -1)
      {
         this.website.arcadeGarage = 0;
      }
      var _loc2_ = this.website.getSelectedArcade();
      if(this.website.purchasedArcadeQuarters != 1 || this.website.purchasedArcadeHighScores != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_EXTRAS_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_NEONS_PAGE.name;
      }
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_SUMMARY_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initArcadeProgress(6);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCARCADE_GRG_DESC",false);
      this.initSlideshow();
      this.initOptionButton();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.ArcadeGaragePage.TXD],["garage"]);
   }
   function initOptionButton()
   {
      var _loc2_ = this.view.optionButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCARCADE_GRG",false);
      if(!this.website.getSelectedArcade().isOwned || this.website.purchasedArcadeGarage == 0)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.arcadeGarage = this.website.arcadeGarage != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem()
   {
      this.view.optionButton.tick._visible = this.website.arcadeGarage != 0;
      this.progressPanel.updateArcadeCosts();
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
   }
   function dispose()
   {
      this.slideshow.dispose();
      super.dispose();
   }
}
