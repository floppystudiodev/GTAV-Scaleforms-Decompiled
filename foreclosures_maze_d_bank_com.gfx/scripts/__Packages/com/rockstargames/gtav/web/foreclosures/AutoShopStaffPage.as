class com.rockstargames.gtav.web.foreclosures.AutoShopStaffPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var TXD = "FORECLOSURES_AUTO";
   static var NUM_WALL_OPTIONS = 9;
   function AutoShopStaffPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"autoShopStaffPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.autoShopStyle == -1)
      {
         this.website.autoShopStyle = 0;
      }
      if(this.website.autoShopTint == -1)
      {
         this.website.autoShopTint = 0;
      }
      if(this.website.autoShopEmblem == -1)
      {
         this.website.autoShopEmblem = this.website.autoShopCrewEmblem != "" ? 0 : 1;
      }
      if(this.website.autoShopName == -1)
      {
         this.website.autoShopName = 0;
      }
      if(this.website.autoShopStaff1 == -1)
      {
         this.website.autoShopStaff1 = 0;
      }
      if(this.website.autoShopStaff2 == -1)
      {
         this.website.autoShopStaff2 = 0;
      }
      var _loc2_ = this.website.getSelectedAutoShop();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EMBLEM_PAGE.name;
      if(this.website.purchasedAutoShopCarLift != 1 || this.website.purchasedAutoShopQuarters != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EXTRAS_PAGE.name;
      }
      else if(this.website.purchasedAutoShopMembership != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_MEMBERSHIP_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initAutoShopProgress(4);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCAUTOSHOP_STF_DESC",false);
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
      _loc2_ = this.view.staff1Button;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCAUTOSHOP_STAFF1",false);
      if(!this.website.getSelectedAutoShop().isOwned || this.website.purchasedAutoShopStaff1 == 0)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
      _loc2_ = this.view.staff2Button;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.staff1Button._y + 60;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCAUTOSHOP_STAFF2",false);
      if(!this.website.getSelectedAutoShop().isOwned || this.website.purchasedAutoShopStaff2 == 0)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "staff1Button":
            this.website.autoShopStaff1 = this.website.autoShopStaff1 != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "staff2Button":
            this.website.autoShopStaff2 = this.website.autoShopStaff2 != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.staff1Button.tick._visible = this.website.autoShopStaff1 == 1;
      this.view.staff2Button.tick._visible = this.website.autoShopStaff2 == 1;
      if(this.website.autoShopStaff1 == 1 && this.website.autoShopStaff2 == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.AutoShopStaffPage.TXD],["staff_1_2"]);
      }
      else if(this.website.autoShopStaff1 == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.AutoShopStaffPage.TXD],["staff_1"]);
      }
      else if(this.website.autoShopStaff2 == 1)
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.AutoShopStaffPage.TXD],["staff_2"]);
      }
      else
      {
         this.slideshow.show([com.rockstargames.gtav.web.foreclosures.AutoShopStaffPage.TXD],["staff_1_2"]);
      }
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
