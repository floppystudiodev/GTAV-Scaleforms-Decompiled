class com.rockstargames.gtav.web.foreclosures.AutoShopEmblemPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var currentSelection;
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_AUTO";
   static var NUM_EMBLEM_OPTIONS = 9;
   var buttonStart = 0;
   function AutoShopEmblemPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"autoShopEmblemPage",pageName,isFirstPage,progressPanel,header);
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
      var _loc2_ = this.website.getSelectedAutoShop();
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_TINT_PAGE.name;
      if(this.website.purchasedAutoShopStaff1 != 1 || this.website.purchasedAutoShopStaff2 != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.AUTO_SHOP_STAFF_PAGE.name;
      }
      else if(this.website.purchasedAutoShopCarLift != 1 || this.website.purchasedAutoShopQuarters != 1 || !_loc2_.isOwned)
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
      this.progressPanel.initAutoShopProgress(3);
      this.currentSelection = this.website.autoShopEmblem;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.emblemDescription,"FCAUTOSHOP_EMBLEM_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem(true);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.view.slideshow.reveal._visible = false;
   }
   function initOptionButtons()
   {
      if(this.website.autoShopCrewEmblem == "")
      {
         this.view.optionButtons.gotoAndStop("noCrew");
         this.buttonStart = 1;
      }
      else
      {
         this.view.optionButtons.gotoAndStop("crew");
         this.buttonStart = 0;
      }
      var _loc2_ = this.buttonStart;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.foreclosures.AutoShopEmblemPage.NUM_EMBLEM_OPTIONS)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         _loc3_.selected._visible = false;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.view.optionButtons._y = this.view.emblemDescription._y + this.view.emblemDescription.textHeight + 10;
      this.view.emblemChoice._y = this.view.optionButtons._y + this.view.optionButtons._height + 10;
      this.view.divider._y = this.view.emblemChoice._y + this.view.emblemChoice._height + 10;
      this.view.nameDescription._y = this.view.divider._y + this.view.divider._height + 20;
      if(this.website.autoShopCrewName != undefined && this.website.autoShopCrewName.length > 0)
      {
         this.view.nameButton = this.view.nameButton;
         this.view.nameButton.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         this.view.nameButton.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nameButton.btnTxt,this.website.autoShopCrewName,true);
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.nameDescription,"FCAUTOSHOP_NAME_DESC",false);
         if(!this.website.getSelectedAutoShop().isOwned || this.website.purchasedAutoShopName == 0)
         {
            this.website.dataTextScope.push(this.view.nameButton.btnTxt);
         }
      }
      else
      {
         this.view.nameButton._visible = false;
         this.view.divider._visible = false;
      }
      this.view.nameButton._y = this.view.nameDescription._y + this.view.nameDescription.textHeight + 10;
   }
   function handleClick(type, id)
   {
      var _loc2_;
      var _loc3_;
      switch(type)
      {
         case "optionButton":
            _loc2_ = parseInt(id);
            _loc3_ = _loc2_ != this.website.autoShopEmblem;
            this.website.autoShopEmblem = _loc2_;
            this.updateSelectedItem(_loc3_);
            break;
         case "nameButton":
            this.website.autoShopName = this.website.autoShopName != 0 ? 0 : 1;
            this.updateSelectedItem(false);
            break;
         case "purchaseButton":
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
         default:
            return;
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      var _loc2_ = this.buttonStart;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.foreclosures.AutoShopEmblemPage.NUM_EMBLEM_OPTIONS)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.autoShopEmblem;
         _loc2_ = _loc2_ + 1;
      }
      if(selectionHasChanged)
      {
         this.website.imageManager.addImage(com.rockstargames.gtav.web.foreclosures.AutoShopEmblemPage.TXD,"emblem_" + (this.website.autoShopEmblem + 1),this.view.slideshow.imageFront.tf);
         if(this.website.autoShopEmblem == 0 && this.website.autoShopCrewEmblem != "")
         {
            this.website.imageManager.addImage(this.website.autoShopCrewEmblem,this.website.autoShopCrewEmblem,this.view.scEmblem);
         }
         else
         {
            this.view.scEmblem.text = "";
         }
      }
      this.view.nameButton.tick._visible = this.website.autoShopName == 1;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.emblemChoice,"FCAUTOSHOP_EMBLEM_" + (this.website.autoShopEmblem + 1),false);
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
      super.dispose();
   }
}
