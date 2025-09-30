class com.rockstargames.gtav.web.foreclosures.HangarFurniturePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_HANGAR";
   function HangarFurniturePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"hangarFurniturePage",pageName,isFirstPage,progressPanel,header);
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
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FLOORING_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_QUARTERS_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCHNGR_FRN_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initHangarProgress(4);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
   }
   function initOptionButtons()
   {
      var _loc2_;
      var _loc3_ = 0;
      while(_loc3_ < 3)
      {
         _loc2_ = this.view["optionButton_" + _loc3_];
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_.selected._visible = false;
         com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setLocalisedText(_loc2_.btnTxt,"FCHNGR_FRN_" + (_loc3_ + 1));
         _loc2_._y = this.view.description._y + this.view.description.textHeight + 20;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.hangarFurniture = parseInt(id);
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
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < 3)
      {
         _loc3_ = this.view["optionButton_" + _loc2_];
         _loc3_.selected._visible = this.website.hangarFurniture == _loc2_;
         _loc2_ = _loc2_ + 1;
      }
      this.progressPanel.updateHangarCosts();
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.HangarFurniturePage.TXD],["furniture" + (this.website.hangarFurniture + 1)]);
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
