class com.rockstargames.gtav.web.arena.pages.WorkshopStylePage extends com.rockstargames.gtav.web.arena.Page
{
   var website;
   var prevPageName;
   var nextPageName;
   var view;
   var progressPanel;
   function WorkshopStylePage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"workshopStylePage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      if(!this.website.propertyIsOwned && this.website.styleOption == -1)
      {
         this.website.styleOption = 0;
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
      this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SPLASH_PAGE.name;
      this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.WORKSHOP_GRAPHICS_PAGE.name;
   }
   function initTitle()
   {
      this.view.title.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_STYLE").toUpperCase();
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
      this.progressPanel.setProgress(1);
   }
   function initButtons()
   {
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_STYLE_OPTIONS)
      {
         var _loc2_ = this.view.buttons["optionButton_" + _loc3_];
         _loc2_.onColour = 16777215;
         _loc2_.offColour = 13421772;
         _loc2_.btnTxt.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc2_.btnTxt,"MBA_STYLE_" + (_loc3_ + 1)).toUpperCase();
         this.website.dataTextScope.push(_loc2_.btnTxt);
         if(this.website.displayConfig.isAsian)
         {
            com.rockstargames.gtav.web.WWW_ARENAWAR_TV.resizeAsianText(_loc2_.btnTxt);
         }
         _loc3_ = _loc3_ + 1;
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
         this.website.styleOption = parseInt(id);
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
      while(_loc2_ < com.rockstargames.gtav.web.WWW_ARENAWAR_TV.NUM_STYLE_OPTIONS)
      {
         this.view.buttons["optionButton_" + _loc2_].selected._visible = _loc2_ == this.website.styleOption;
         this.view.buttons["cross" + _loc2_]._visible = _loc2_ == this.website.styleOption;
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.description,"MBA_STYLE_" + (this.website.styleOption + 1) + "_DESC");
      this.website.imageManager.addImage("MBA_GARAGE","STYLE" + (this.website.styleOption + 1),this.view.image.wrapper,true);
      this.progressPanel.updateCosts();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image.wrapper);
      super.dispose();
   }
}
