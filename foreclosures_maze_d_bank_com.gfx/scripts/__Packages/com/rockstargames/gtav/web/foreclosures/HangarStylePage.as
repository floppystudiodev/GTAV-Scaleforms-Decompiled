class com.rockstargames.gtav.web.foreclosures.HangarStylePage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var view;
   var progressPanel;
   var slideshow;
   static var TXD = "FORECLOSURES_HANGAR";
   function HangarStylePage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"hangarStylePage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.hangarStyle == -1)
      {
         this.website.hangarStyle = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_LIGHTING_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCHNGR_STY_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initHangarProgress(1);
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
      while(_loc2_ < 9)
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
            var _loc3_ = _loc2_ != this.website.hangarStyle;
            this.website.hangarStyle = _loc2_;
            this.updateSelectedItem(_loc3_);
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem(selectionHasChanged)
   {
      var _loc2_ = 0;
      while(_loc2_ < 9)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.hangarStyle;
         _loc2_ = _loc2_ + 1;
      }
      if(selectionHasChanged)
      {
         if(this.website.hangarLighting > 0)
         {
            this.website.hangarLighting = 0;
            this.progressPanel.showLightingExclamation();
         }
      }
      var _loc4_ = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(this.website.hangarStyle,this.website.hangarLighting) + 1;
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.HangarStylePage.TXD],["style" + _loc4_]);
      this.progressPanel.updateHangarCosts();
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
