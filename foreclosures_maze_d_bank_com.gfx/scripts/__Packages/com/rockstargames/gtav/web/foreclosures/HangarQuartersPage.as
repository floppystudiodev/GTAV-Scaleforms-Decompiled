class com.rockstargames.gtav.web.foreclosures.HangarQuartersPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var view;
   var progressPanel;
   var slideshow;
   static var TXD = "FORECLOSURES_HANGAR";
   function HangarQuartersPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"hangarQuartersPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.hangarStyle == -1)
      {
         this.website.hangarStyle = 0;
      }
      if(this.website.hangarLighting == -1)
      {
         this.website.hangarLighting = 0;
      }
      if(this.website.hangarDecal == -1)
      {
         this.website.hangarDecal = 4;
      }
      if(this.website.hangarFurniture == -1)
      {
         this.website.hangarFurniture = 0;
      }
      if(this.website.hangarQuarters == -1)
      {
         this.website.hangarQuarters = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FURNITURE_PAGE.name;
      var _loc2_ = this.website.getSelectedHangar();
      if(this.website.purchasedHangarWorkshop != 1 || !_loc2_.isOwned)
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_WORKSHOP_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      }
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCHNGR_QRT_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initHangarProgress(5);
      this.initSlideshow();
      this.initOptionButton(this.view.optionButton);
      this.initSelectionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      var _loc2_ = this.website.hangarQuarters == 2 ? 2 : 1;
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.HangarQuartersPage.TXD],["quarters" + _loc2_]);
   }
   function initOptionButton(buttonView)
   {
      buttonView.onColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      buttonView.offColour = com.rockstargames.gtav.web.foreclosures.Page.BUTTON_COLOUR;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(buttonView.btnTxt,"FCHNGR_QRT",false);
      if(!this.website.getSelectedHangar().isOwned || this.website.purchasedHangarQuarters == 0)
      {
         this.website.dataTextScope.push(buttonView.btnTxt);
      }
      buttonView._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function initSelectionButtons()
   {
      var _loc2_ = undefined;
      var _loc3_ = 0;
      while(_loc3_ < 2)
      {
         _loc2_ = this.view["furnitureButton_" + _loc3_];
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_.selected._visible = false;
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(_loc2_.btnTxt,"FCHNGR_FRN_" + (_loc3_ + 2));
         _loc2_._y = this.view.optionButton._y + this.view.optionButton._height + 20;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.hangarQuarters = this.website.hangarQuarters != 0 ? 0 : 1;
            this.updateSelectedItem();
            break;
         case "furnitureButton":
            this.website.hangarQuarters = parseInt(id) + 1;
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.view.optionButton.tick._visible = this.website.hangarQuarters != 0;
      this.view.furnitureButton_0._alpha = this.website.hangarQuarters == 0 ? 0 : 100;
      this.view.furnitureButton_1._alpha = this.website.hangarQuarters == 0 ? 0 : 100;
      this.view.furnitureButton_0.selected._visible = this.website.hangarQuarters == 1;
      this.view.furnitureButton_1.selected._visible = this.website.hangarQuarters == 2;
      this.view.furnitureButton_0.disabled = this.website.hangarQuarters == 0;
      this.view.furnitureButton_1.disabled = this.website.hangarQuarters == 0;
      this.progressPanel.updateHangarCosts();
      var _loc2_ = this.website.hangarQuarters == 2 ? 2 : 1;
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.HangarQuartersPage.TXD],["quarters" + _loc2_]);
   }
   function setDisabledButtons()
   {
      this.view.furnitureButton_0._alpha = this.website.hangarQuarters == 0 ? 0 : 100;
      this.view.furnitureButton_1._alpha = this.website.hangarQuarters == 0 ? 0 : 100;
      this.view.furnitureButton_0.disabled = this.website.hangarQuarters == 0;
      this.view.furnitureButton_1.disabled = this.website.hangarQuarters == 0;
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
