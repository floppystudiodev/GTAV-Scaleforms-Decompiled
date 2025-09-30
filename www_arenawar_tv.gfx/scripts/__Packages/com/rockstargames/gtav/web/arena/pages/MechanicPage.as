class com.rockstargames.gtav.web.arena.pages.MechanicPage extends com.rockstargames.gtav.web.arena.Page
{
   var nextPageName;
   var prevPageName;
   var progressPanel;
   var view;
   var website;
   function MechanicPage(website, viewContainer, pageName, isFirstPage, progressPanel)
   {
      super(website,viewContainer,"mechanicPage",pageName,isFirstPage,progressPanel);
      this.init();
   }
   function init()
   {
      if(!this.website.propertyIsOwned && this.website.mechanicA == -1)
      {
         this.website.mechanicA = 0;
      }
      if(!this.website.propertyIsOwned && this.website.mechanicB == -1)
      {
         this.website.mechanicB = 0;
      }
      this.initNav();
      this.initTitle();
      this.initDescription();
      this.initProgress();
      this.initImage();
      this.initButtons();
      this.initVerticalLayout();
      this.updateView();
   }
   function initNav()
   {
      this.prevPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.EXPANSION_FLOOR_B2_PAGE.name;
      if(this.website.purchasedPersonalQuarters != 1)
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.PERSONAL_QUARTERS_PAGE.name;
      }
      else
      {
         this.nextPageName = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.PAGES.SUMMARY_PAGE.name;
      }
   }
   function initTitle()
   {
      this.view.title.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.title,"MBA_MECHANIC").toUpperCase();
      this.view.titleGradient._width = this.view.title._width;
      this.view.titleGradientMask.autoSize = "left";
      this.view.titleGradientMask.text = this.view.title.text;
   }
   function initDescription()
   {
      this.view.description.autoSize = "left";
      com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(this.view.description,"MBA_MECHANIC_DESC");
   }
   function initProgress()
   {
      this.progressPanel.show(true);
      this.progressPanel.setProgress(6);
   }
   function initImage()
   {
      this.website.imageManager.addImage("MBA_GARAGE","MECHANIC",this.view.image.wrapper);
   }
   function initButtons()
   {
      this.initMechanicButton(0,false);
      this.initMechanicButton(1,this.website.purchasedMechanicA != 1);
      this.initMechanicButton(2,this.website.purchasedMechanicB != 1);
      this.website.browser.SET_PAGE_BUTTONS(this.website.dataTextScope);
   }
   function initMechanicButton(index, isClickable)
   {
      var _loc2_ = this.view.buttons["optionButton_" + index];
      _loc2_.onColour = 16777215;
      _loc2_.offColour = 13421772;
      _loc2_.gotoAndStop(index + 1);
      _loc2_.btnTxt.text = com.rockstargames.gtav.web.WWW_ARENAWAR_TV.setLocalisedText(_loc2_.btnTxt,"MBA_MECHANIC_" + (index + 1)).toUpperCase();
      if(isClickable)
      {
         this.website.dataTextScope.push(_loc2_.btnTxt);
      }
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
      var _loc3_;
      var _loc2_;
      if(type == "optionButton")
      {
         _loc3_ = [null,"mechanicA","mechanicB"];
         _loc2_ = parseInt(id);
         this.website[_loc3_[_loc2_]] = this.website[_loc3_[_loc2_]] != 1 ? 1 : 0;
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
      this.view.buttons.selection0._visible = true;
      this.view.buttons.selection1._visible = this.website.mechanicA == 1;
      this.view.buttons.selection2._visible = this.website.mechanicB == 1;
      this.progressPanel.updateCosts();
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.image.wrapper);
      super.dispose();
   }
}
