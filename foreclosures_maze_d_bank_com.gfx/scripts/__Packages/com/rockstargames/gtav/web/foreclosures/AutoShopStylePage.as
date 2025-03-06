class com.rockstargames.gtav.web.foreclosures.AutoShopStylePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var currentSelection;
   var slideshow;
   var view;
   static var TXD = "FORECLOSURES_AUTO";
   static var NUM_STYLE_OPTIONS = 9;
   function AutoShopStylePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"autoShopStylePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.autoShopStyle == -1)
      {
         this.website.autoShopStyle = 0;
      }
      var _loc2_ = this.website.getSelectedAutoShop();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_TINT_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initAutoShopProgress(1);
      this.currentSelection = this.website.autoShopStyle;
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
      while(_loc2_ < com.rockstargames.gtav.web.foreclosures.AutoShopStylePage.NUM_STYLE_OPTIONS)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         _loc3_.selected._visible = false;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.view.optionButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            var _loc2_ = parseInt(id);
            var _loc3_ = _loc2_ != this.website.autoShopStyle;
            this.website.autoShopStyle = _loc2_;
            this.updateSelectedItem(_loc3_);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.web.foreclosures.AutoShopStylePage.NUM_STYLE_OPTIONS)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.autoShopStyle;
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.AutoShopStylePage.TXD],["style_" + (this.website.autoShopStyle + 1)]);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCAUTOSHOP_STYLE_" + (this.website.autoShopStyle + 1),false);
      this.progressPanel.updateAutoShopCosts();
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
