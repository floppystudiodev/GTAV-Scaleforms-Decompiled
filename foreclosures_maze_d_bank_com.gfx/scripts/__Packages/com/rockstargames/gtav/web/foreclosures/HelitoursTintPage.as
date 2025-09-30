class com.rockstargames.gtav.web.foreclosures.HelitoursTintPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var currentSelection;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_HELITOURS";
   static var NUM_TINT_OPTIONS = 9;
   function HelitoursTintPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"helitoursTintPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.helitoursTint == -1)
      {
         this.website.helitoursTint = 0;
      }
      var _loc2_ = this.website.getSelectedHelitours();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HELITOURS_SUMMARY_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HELITOURS_SUMMARY_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HELITOURS_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initHelitoursProgress(1);
      this.currentSelection = this.website.helitoursTint;
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
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.foreclosures.HelitoursTintPage.NUM_TINT_OPTIONS)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         _loc3_.selected._visible = false;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
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
            _loc3_ = _loc2_ != this.website.helitoursTint;
            this.website.helitoursTint = _loc2_;
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
      while(_loc2_ < com.rockstargames.gtav.web.foreclosures.HelitoursTintPage.NUM_TINT_OPTIONS)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.helitoursTint;
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.HelitoursTintPage.TXD],["tint_" + (this.website.helitoursTint + 1)]);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCHELITOURS_TINT_" + (this.website.helitoursTint + 1),false);
      this.progressPanel.updateHelitoursCosts();
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
