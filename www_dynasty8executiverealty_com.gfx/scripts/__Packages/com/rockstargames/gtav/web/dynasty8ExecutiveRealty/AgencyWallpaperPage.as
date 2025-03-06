class com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage extends com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var summaryPageName;
   var progressPanel;
   var view;
   var slideshow;
   static var TXD = "DYN8_EXEC_AGENCY";
   static var IMAGES = ["WALLPAPER0","WALLPAPER1","WALLPAPER2","WALLPAPER3","WALLPAPER4","WALLPAPER5","WALLPAPER6","WALLPAPER7","WALLPAPER8"];
   static var NUM_WALLPAPER_OPTIONS = 9;
   function AgencyWallpaperPage(website, viewContainer, pageName, isFirstPage, progressPanel, header)
   {
      super(website,viewContainer,"agencyWallpaperPage",pageName,isFirstPage,progressPanel,header);
      this.init();
   }
   function init()
   {
      if(this.website.agencyArt == -1)
      {
         this.website.agencyArt = 0;
      }
      if(this.website.agencyWallpaper == -1)
      {
         this.website.agencyWallpaper = 0;
      }
      var _loc2_ = this.website.getSelectedAgency();
      this.prevPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_ART_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_HIGHLIGHT_PAGE.name;
      this.summaryPageName = com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.PAGES.AGENCY_SUMMARY_PAGE.name;
      this.progressPanel.show();
      this.progressPanel.initAgencyProgress(2);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.description,"DYN8_EXEC_AG_WP_DESC",false);
      this.initSlideshow();
      this.initOptionButtons();
      this.updateSelectedItem();
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initSlideshow()
   {
      this.slideshow = new com.rockstargames.gtav.web.dynasty8ExecutiveRealty.Slideshow(this.website.imageManager,this.view.slideshow);
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage.TXD,[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage.IMAGES[this.website.agencyWallpaper]]);
   }
   function initOptionButtons()
   {
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage.NUM_WALLPAPER_OPTIONS)
      {
         var _loc2_ = this.view.optionButtons["wallpaperButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 16777215;
         _loc2_.swatch.gotoAndStop(_loc3_ + 1);
         _loc2_.selected._visible = false;
         this.website.dataTextScope.push(_loc2_.btnTxt);
         _loc3_ = _loc3_ + 1;
      }
      this.view.optionButtons._y = this.view.description._y + this.view.description.textHeight + 20;
   }
   function handleClick(type, id)
   {
      switch(type)
      {
         case "wallpaperButton":
            this.website.agencyWallpaper = parseInt(id);
            this.updateSelectedItem();
            break;
         case "purchaseButton":
            this.website.dispatchPlayerAgencySelections();
            this.website.browser.GO_TO_WEBPAGE(this.summaryPageName);
      }
   }
   function updateSelectedItem()
   {
      this.progressPanel.updateAgencyCosts();
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage.NUM_WALLPAPER_OPTIONS)
      {
         var _loc3_ = this.view.optionButtons["wallpaperButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.agencyWallpaper;
         _loc2_ = _loc2_ + 1;
      }
      this.slideshow.show(com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage.TXD,[com.rockstargames.gtav.web.dynasty8ExecutiveRealty.AgencyWallpaperPage.IMAGES[this.website.agencyWallpaper]]);
      com.rockstargames.gtav.web.WWW_DYNASTY8EXECUTIVEREALTY_COM.setSpacedTextField(this.view.label,"DYN8_EXEC_AG_WP_" + this.website.agencyWallpaper);
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
