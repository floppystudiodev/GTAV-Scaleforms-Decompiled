class com.rockstargames.gtav.web.foreclosures.HangarFlooringPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   var view;
   var website;
   static var TXD = "FORECLOSURES_HANGAR";
   function HangarFlooringPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"hangarFlooringPage",pageName,isFirstPage,progressPanel,header);
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
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_LIGHTING_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_FURNITURE_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.HANGAR_SUMMARY_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FCHNGR_FLR_DESC",false);
      this.progressPanel.show();
      this.progressPanel.initHangarProgress(3);
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
      var _loc3_;
      while(_loc2_ < 9)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
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
            this.website.hangarDecal = parseInt(id);
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
      while(_loc2_ < 9)
      {
         _loc3_ = this.view.optionButtons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.hangarDecal;
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.HangarFlooringPage.TXD],["decal" + (this.website.hangarDecal + 1)]);
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
