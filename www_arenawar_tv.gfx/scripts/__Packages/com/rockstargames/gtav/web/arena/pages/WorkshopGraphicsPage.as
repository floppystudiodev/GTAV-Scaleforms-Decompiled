class com.rockstargames.gtav.web.arena.pages.WorkshopGraphicsPage extends com.rockstargames.gtav.web.arena.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function WorkshopGraphicsPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"workshopGraphicsPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      if(!this.website.propertyIsOwned && this.website.graphicsOption == -1)
      {
         this.website.graphicsOption = 0;
      }
      this.initNav();
      this.initTitle();
      this.initDescription();
      this.initProgress();
      this.initButtons();
      this.initVerticalLayout();
      this.updateView();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_STYLE_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_COLOUR_PAGE.name;
   }
   function initTitle()
   {
      this.view.title.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_GRAPHICS").toUpperCase();
      this.view.titleGradient._width = this.view.title._width;
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
   }
   function initDescription()
   {
      this.view.description.autoSize = "left";
   }
   function initProgress()
   {
      this.progressPanel.show(true);
      this.progressPanel.setProgress(2);
   }
   function initButtons()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_GRAPHICS_OPTIONS)
      {
         _loc3_ = this.view.buttons["optionButton_" + _loc2_];
         _loc3_.swatch.gotoAndStop(_loc2_ + 1);
         this.website.dataTextScope.push(_loc3_.btnTxt);
         _loc2_ = _loc2_ + 1;
      }
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initVerticalLayout()
   {
      if(this.website.displayConfig.isAsian)
      {
         this.view.description._y += 15;
      }
      this.view.buttons._y = this.view.description._y + this.view.description.textHeight + 30;
      var _loc2_ = this.view.buttons._y + this.view.buttons._height;
      this.view.footer._y = _loc2_ > 600 ? _loc2_ + 30 : 612;
      this.view.background._height = this.view.footer._y + 14;
      this.website.setPageHeight(this.view.background._height);
   }
   function handleClick(type, id)
   {
      if(type == "optionButton")
      {
         this.website.graphicsOption = parseInt(id);
         this.updateView();
      }
   }
   function handleLB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.prevPageName);
   }
   function handleRB()
   {
      this.website.browser.GO_TO_WEBPAGE(this.nextPageName);
   }
   function updateView()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_GRAPHICS_OPTIONS)
      {
         _loc3_ = this.view.buttons["optionButton_" + _loc2_];
         _loc3_.selected._visible = _loc2_ == this.website.graphicsOption;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.description,"MBA_GRAPHICS_" + (this.website.graphicsOption + 1) + "_DESC");
      this.website.imageManager.addImage("MBA_GARAGE","GRAPHICS" + (this.website.graphicsOption + 1),this.view.image.wrapper,true);
      this.progressPanel.updateCosts();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image.wrapper);
      super.dispose();
   }
}
