class com.rockstargames.gtav.web.foreclosures.NightclubStoragePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var TXD = "FORECLOSURES_CLUB";
   function NightclubStoragePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"nightclubStoragePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.nightclubStyle == -1)
      {
         this.website.nightclubStyle = 0;
      }
      if(this.website.nightclubLighting == -1)
      {
         this.website.nightclubLighting = 0;
      }
      if(this.website.nightclubName == -1)
      {
         this.website.nightclubName = 0;
      }
      if(this.website.nightclubStorage == -1)
      {
         this.website.nightclubStorage = 0;
      }
      if(this.website.nightclubGarage == -1)
      {
         this.website.nightclubGarage = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_NAME_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_DANCERS_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NIGHTCLUB_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initNightclubProgress(4);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.storageDescription,"FCCLUB_STOR_DESC",false);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.garageDescription,"FCCLUB_GARG_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.NightclubStoragePage.TXD],["storage"]);
   }
   function initOptionButtons()
   {
      var _loc6_ = this.website.getSelectedNightclub();
      var _loc4_ = this.website.purchasedNightclubStorage != -1 ? this.website.purchasedNightclubStorage + 1 : 1;
      var _loc5_ = this.website.purchasedNightclubGarage != -1 ? this.website.purchasedNightclubGarage + 1 : 1;
      this.view.storageButtons.icon.gotoAndStop("storage");
      var _loc7_ = [0,33,36,36,57];
      var _loc3_ = 1;
      while(_loc3_ <= 4)
      {
         var _loc2_ = this.view.storageButtons["storageButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 16777215;
         _loc2_.btnTxt.text = _loc3_ + 1;
         _loc2_.state.gotoAndStop(_loc3_ > this.website.nightclubStorage ? "off" : "on");
         _loc2_.btnTxt._x = _loc7_[_loc3_];
         _loc2_.tick._visible = _loc3_ < _loc4_;
         _loc2_.tick._x = _loc2_.btnTxt._x + _loc2_.btnTxt.textWidth + 0.5 * (_loc2_.btnTxt._width - _loc2_.btnTxt.textWidth) + 10;
         if(_loc3_ > _loc6_.numAvailableStorage)
         {
            _loc2_._visible = false;
         }
         else if(_loc3_ >= _loc4_)
         {
            this.website.dataTextScope.push(_loc2_.btnTxt);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.view.garageButtons.icon.gotoAndStop("garage");
      _loc7_ = [0,33,36,57];
      _loc3_ = 1;
      while(_loc3_ <= 3)
      {
         _loc2_ = this.view.garageButtons["garageButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 16777215;
         _loc2_.btnTxt.text = _loc3_ + 1;
         _loc2_.state.gotoAndStop(_loc3_ > this.website.nightclubGarage ? "off" : "on");
         _loc2_.btnTxt._x = _loc7_[_loc3_];
         _loc2_.tick._visible = _loc3_ < _loc5_;
         _loc2_.tick._x = _loc2_.btnTxt._x + _loc2_.btnTxt.textWidth + 0.5 * (_loc2_.btnTxt._width - _loc2_.btnTxt.textWidth) + 10;
         if(_loc3_ > _loc6_.numAvailableGarage)
         {
            _loc2_._visible = false;
         }
         else if(_loc3_ >= _loc5_)
         {
            this.website.dataTextScope.push(_loc2_.btnTxt);
         }
         _loc3_ = _loc3_ + 1;
      }
      this.view.storageButtons._y = this.view.storageDescription._y + this.view.storageDescription.textHeight + 20;
      this.view.garageDescription._y = this.view.storageButtons._y + this.view.storageButtons._height + 20;
      this.view.garageButtons._y = this.view.garageDescription._y + this.view.garageDescription.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "storageButton":
            var _loc2_ = parseInt(id);
            this.website.nightclubStorage = _loc2_ != this.website.nightclubStorage ? _loc2_ : _loc2_ - 1;
            this.slideshow.show([com.rockstargames.gtav.web.foreclosures.NightclubStoragePage.TXD],["storage"]);
            this.updateSelectedItem();
            break;
         case "garageButton":
            _loc2_ = parseInt(id);
            this.website.nightclubGarage = _loc2_ != this.website.nightclubGarage ? _loc2_ : _loc2_ - 1;
            this.slideshow.show([com.rockstargames.gtav.web.foreclosures.NightclubStoragePage.TXD],["garage" + Math.max(1,this.website.nightclubGarage)]);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      var _loc2_ = 1;
      while(_loc2_ <= 4)
      {
         var _loc3_ = this.view.storageButtons["storageButton_" + _loc2_];
         _loc3_.state.gotoAndStop(_loc2_ > this.website.nightclubStorage ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
      _loc2_ = 1;
      while(_loc2_ <= 3)
      {
         _loc3_ = this.view.garageButtons["garageButton_" + _loc2_];
         _loc3_.state.gotoAndStop(_loc2_ > this.website.nightclubGarage ? "off" : "on");
         _loc2_ = _loc2_ + 1;
      }
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
