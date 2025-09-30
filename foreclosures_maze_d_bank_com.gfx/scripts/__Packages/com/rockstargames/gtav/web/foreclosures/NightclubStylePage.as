class com.rockstargames.gtav.web.foreclosures.NightclubStylePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_CLUB";
   function NightclubStylePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"nightclubStylePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.nightclubStyle == -1)
      {
         this.website.nightclubStyle = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_LIGHTING_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initNightclubProgress(1);
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
      while(_loc2_ < 3)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         _loc3_.selected._visible = false;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.view.optionButtons._y = Math.max(368,this.view.description._y + this.view.description.textHeight + 20);
   }
   function handleClick(type, id)
   {
      var _loc2_;
      var _loc3_;
      switch(type)
      {
         case "optionButton":
            _loc2_ = parseInt(id);
            _loc3_ = _loc2_ != this.website.nightclubStyle;
            this.website.nightclubStyle = _loc2_;
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
      while(_loc2_ < 3)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.nightclubStyle;
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = [];
      var _loc4_ = [];
      _loc2_ = 1;
      while(_loc2_ <= 4)
      {
         _loc5_.push(com.rockstargames.gtav.web.foreclosures.NightclubStylePage.TXD);
         _loc4_.push("style" + (this.website.nightclubStyle + 1) + "_" + _loc2_);
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(_loc5_,_loc4_);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCCLUB_STY_DESC_" + (this.website.nightclubStyle + 1),false);
      this.progressPanel.updateNightclubCosts();
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
