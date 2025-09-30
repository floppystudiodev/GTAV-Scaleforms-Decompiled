class com.rockstargames.gtav.web.foreclosures.ArcadeNeonsPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_ARC";
   static var NUM_NEON_OPTIONS = 9;
   function ArcadeNeonsPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"arcadeNeonsPage",pageName,isFirstPage,progressPanel,header);
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
      var _loc2_ = this.website.getSelectedArcade();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_FLOOR_PAGE.name;
      if(this.website.purchasedArcadeQuarters != 1 || this.website.purchasedArcadeHighScores != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_EXTRAS_PAGE.name;
      }
      else if(this.website.purchasedArcadeGarage != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_GARAGE_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.ARCADE_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initArcadeProgress(4);
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
      var _loc4_;
      var _loc5_;
      if(this.website.arcadeStyle != 2)
      {
         _loc4_ = 1;
         _loc5_ = 2;
      }
      else
      {
         _loc4_ = 2;
         _loc5_ = 1;
      }
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < com.rockstargames.gtav.web.foreclosures.ArcadeNeonsPage.NUM_NEON_OPTIONS)
      {
         _loc2_ = this.view.optionButtons["optionButton_" + _loc3_];
         _loc2_.swatch.gotoAndStop(_loc4_);
         _loc2_.selected._visible = false;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc4_ += _loc5_;
         _loc5_ = 1;
         _loc3_ = _loc3_ + 1;
      }
      this.view.optionButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      var _loc2_;
      var _loc3_;
      switch(type)
      {
         case "optionButton":
            _loc2_ = parseInt(id);
            _loc3_ = _loc2_ != this.website.arcadeNeon;
            this.website.arcadeNeon = _loc2_;
            this.updateSelectedItem(_loc3_);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.foreclosures.ArcadeNeonsPage.NUM_NEON_OPTIONS)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.arcadeNeon;
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = "neon_" + (this.website.arcadeNeon + 1);
      if(this.website.arcadeNeon == 0)
      {
         _loc4_ += this.website.arcadeStyle == 2 ? "_2" : "_1";
      }
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.ArcadeNeonsPage.TXD],[_loc4_]);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCARCADE_NE_" + (this.website.arcadeNeon + 1),false);
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
