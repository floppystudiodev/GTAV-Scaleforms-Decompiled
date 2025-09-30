class com.rockstargames.gtav.pc.applications.App_Popups extends com.rockstargames.gtav.pc.applications.App_Base
{
   var attachMovie;
   var getNextHighestDepth;
   var max = 12;
   var items = new Array();
   var _data = new Array();
   function App_Popups()
   {
      super();
   }
   function set data(d)
   {
      this._data = d;
   }
   function get data()
   {
      return this._data;
   }
   function ready()
   {
      this.items = [];
      var _loc9_;
      var _loc3_;
      var _loc10_;
      var _loc4_ = [];
      var _loc5_;
      var _loc6_;
      var _loc2_ = 0;
      var _loc8_;
      var _loc7_;
      while(_loc2_ < this.data.length)
      {
         _loc9_ = this.getNextHighestDepth();
         _loc3_ = com.rockstargames.gtav.pc.popups.Popup_Base(this.attachMovie("popup","popup" + _loc9_,_loc9_));
         _loc10_ = _loc2_;
         _loc4_ = [];
         if(this.data[_loc2_] != undefined)
         {
            _loc10_ = this.data[_loc2_][0];
            _loc4_ = this.data[_loc2_];
         }
         _loc3_.init(_loc10_,_loc4_);
         _loc8_ = 0;
         _loc7_ = 0;
         if(_loc4_[1] != undefined)
         {
            _loc8_ = _loc4_[1];
         }
         if(_loc4_[2] != undefined)
         {
            _loc7_ = _loc4_[2];
         }
         this.setPopupPostion(_loc3_,_loc8_,_loc7_);
         _loc5_ = new com.rockstargames.gtav.pc.PCButtonBase();
         _loc5_.init(_loc3_.closeMC,com.rockstargames.gtav.constants.PCAppLUT.PC_POPUP_CLOSE[0],{index:_loc2_,depth:(_loc2_ + 1) * 100 + 1});
         this.desktopRef.addButtons(_loc5_);
         _loc6_ = new com.rockstargames.gtav.pc.PCButtonBase();
         _loc6_.init(_loc3_.bgMC,com.rockstargames.gtav.constants.PCAppLUT.PC_WINDOW[0],{index:_loc2_,depth:(_loc2_ + 1) * 100});
         this.desktopRef.addButtons(_loc6_);
         _loc3_.closebtn = _loc5_;
         _loc3_.win = _loc6_;
         this.desktopRef.activateButtons(_loc3_.closebtn,false);
         this.desktopRef.activateButtons(_loc3_.win,false);
         this.items.push(_loc3_);
         if(this.desktopRef.autoMode)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc3_,0,{onComplete:this.openPopup,onCompleteScope:this,onCompleteArgs:[_loc2_,0]});
         }
         _loc2_ = _loc2_ + 1;
      }
      this.desktopRef.checkUnderCursor();
   }
   function setPopupPostion(mc, xPer, yPer)
   {
      var _loc3_ = this.safeLeft + xPer * (this.safeRight - this.safeLeft);
      var _loc2_ = this.safeTop + yPer * (this.safeBottom - this.safeTop);
      mc._x = _loc3_;
      mc._y = _loc2_;
   }
   function repositionPopups(_screenWidthPixels, _screenHeightPixels, _safeTopPercent, _safeBottomPercent, _safeLeftPercent, _safeRightPercent)
   {
      this.screenWidthPixels = _screenWidthPixels;
      this.screenHeightPixels = _screenHeightPixels;
      this.safeTop = _safeTopPercent;
      this.safeBottom = _safeBottomPercent;
      this.safeLeft = _safeLeftPercent;
      this.safeRight = _safeRightPercent;
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      while(_loc2_ < this.items.length)
      {
         _loc3_ = this.items[_loc2_];
         _loc5_ = this.data[_loc2_][1];
         _loc4_ = this.data[_loc2_][2];
         this.setPopupPostion(_loc3_,_loc5_,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
   }
   function openPopup(i, animspeed)
   {
      var _loc2_ = this.items[i];
      if(animspeed == undefined)
      {
         animspeed = 0.3;
      }
      _loc2_.centerMC._alpha = 0;
      _loc2_._visible = true;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.centerMC,animspeed,{_alpha:100,_xScale:100,_yScale:100,onComplete:this.openPopupComplete,onCompleteScope:this,onCompleteArgs:[i]});
      this.desktopRef.checkUnderCursor();
   }
   function openPopupComplete(i)
   {
      var _loc2_ = this.items[i];
      this.desktopRef.activateButtons(_loc2_.closebtn,true);
      this.desktopRef.activateButtons(_loc2_.win,true);
      this.desktopRef.checkUnderCursor();
   }
   function closePopup(i)
   {
      var _loc2_ = this.items[i];
      if(_loc2_ != undefined)
      {
         _loc2_._visible = false;
         this.desktopRef.activateButtons(_loc2_.closebtn,false);
         this.desktopRef.activateButtons(_loc2_.win,false);
         this.desktopRef.resetUnderCursor();
         this.desktopRef.checkUnderCursor();
      }
   }
}
