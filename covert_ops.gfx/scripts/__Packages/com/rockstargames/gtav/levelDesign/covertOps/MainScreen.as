class com.rockstargames.gtav.levelDesign.covertOps.MainScreen extends com.rockstargames.gtav.levelDesign.covertOps.Screen
{
   var scrollTimeDelta;
   var cursor;
   var view;
   var overlay;
   var app;
   var activeScrollKey;
   var currTargetID;
   static var OVERLAY_ACCEPT = 101;
   static var OVERLAY_CANCEL = 102;
   static var SCROLL_SPEED = 20;
   function MainScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,cursor,"mainScreen");
      this.init();
   }
   function init()
   {
      this.scrollTimeDelta = 0;
      this.initOverlay();
      this.initTitle();
      this.initList();
      this.initBackgroundAnimations();
      this.updateButtons();
      this.cursor.setChangeListener(this.delegate(this,this.onTargetChange));
      this.onTargetChange(this.cursor.getTargetIDUnderCursor());
      this.view._visible = true;
   }
   function initOverlay()
   {
      this.overlay = new com.rockstargames.gtav.levelDesign.covertOps.Overlay(this.view.overlay,com.rockstargames.gtav.levelDesign.covertOps.MainScreen.OVERLAY_ACCEPT,com.rockstargames.gtav.levelDesign.covertOps.MainScreen.OVERLAY_CANCEL,this.app.displayConfig.isAsian);
      this.overlay.hide();
   }
   function initTitle()
   {
      this.view.title.autoSize = "left";
      this.view.title.text = com.rockstargames.gtav.levelDesign.COVERT_OPS.setLocalisedText(this.view.title,"COVOPS_TITLE").toUpperCase();
      this.view.titleBG._width = 2 * (this.view.title._x - this.view.titleBG._x) + this.view.title.textWidth;
   }
   function initList()
   {
      var _loc5_ = this.view.createEmptyMovieClip("list",this.view.getNextHighestDepth());
      _loc5_._x = this.view.listMask._x;
      _loc5_._y = this.view.listMask._y;
      _loc5_.setMask(this.view.listMask);
      this.view.overlay.swapDepths(_loc5_);
      var _loc6_ = 3;
      var _loc7_ = 285;
      var _loc8_ = 248;
      var _loc2_ = 0;
      while(_loc2_ < this.app.missions.length)
      {
         var _loc4_ = this.app.missions[_loc2_];
         var _loc3_ = _loc5_.attachMovie("mission","mission" + _loc4_.id,_loc5_.getNextHighestDepth());
         _loc3_._x = _loc2_ % _loc6_ * _loc7_;
         _loc3_._y = Math.floor(_loc2_ / _loc6_) * _loc8_;
         this.initListItem(_loc3_,_loc4_);
         _loc2_ = _loc2_ + 1;
      }
      if(this.view.listMask._height > _loc5_._height)
      {
         this.view.listMask._height = _loc5_._height;
         var _loc9_ = _loc5_._y + _loc5_._height + 16;
         this.view.panelBG._height = _loc9_ - this.view.panelBG._y;
      }
   }
   function initListItem(view, mission)
   {
      view.title.text = mission.missionName;
      view.description.label.text = mission.description;
      view.description._visible = false;
      if(mission.lockNum == 0)
      {
         view.lockNum.text = "";
         view.padlock._visible = false;
      }
      else if(mission.lockNum > 0)
      {
         view.lockNum.text = mission.lockNum.toString();
         view.padlock._visible = true;
      }
      else
      {
         view.lockNum.text = "";
         view.padlock._visible = true;
      }
      if(mission.cashBonus > 0)
      {
         view.cashIcon.multiplier.text = view.cashIcon.shadow.text = mission.cashBonus + "x";
         com.rockstargames.ui.utils.Colour.ApplyHudColour(view.cashIcon.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_GREEN);
      }
      else
      {
         view.cashIcon._visible = false;
      }
      if(mission.rpBonus > 0)
      {
         view.rpIcon.multiplier.text = view.rpIcon.shadow.text = mission.rpBonus + "x";
         com.rockstargames.ui.utils.Colour.ApplyHudColour(view.rpIcon.bg,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_FREEMODE);
         if(!view.cashIcon._visible)
         {
            view.rpIcon._y = view.cashIcon._y;
         }
      }
      else
      {
         view.rpIcon._visible = false;
      }
      this.app.imageManager.addImage(mission.txd,mission.txd,view.image);
      view.launchButton.gotoAndStop(!mission.enabled ? "disabled" : "enabled");
      com.rockstargames.gtav.levelDesign.COVERT_OPS.setSpacedTextField(view.launchButton.label,com.rockstargames.gtav.levelDesign.COVERT_OPS.setLocalisedText(view.launchButton.label,"COVOPS_LAUNCH_MISSION").toUpperCase(),true);
      mission.view = view;
      mission.button = new com.rockstargames.gtav.levelDesign.covertOps.Button(mission.id,view);
   }
   function initBackgroundAnimations()
   {
      var _loc5_ = 0;
      while(_loc5_ < 18)
      {
         var _loc4_ = this.view.barGraph["bar" + _loc5_];
         var _loc7_ = this.view.barGraph["bg" + _loc5_];
         _loc4_._yscale = Math.random() * 100;
         _loc7_._yscale = Math.random() * 100;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(_loc4_,Math.random() * 4,{onCompleteScope:this,onComplete:this.barGraphAnimateA,onCompleteArgs:[_loc4_,_loc7_]});
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      while(_loc5_ < 9)
      {
         var _loc2_ = this.view["horz" + _loc5_];
         var _loc3_ = Math.random() * 100;
         var _loc6_ = Math.random() * 0.9 * _loc3_;
         _loc2_.orange._xscale = _loc3_;
         _loc2_.blue._xscale = _loc6_;
         _loc2_.orangeArrow._x = _loc2_.bg._width * _loc3_ * 0.01;
         _loc2_.blueArrow._x = _loc2_.bg._width * _loc6_ * 0.01;
         this.horzAnimate(_loc2_);
         _loc5_ = _loc5_ + 1;
      }
      _loc5_ = 0;
      while(_loc5_ < 6)
      {
         var _loc8_ = this.view["circle" + _loc5_];
         this.circleAnimate(_loc8_);
         _loc5_ = _loc5_ + 1;
      }
   }
   function barGraphAnimateA(bar, bg)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(bg,Math.random() * 1.5 + 0.5,{_yScale:Math.random() * 100,onCompleteScope:this,onComplete:this.barGraphAnimateB,onCompleteArgs:arguments});
   }
   function barGraphAnimateB(bar, bg)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(bar,Math.random() * 4,{onCompleteScope:this,onComplete:this.barGraphAnimateC,onCompleteArgs:arguments});
   }
   function barGraphAnimateC(bar, bg)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(bar,Math.random() * 1.5 + 0.5,{_yScale:bg._yscale,onCompleteScope:this,onComplete:this.barGraphAnimateD,onCompleteArgs:arguments});
   }
   function barGraphAnimateD(bar, bg)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(bar,Math.random() * 4,{onCompleteScope:this,onComplete:this.barGraphAnimateA,onCompleteArgs:arguments});
   }
   function horzAnimate(horz)
   {
      var _loc5_ = Math.random() * 100;
      var _loc6_ = Math.random() * 0.9 * _loc5_;
      var _loc3_ = Math.random() * 6 + 3;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(horz.orange,_loc3_,{_xScale:_loc5_,onCompleteScope:this,onComplete:this.horzAnimate,onCompleteArgs:arguments});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(horz.blue,_loc3_,{_xScale:_loc6_});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(horz.orangeArrow,_loc3_,{_x:horz.bg._width * _loc5_ * 0.01});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(horz.blueArrow,_loc3_,{_x:horz.bg._width * _loc6_ * 0.01});
   }
   function circleAnimate(circle)
   {
      var _loc4_ = Math.random() * 360 - 180;
      var _loc3_ = Math.random() * 5 + 1;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(circle,_loc3_,{_rotation:_loc4_,onCompleteScope:this,onComplete:this.circleAnimate,onCompleteArgs:arguments,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_INOUT});
   }
   function get isReady()
   {
      return true;
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.COVERT_OPS.KEY_UP:
            this.activeScrollKey = com.rockstargames.gtav.levelDesign.COVERT_OPS.KEY_UP;
            this.scrollListFromKeyboard(-1);
            break;
         case com.rockstargames.gtav.levelDesign.COVERT_OPS.KEY_DOWN:
            this.activeScrollKey = com.rockstargames.gtav.levelDesign.COVERT_OPS.KEY_DOWN;
            this.scrollListFromKeyboard(1);
      }
   }
   function onTargetChange(targetID)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.app.missions.length)
      {
         this.app.missions[_loc2_].view.description._visible = this.app.missions[_loc2_].id == targetID;
         if(this.app.missions[_loc2_].id == targetID && this.currTargetID != targetID)
         {
            com.rockstargames.gtav.levelDesign.COVERT_OPS.playSound("Mouse_Over_Mission");
         }
         _loc2_ = _loc2_ + 1;
      }
      this.currTargetID = targetID;
   }
   function showOverlay(titleLabel, messageLabel, acceptButtonLabel, cancelButtonLabel, success)
   {
      this.overlay.show(titleLabel,messageLabel,acceptButtonLabel,cancelButtonLabel,success);
      this.cursor.setTargetRects(this.overlay.controls);
   }
   function hideOverlay()
   {
      this.overlay.hide();
      this.updateButtons();
   }
   function dispose()
   {
      this.cursor.setChangeListener(null);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.scrollbar);
      var _loc4_ = 0;
      while(_loc4_ < 18)
      {
         var _loc5_ = this.view.barGraph["bar" + _loc4_];
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc5_);
         var _loc7_ = this.view.barGraph["bg" + _loc4_];
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc7_);
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < 9)
      {
         var _loc3_ = this.view["horz" + _loc4_];
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.orange);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.blue);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.orangeArrow);
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc3_.blueArrow);
         _loc4_ = _loc4_ + 1;
      }
      _loc4_ = 0;
      while(_loc4_ < 6)
      {
         var _loc6_ = this.view["circle" + _loc4_];
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(_loc6_);
         _loc4_ = _loc4_ + 1;
      }
      super.dispose();
   }
   function handleJoystickInput(isLeftStick, x, y, isMouseWheel, isSlowingDown)
   {
      var _loc4_ = (y - 128) / 128;
      if(isMouseWheel)
      {
         _loc4_ *= 2;
      }
      if(!isLeftStick)
      {
         var _loc5_ = getTimer();
         var _loc3_ = _loc5_ - this.scrollTimeDelta;
         _loc3_ = Math.max(16,Math.min(40,_loc3_));
         var _loc6_ = com.rockstargames.gtav.levelDesign.covertOps.MainScreen.SCROLL_SPEED * _loc3_ / 32;
         this.scrollTimeDelta = _loc5_;
         this.scrollList((- _loc6_) * _loc4_);
         if(isMouseWheel)
         {
            if(y != 127)
            {
               y += 0.17 * (127 - y);
               if(Math.abs(y - 127) < 1)
               {
                  y = 127;
               }
               this.view.onEnterFrame = this.delegate(this,this.handleJoystickInput,isLeftStick,x,y,true);
            }
            else if(isSlowingDown)
            {
               delete this.view.onEnterFrame;
            }
         }
         else
         {
            delete this.view.onEnterFrame;
         }
      }
   }
   function handleButtonInputRelease(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.COVERT_OPS.KEY_UP:
         case com.rockstargames.gtav.levelDesign.COVERT_OPS.KEY_DOWN:
            if(inputID == this.activeScrollKey)
            {
               delete this.view.onEnterFrame;
            }
      }
   }
   function scrollListFromKeyboard(direction)
   {
      var _loc3_ = getTimer();
      var _loc2_ = _loc3_ - this.scrollTimeDelta;
      _loc2_ = Math.max(16,Math.min(40,_loc2_));
      var _loc4_ = com.rockstargames.gtav.levelDesign.covertOps.MainScreen.SCROLL_SPEED * _loc2_ / 32;
      this.scrollTimeDelta = _loc3_;
      this.scrollList((- _loc4_) * direction);
      this.view.onEnterFrame = this.delegate(this,this.scrollListFromKeyboard,direction);
   }
   function scrollList(dy)
   {
      var _loc2_ = this.view.listMask._y;
      var _loc3_ = this.view.listMask._y + this.view.listMask._height - this.view.list._height;
      var _loc4_ = this.view.list._y + dy;
      if(this.view.list._height > this.view.listMask._height)
      {
         this.view.list._y = Math.max(Math.min(_loc2_,_loc4_),_loc3_);
      }
      this.updateButtons();
      this.updateScrollbar();
   }
   function resetScroll()
   {
      this.view.list._y = this.view.listMask._y;
      this.updateScrollbar();
   }
   function updateScrollbar()
   {
      var _loc2_ = this.view.listMask._y;
      var _loc3_ = this.view.listMask._y + this.view.listMask._height;
      var _loc4_ = this.view.listMask._y + this.view.listMask._height - this.view.list._height;
      var _loc7_ = this.view.listMask._y;
      var _loc6_ = (this.view.list._y - _loc4_) / (_loc7_ - _loc4_);
      var _loc8_ = Math.min(_loc2_ + this.view.listMask._height,this.view.list._y + this.view.list._height);
      var _loc9_ = Math.min(1,(_loc8_ - _loc2_) / this.view.list._height);
      this.view.scrollbar._height = _loc9_ * (_loc3_ - _loc2_);
      var _loc5_ = _loc3_ - this.view.scrollbar._height;
      this.view.scrollbar._y = (1 - _loc6_) * (_loc5_ - _loc2_) + _loc2_;
      this.view.scrollbar._alpha = 100;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.scrollbar,0.75,{_alpha:0,delay:0.25});
   }
   function updateButtons()
   {
      if(this.overlay.isShowing)
      {
         return undefined;
      }
      var _loc5_ = [];
      var _loc4_ = 0;
      while(_loc4_ < this.app.missions.length)
      {
         var _loc2_ = this.app.missions[_loc4_].view;
         var _loc3_ = this.app.missions[_loc4_].button;
         _loc3_.top = Math.max(this.view.listMask._y,_loc2_._y + _loc2_._parent._y);
         _loc3_.bottom = Math.min(this.view.listMask._y + this.view.listMask._height,_loc2_._y + _loc2_._height + _loc2_._parent._y);
         if(_loc3_.bottom - _loc3_.top > 0)
         {
            _loc5_.push(_loc3_);
         }
         _loc4_ = _loc4_ + 1;
      }
      this.cursor.setTargetRects(_loc5_);
   }
   function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
