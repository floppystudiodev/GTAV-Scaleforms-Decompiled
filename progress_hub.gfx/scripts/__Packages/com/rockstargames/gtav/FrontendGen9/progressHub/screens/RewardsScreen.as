class com.rockstargames.gtav.FrontendGen9.progressHub.screens.RewardsScreen extends com.rockstargames.gtav.FrontendGen9.progressHub.screens.Screen
{
   var _carousel;
   var _sticker;
   var app;
   var buttons;
   var carouselButtons;
   var cursor;
   var dataObject;
   var screenDataArray;
   var screenDataObject;
   var showTabs;
   var view;
   var tagArray = new Array();
   var numIcons = 4;
   var padding = 5;
   var lastTagArrayLength = 0;
   function RewardsScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"RewardsScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.setupTabs();
      this.showTabs = this.dataObject.showTabs;
      this.buttons = [];
      if(this.showTabs)
      {
         this.setupButtons();
         this.view.L1._visible = !this.app.isPC;
         this.view.R1._visible = !this.app.isPC;
      }
      else
      {
         this.view.tab_1._visible = false;
         this.view.tab_0._visible = false;
         this.view.L1._visible = false;
         this.view.R1._visible = false;
      }
      this.setUpText(this.view.screenTitle,this.dataObject.screenTitle,false,"center");
      this.setUpLabel(this.view.stats.statLabel0,"PHUB_SPEED",false,"center");
      this.setUpLabel(this.view.stats.statLabel1,"PHUB_ACCELERATION",false,"center");
      this.setUpLabel(this.view.stats.statLabel2,"PHUB_BRAKING",false,"center");
      this.setUpLabel(this.view.stats.statLabel3,"PHUB_TRACTION",false,"center");
      this.view.stats._visible = false;
      this._sticker = com.rockstargames.gtav.FrontendGen9.progressHub.ui.Sticker(this.view.attachMovie("sticker","sticker",this.view.getNextHighestDepth(),{_x:60,_y:130}));
      this.setupCarousel();
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
      this.view.tab_0.textField.textColor = 16777215;
      this.view.tab_0.background.gotoAndStop(2);
      this.resizeTabs();
      this.setupTabs(this.view.tab_0,this.view.tab_1,this.view.R1);
      this.buttons = [];
      this.buttons.push(new com.rockstargames.gtav.FrontendGen9.progressHub.ui.Button(com.rockstargames.gtav.FrontendGen9.progressHub.ui.ButtonIDs.PROGRESS_TAB,this.view.tab_0));
      this.cursor.addTarget(this.buttons[0]);
   }
   function updateScreen(index)
   {
      this.screenDataObject = this.screenDataArray[index];
      this.setUpText(this.view.titleText,this.screenDataObject.title,true,"center");
      this.setUpText(this.view.descriptionText,this.screenDataObject.description,false,"top",0.15);
      this.view.descriptionText._height = 195;
      this.view.descriptionText.html = true;
      this.view.descriptionText.htmlText = this.view.descriptionText.text;
      this.setUpText(this.view.messageText,this.screenDataObject.message,false,"center",-0.3);
      if(this.tagArray[index].length == 0)
      {
         this.view.descriptionText._y = this.view.tags._y;
      }
      else
      {
         this.view.descriptionText._y = 230;
      }
      if(this.screenDataObject.status == 3)
      {
         this._sticker.setStatus(5);
      }
      else
      {
         this._sticker.setStatus(this.screenDataObject.status);
      }
      this.app.imageManager.addImage(this.screenDataObject.backgroundTXD,this.screenDataObject.backgroundImage,this.view.backgroundImage);
      var _loc9_ = [];
      var _loc7_ = [];
      if(this.screenDataObject.speed != -1)
      {
         _loc9_.push(this.screenDataObject.speed);
         _loc7_.push(this.screenDataObject.statLabel1);
      }
      if(this.screenDataObject.acceleration != -1)
      {
         _loc9_.push(this.screenDataObject.acceleration);
         _loc7_.push(this.screenDataObject.statLabel2);
      }
      if(this.screenDataObject.braking != -1)
      {
         _loc9_.push(this.screenDataObject.braking);
         _loc7_.push(this.screenDataObject.statLabel3);
      }
      if(this.screenDataObject.traction != -1)
      {
         _loc9_.push(this.screenDataObject.traction);
         _loc7_.push(this.screenDataObject.statLabel4);
      }
      var _loc3_;
      var _loc5_;
      var _loc6_;
      if(_loc9_.length > 0)
      {
         this.view.stats._visible = true;
         _loc3_ = 0;
         while(_loc3_ < 4)
         {
            _loc5_ = this.view.stats["stat" + _loc3_];
            _loc6_ = this.view.stats["statLabel" + _loc3_];
            if(_loc3_ < _loc9_.length)
            {
               this.setStatLine(_loc5_,_loc9_[_loc3_]);
               if(_loc7_[_loc3_] != undefined && _loc7_[_loc3_].length > 0)
               {
                  com.rockstargames.gtav.FrontendGen9.PROGRESS_HUB.truncate(_loc6_,_loc7_[_loc3_],"left",1);
               }
               _loc5_._visible = true;
               _loc6_._visible = true;
            }
            else
            {
               _loc5_._visible = false;
               _loc6_._visible = false;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
      else
      {
         this.view.stats._visible = false;
      }
      var _loc2_;
      var _loc15_;
      var _loc4_;
      var _loc10_;
      var _loc12_ = 9;
      var _loc8_;
      _loc2_ = 0;
      while(_loc2_ < this.lastTagArrayLength)
      {
         this.view.tags["tag_" + _loc2_].removeMovieClip();
         _loc2_ = _loc2_ + 1;
      }
      _loc15_ = this.tagArray[index].length;
      _loc2_ = 0;
      while(_loc2_ < _loc15_)
      {
         this.view.tags.attachMovie("tag","tag_" + _loc2_,this.view.tags.getNextHighestDepth(),{_x:0,_y:0});
         _loc4_ = this.view.tags["tag_" + _loc2_];
         _loc4_.textField.verticalAlign = "center";
         _loc4_.textField.text = this.tagArray[index][_loc2_].tagText;
         _loc4_.textField.autosize = "left";
         _loc4_.textField._width = _loc4_.textField.textWidth + _loc12_;
         _loc8_ = this.tagArray[index][_loc2_].icon;
         if(_loc8_ <= this.numIcons)
         {
            _loc4_.tagIcon.gotoAndStop(_loc8_);
         }
         if(_loc2_ > 0)
         {
            _loc10_ = this.view.tags["tag_" + (_loc2_ - 1)];
            _loc4_._x = _loc10_._x + _loc10_._width + _loc12_;
         }
         else
         {
            _loc4_._x = 0;
         }
         _loc2_ = _loc2_ + 1;
      }
      this.lastTagArrayLength = _loc15_;
      this._carousel.SHOW_CURRENT_ITEM();
   }
   function addTag(newDataObject)
   {
      var _loc2_ = newDataObject.index;
      if(_loc2_ < this.tagArray.length)
      {
         this.tagArray[_loc2_].push(newDataObject);
      }
   }
   function cleartag(index)
   {
      this.tagArray[index] = [];
   }
   function setStatLine(bar, value)
   {
      value *= 500;
      bar.bar4._xscale = Math.min(100,Math.max(0,value - 400));
      bar.bar3._xscale = Math.min(100,Math.max(0,value - 300));
      bar.bar2._xscale = Math.min(100,Math.max(0,value - 200));
      bar.bar1._xscale = Math.min(100,Math.max(0,value - 100));
      bar.bar0._xscale = Math.min(100,Math.max(0,value));
   }
   function ADD_CAROUSEL_ITEM(itemDataObject)
   {
      this.tagArray.push(new Array());
      super.ADD_CAROUSEL_ITEM(itemDataObject);
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
         else if(_loc2_.id == com.rockstargames.gtav.FrontendGen9.progressHub.ui.ButtonIDs.PROGRESS_TAB)
         {
            _loc2_.setState(_loc2_ == target);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.tagArray.length)
      {
         this.tagArray[_loc3_] = [];
         _loc3_ = _loc3_ + 1;
      }
      this.tagArray = [];
      super.dispose();
   }
}
