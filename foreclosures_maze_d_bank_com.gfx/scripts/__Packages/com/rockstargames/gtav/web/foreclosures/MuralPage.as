class com.rockstargames.gtav.web.foreclosures.MuralPage extends com.rockstargames.gtav.web.foreclosures.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   var slideshow;
   var summaryPageName;
   static var TXD = "FORECLOSURES_MURAL";
   function MuralPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"muralPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.mural == -1)
      {
         this.website.mural = 0;
      }
      this.prevPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.MAP_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.PAGES.STYLE_PAGE.name;
      com.rockstargames.gtav.web.FORECLOSURES_MAZE_D_BANK_COM.setSpacedTextField(this.view.description,"FORECLOSURES_MURAL_DESCRIPTION",false);
      this.progressPanel.show();
      this.progressPanel.initProgress(1);
      this.slideshow = new com.rockstargames.gtav.web.foreclosures.Slideshow(this.website.imageManager,this.view.slideshow);
      this.initMuralButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initMuralButtons()
   {
      var _loc4_ = this.website.getSelectedClubhouseType() * 9 + 1;
      var _loc2_ = 0;
      while(_loc2_ < 9)
      {
         var _loc3_ = this.view.muralButtons["muralButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + _loc4_);
         _loc3_.selected._visible = false;
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.view.muralButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "muralButton":
            this.website.mural = parseInt(id);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerSelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.progressPanel.updateCosts();
      var _loc2_ = 0;
      while(_loc2_ < 9)
      {
         var _loc3_ = this.view.muralButtons["muralButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.mural;
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show([com.rockstargames.gtav.web.foreclosures.MuralPage.TXD],["MURAL_" + this.website.getSelectedClubhouseType() + "_" + this.website.mural]);
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
