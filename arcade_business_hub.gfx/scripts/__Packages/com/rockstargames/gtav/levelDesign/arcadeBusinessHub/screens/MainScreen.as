class com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen extends com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.Screen
{
   var app;
   var scroller;
   var view;
   var _buttons;
   var overlay;
   var cursor;
   static var NUM_BUSINESSES = 10;
   static var NIGHTCLUB_ID = 1;
   static var TXD = "ARCADE_BIZ";
   function MainScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"mainScreen");
      this.init();
   }
   function init()
   {
      super.init();
      this.initHeader();
      var _loc3_ = 0;
      while(_loc3_ < com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen.NUM_BUSINESSES)
      {
         this.initBusiness(this.app.businesses[_loc3_],_loc3_);
         _loc3_ = _loc3_ + 1;
      }
      this.scroller = new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Scroller(this.view.scrollContent,this.view.scrollContentMask,this.view.scrollbar.handle,this.view.scrollbar.track,this.delegate(this,this.updateButtons));
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(this.view.scrollContent.footer,"ABH_FOOTER",2.8,true,false);
   }
   function initHeader()
   {
      var _loc2_ = this.view.scrollContent.header;
      _loc2_.heading.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.heading,"ABH_TITLE",6,true,false);
      var _loc3_ = _loc2_.heading.text.split(" ");
      if(_loc3_.length == 3)
      {
         var _loc5_ = _loc3_[0] + " <font color=\'#3C986C\'>" + _loc3_[1] + " </font>" + _loc3_[2];
         com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.heading,_loc5_,6,true,true);
      }
      var _loc4_ = 0.5 * (_loc2_.rightFill._x - _loc2_.heading.textWidth - 20);
      _loc2_.leftFill._width = _loc4_;
      _loc2_.rightFill._width = _loc4_;
      _loc2_.subheading.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.subheading,"ABH_SUBTITLE",3,true,false);
      _loc2_.loggedIn.autoSize = "left";
      _loc2_.loggedIn.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.loggedIn,"ABH_LOGGED",2,true,false);
      _loc2_.loggedIn._x = _loc2_.mugshot._x - _loc2_.loggedIn._width - 6;
      _loc2_.suppliesDivider._x = _loc2_.loggedIn._x - _loc2_.suppliesDivider._width - 6;
      _loc2_.supplies.autoSize = "left";
      _loc2_.supplies.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.supplies,"ABH_SUPPLY",2,true,false);
      _loc2_.supplies._x = _loc2_.suppliesDivider._x - _loc2_.supplies._width - 6;
      _loc2_.suppliesIcon._x = _loc2_.supplies._x - _loc2_.suppliesIcon._width - 1;
      _loc2_.stockDivider._x = _loc2_.suppliesIcon._x - _loc2_.stockDivider._width - 6;
      _loc2_.stock.autoSize = "left";
      _loc2_.stock.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.stock,"ABH_STOCK",2,true,false);
      _loc2_.stock._x = _loc2_.stockDivider._x - _loc2_.stock._width - 6;
      _loc2_.stockIcon._x = _loc2_.stock._x - _loc2_.stockIcon._width - 1;
      this.app.imageManager.addImage(this.app.mugshot,this.app.mugshot,_loc2_.mugshot);
   }
   function initBusiness(business, index)
   {
      var _loc2_ = this.view.scrollContent["business" + index];
      if(business == undefined)
      {
         _loc2_._visible = false;
         return undefined;
      }
      _loc2_.popularityMeter._visible = business.id == com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen.NIGHTCLUB_ID;
      if(business.id == com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen.NIGHTCLUB_ID)
      {
         _loc2_.gotoAndStop("oneMeter");
         _loc2_.padlock.gotoAndStop("oneMeter");
         com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setLocalisedText(_loc2_.popularityMeter.label,"ABH_POPULARITY");
      }
      else if(business.normStatLevel1 == -1 && business.normStatLevel2 == -1)
      {
         _loc2_.gotoAndStop("zeroMeter");
         _loc2_.padlock.gotoAndStop("zeroMeter");
      }
      else if(business.normStatLevel1 != -1 && business.normStatLevel2 == -1)
      {
         _loc2_.gotoAndStop("oneMeter");
         _loc2_.padlock.gotoAndStop("oneMeter");
      }
      else if(business.normStatLevel1 == -1 && business.normStatLevel2 != -1)
      {
         _loc2_.gotoAndStop("oneMeterAlt");
         _loc2_.padlock.gotoAndStop("oneMeter");
      }
      _loc2_.title.autoSize = "left";
      _loc2_.title.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.title,business.title,2.8,true,true);
      _loc2_.title._x = 0.5 * (_loc2_._width - _loc2_.title._width);
      _loc2_.leftHeadingDots._x = _loc2_.title._x - _loc2_.leftHeadingDots._width - 6;
      _loc2_.rightHeadingDots._x = _loc2_.title._x + _loc2_.title._width + 6;
      _loc2_.resupply.label.verticalAlign = "center";
      if(business.canResupply)
      {
         this._buttons.push(new com.rockstargames.gtav.levelDesign.arcadeBusinessHub.Button(business.id,_loc2_.resupply));
         com.rockstargames.gtav.levelDesign.ARCADE_BUSINESS_HUB.setSpacedTextField(_loc2_.resupply.label,business.statLabel1,2.8,true,true);
      }
      else
      {
         _loc2_.resupply._visible = false;
      }
      this.app.imageManager.addImage(com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen.TXD,business.texture,_loc2_.image);
      this.updateBusiness(business,index);
      if(this.app.displayConfig.isAsian)
      {
         _loc2_.title.autoSize = "none";
         _loc2_.title._height = 50;
         _loc2_.title.verticalAlign = "top";
         _loc2_.resupply.label.autoSize = "none";
         _loc2_.resupply.label._y = 3;
         _loc2_.resupply.label._height = 50;
         _loc2_.resupply.label.verticalAlign = "top";
      }
   }
   function updateBusiness(business, index)
   {
      var _loc2_ = this.view.scrollContent["business" + index];
      if(business.id == com.rockstargames.gtav.levelDesign.arcadeBusinessHub.screens.MainScreen.NIGHTCLUB_ID)
      {
         this.setMeter(_loc2_.stockLevelMeter1,business.normStatLevel2);
      }
      else
      {
         this.setMeter(_loc2_.stockLevelMeter1,business.normStatLevel1);
      }
      this.setMeter(_loc2_.stockLevelMeter2,business.normStatLevel2);
      this.setMeter(_loc2_.popularityMeter,business.normStatLevel1);
      _loc2_.resupply._visible = business.canResupply;
      if(!business.isLocked)
      {
         _loc2_.padlock._visible = false;
      }
   }
   function setMeter(meterView, normStatLevel)
   {
      if(normStatLevel >= 0)
      {
         normStatLevel = Math.min(1,Math.max(0,normStatLevel));
         meterView.bar._x = (- (1 - normStatLevel)) * meterView.bar._width;
      }
      else
      {
         meterView._visible = false;
      }
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel)
   {
      if(!isLeftStick && !this.overlay.isShowing)
      {
         this.scroller.scrollBy(y,isMouseWheel);
         this.updateButtons();
      }
   }
   function updateButtons()
   {
      if(!this.overlay.isShowing)
      {
         var _loc2_ = 0;
         var _loc4_ = this._buttons.length;
         while(_loc2_ < _loc4_)
         {
            var _loc3_ = this._buttons[_loc2_];
            _loc3_.updateBounds();
            _loc2_ = _loc2_ + 1;
         }
         this.cursor.setTargetRects(this._buttons);
      }
   }
   function dispose()
   {
      super.dispose();
      this.scroller.dispose();
      this.scroller = null;
   }
}
