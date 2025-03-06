class com.rockstargames.gtav.web.foreclosures.HangarLightingPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var view;
   var progressPanel;
   var numOptions;
   var optionOffset;
   var slideshow;
   static var TXD = "FORECLOSURES_HANGAR";
   function HangarLightingPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"hangarLightingPage",pageName,isFirstPage,progressPanel,header);
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
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_STYLE_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FLOORING_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCHNGR_LGT_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initHangarProgress(2);
      this.progressPanel.hideLightingExclamation();
      this.numOptions = com.rockstargames.gtav.web.foreclosures.Hangar.getNumLightingOptions(this.website.hangarStyle);
      this.optionOffset = com.rockstargames.gtav.web.foreclosures.Hangar.getAbsoluteLightingIndex(this.website.hangarStyle,0) + 1;
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
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         if(_loc2_ < this.numOptions)
         {
            _loc3_.swatch.gotoAndStop(_loc2_ + this.optionOffset);
            _loc3_.selected._visible = false;
            this.website.dataTextScope.push(_loc3_.btnTxt);
         }
         else
         {
            _loc3_._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.view.optionButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "optionButton":
            this.website.hangarLighting = parseInt(id);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      var _loc2_ = 0;
      while(_loc2_ < 4)
      {
         var _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.hangarLighting;
         _loc2_ = _loc2_ + 1;
      }
      var _loc4_ = this.website.hangarLighting + this.optionOffset;
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.HangarLightingPage.TXD],["light" + _loc4_]);
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
