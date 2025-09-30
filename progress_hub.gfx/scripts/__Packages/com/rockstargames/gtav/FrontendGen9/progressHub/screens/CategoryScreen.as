class com.rockstargames.gtav.FrontendGen9.progressHub.screens.CategoryScreen extends com.rockstargames.gtav.FrontendGen9.progressHub.screens.Screen
{
   var _carousel;
   var app;
   var buttons;
   var carouselButtons;
   var cursor;
   var dataObject;
   var screenDataArray;
   var screenDataObject;
   var setUpText;
   var setupCarousel;
   var view;
   function CategoryScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"CategoryScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.setUpText(this.view.screenTitle,this.dataObject.screenTitle,false,"center");
      this.setupTabs();
      this.setupCarousel();
      this.setupButtons();
   }
   function updateScreen(index)
   {
      this.screenDataObject = this.screenDataArray[index];
      this.setUpText(this.view.titleText,this.screenDataObject.title,true,"center");
      this.setUpText(this.view.descriptionText,this.screenDataObject.description,false,"top",0.15);
      this.view.descriptionText._height = 306;
      this.view.descriptionText.html = true;
      this.view.descriptionText.htmlText = this.view.descriptionText.text;
      this.app.imageManager.addImage(this.screenDataObject.backgroundTXD,this.screenDataObject.backgroundImage,this.view.backgroundImage);
      this._carousel.SHOW_CURRENT_ITEM();
   }
   function setupTabs()
   {
      if(this.app.isPC)
      {
         this.view.L1._visible = false;
         this.view.R1._visible = false;
         this.view.tab_0._x = this.view.L1._x;
         this.view.tab_1._x = this.view.tab_0._x + this.view.tab_0._width;
      }
   }
   function resizeTabs()
   {
      var _loc6_ = 117;
      var _loc5_ = 8;
      var _loc4_ = Math.max(this.view.tab_0.textField._width,this.view.tab_1.textField._width);
      var _loc3_ = _loc4_ + _loc5_ + _loc5_;
      var _loc2_;
      if(_loc3_ > _loc6_)
      {
         this.view.tab_0.textField.autoSize = "none";
         this.view.tab_0.textField._width = _loc4_;
         _loc2_ = this.view.tab_0.textField.getTextFormat();
         _loc2_.align = "center";
         this.view.tab_0.textField.setTextFormat(_loc2_);
         this.view.tab_1.textField.autoSize = "none";
         this.view.tab_1.textField._width = _loc4_;
         _loc2_ = this.view.tab_1.textField.getTextFormat();
         _loc2_.align = "center";
         this.view.tab_1.textField.setTextFormat(_loc2_);
         this.view.tab_0.background._width = _loc3_;
         this.view.tab_1.background._width = _loc3_;
         this.view.tab_1._x = this.view.tab_0._x + _loc3_;
         this.view.R1._x = this.view.tab_1._x + this.view.tab_1._width + 8;
      }
   }
   function setupButtons()
   {
      this.view.tab_0.textField.autoSize = "left";
      this.view.tab_1.textField.autoSize = "left";
      var _loc2_ = this.view.tab_0.textField.getNewTextFormat();
      _loc2_.letterSpacing = 0.15;
      this.view.tab_0.textField.setNewTextFormat(_loc2_);
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.setLocalisedText(this.view.tab_0.textField,"PHUB_PROGRESS");
      this.view.tab_0.textField.verticalAlign = "center";
      _loc2_ = this.view.tab_1.textField.getNewTextFormat();
      _loc2_.letterSpacing = 0.15;
      this.view.tab_1.textField.setNewTextFormat(_loc2_);
      com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.setLocalisedText(this.view.tab_1.textField,"PHUB_REWARDS");
      this.view.tab_1.textField.verticalAlign = "center";
      if(this.app.displayConfig.isAsian)
      {
         com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.resizeAsianText(this.view.tab_0.textField);
         com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.resizeAsianText(this.view.tab_1.textField);
      }
      this.view.tab_1.textField.textColor = 16777215;
      this.view.tab_1.background.gotoAndStop(2);
      this.resizeTabs();
      this.setupTabs(this.view.tab_0,this.view.tab_1,this.view.R1);
      this.buttons = [];
      this.buttons.push(new com.rockstargames.gtav.FrontendGen9.progressHub.ui.Button(com.rockstargames.gtav.FrontendGen9.progressHub.ui.ButtonIDs.REWARDS_TAB,this.view.tab_1));
      this.cursor.addTarget(this.buttons[0]);
   }
   function onTargetChange(target)
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.buttons.length)
      {
         _loc2_ = this.buttons[_loc3_];
         if(_loc2_ == target && _loc2_.id < this.carouselButtons.length)
         {
            this.updateScreen(_loc2_.id);
            this._carousel.SET_CAROUSEL_ITEM_STATE(_loc2_.id,1);
         }
         else if(_loc2_.id == com.rockstargames.gtav.FrontendGen9.progressHub.ui.ButtonIDs.REWARDS_TAB)
         {
            _loc2_.setState(_loc2_ == target);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
}
