class com.rockstargames.gtav.web.foreclosures.GunLockerPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   static var TXD = "FORECLOSURES_GUN_LOCKER";
   function GunLockerPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"gunLockerPage",pageName,isFirstPage,progressPanel,header);
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
      var _loc2_ = this.website.getSelectedClubhouse();
      if(this.website.emblem == -1)
      {
         this.website.emblem = !(this.website.crewEmblem != "" && _loc2_.getBaseCost() > 0) ? 1 : 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.NAME_PAGE.name;
      if(!_loc2_.isOwned || this.website.purchasedBikeShop != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.BIKE_SHOP_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.SUMMARY_PAGE.name;
      }
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_GUN_LOCKER_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initProgress(5);
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton);
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.GunLockerPage.TXD],["GUN_LOCKER_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural]);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FORECLOSURES_GUN_LOCKER",false);
      if(!this.website.getSelectedClubhouse().isOwned || this.website.purchasedGunLocker == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.gunLocker = this.website.gunLocker != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.view.optionButton.tick._visible = this.website.gunLocker == 1;
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
