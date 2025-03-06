class com.rockstargames.gtav.web.foreclosures.ArcadeExtrasPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var TXD = "FORECLOSURES_ARC";
   static var NUM_WALL_OPTIONS = 9;
   function ArcadeExtrasPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"arcadeExtrasPage",pageName,isFirstPage,progressPanel,header);
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
      var _loc2_ = this.website.getSelectedArcade();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_NEONS_PAGE.name;
      if(this.website.purchasedArcadeGarage != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_GARAGE_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initArcadeProgress(5);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCARCADE_XTR_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initOptionButtons()
   {
      var _loc2_ = undefined;
      _loc2_ = this.view.quartersButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCARCADE_QRT",false);
      if(!this.website.getSelectedArcade().isOwned || this.website.purchasedArcadeQuarters == 0)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
      _loc2_ = this.view.highScoresButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.quartersButton._y + 60;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCARCADE_HS",false);
      if(this.website.purchasedArcadeHighScores != 1)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "quartersButton":
            this.website.arcadeQuarters = this.website.arcadeQuarters != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "highScoresButton":
            this.website.arcadeHighScores = this.website.arcadeHighScores != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.quartersButton.tick._visible = this.website.arcadeQuarters == 1;
      this.view.highScoresButton.tick._visible = this.website.arcadeHighScores == 1;
      if(this.website.arcadeHighScores == 1 && this.website.arcadeQuarters == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.ArcadeExtrasPage.TXD],["extras_1"]);
      }
      else if(this.website.arcadeHighScores == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.ArcadeExtrasPage.TXD],["extras_2"]);
      }
      else if(this.website.arcadeQuarters == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.ArcadeExtrasPage.TXD],["extras_3"]);
      }
      else
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.ArcadeExtrasPage.TXD],["extras_1"]);
      }
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
