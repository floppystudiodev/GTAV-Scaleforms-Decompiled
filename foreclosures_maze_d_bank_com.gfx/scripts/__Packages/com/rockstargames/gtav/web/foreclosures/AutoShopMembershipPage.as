class com.rockstargames.gtav.web.foreclosures.AutoShopMembershipPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_AUTO";
   function AutoShopMembershipPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"autoShopMembershipPage",pageName,isFirstPage,progressPanel,header);
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
      if(this.website.autoShopCarLift == -1)
      {
         this.website.autoShopCarLift = 0;
      }
      if(this.website.autoShopQuarters == -1)
      {
         this.website.autoShopQuarters = 0;
      }
      if(this.website.autoShopMembership == -1)
      {
         this.website.autoShopMembership = 0;
      }
      var _loc2_ = this.website.getSelectedAutoShop();
      if(this.website.purchasedAutoShopQuarters != 1 || this.website.purchasedAutoShopCarLift != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EXTRAS_PAGE.name;
      }
      else if(this.website.purchasedAutoShopStaff1 != 1 || this.website.purchasedAutoShopStaff2 != 1 || !_loc2_.isOwned)
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_STAFF_PAGE.name;
      }
      else
      {
         this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_EMBLEM_PAGE.name;
      }
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_SUMMARY_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initAutoShopProgress(6);
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCAUTOSHOP_MBR_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(false);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.AutoShopMembershipPage.TXD],["membership"]);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initOptionButtons()
   {
      var _loc2_;
      _loc2_ = this.view.membershipButton;
      _loc2_.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(_loc2_.btnTxt,"FCAUTOSHOP_CARMEET_MBR",false);
      if(!this.website.getSelectedAutoShop().isOwned || this.website.purchasedAutoShopMembership == 0)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "membershipButton":
            this.website.autoShopMembership = this.website.autoShopMembership != 0 ? 0 : 1;
            this.updateSelectedItem(true);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      this.view.membershipButton.tick._visible = this.website.autoShopMembership == 1;
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
