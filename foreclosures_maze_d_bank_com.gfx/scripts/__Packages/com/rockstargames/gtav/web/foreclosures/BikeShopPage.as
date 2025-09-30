class com.rockstargames.gtav.web.foreclosures.BikeShopPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_BIKE_SHOP";
   function BikeShopPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"bikeShopPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.mural == -1)
      {
         this.website.mural = 0;
      }
      if(this.website.wall == -1)
      {
         this.website.wall = 0;
      }
      if(this.website.hanging == -1)
      {
         this.website.hanging = 0;
      }
      if(this.website.furniture == -1)
      {
         this.website.furniture = 0;
      }
      if(this.website.font == -1)
      {
         this.website.font = 0;
      }
      if(this.website.fontColour == -1)
      {
         this.website.fontColour = 0;
      }
      if(this.website.hideSignage == -1)
      {
         this.website.hideSignage = 0;
      }
      if(this.website.gunLocker == -1)
      {
         this.website.gunLocker = 0;
      }
      if(this.website.bikeShop == -1)
      {
         this.website.bikeShop = 0;
      }
      var _loc2_ = this.website.getSelectedClubhouse();
      if(this.website.emblem == -1)
      {
         this.website.emblem = !(this.website.crewEmblem != "" && _loc2_.getBaseCost() > 0) ? 1 : 0;
      }
      if(!_loc2_.isOwned || this.website.purchasedGunLocker != 1)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.GUN_LOCKER_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NAME_PAGE.name;
      }
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_BIKE_SHOP_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initProgress(6);
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.BikeShopPage.TXD],["BIKE_SHOP_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural]);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FORECLOSURES_BIKE_SHOP",false);
      if(!this.website.getSelectedClubhouse().isOwned || this.website.purchasedBikeShop == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.bikeShop = this.website.bikeShop != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem()
   {
      this.view.optionButton.tick._visible = this.website.bikeShop == 1;
      this.progressPanel.updateCosts();
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
