class com.rockstargames.gtav.web.Dynasty8realestateMap extends MovieClip
{
   var browser;
   var map;
   var mapContainer;
   var mapx;
   var mapy;
   var pinContainer;
   var pinData;
   var website;
   var xRatio;
   var yRatio;
   static var DEG_2_RAD = 0.017453292519943295;
   var lastPin = -1;
   var zoomScale = 50;
   var maxZoomFactor = 250;
   function Dynasty8realestateMap()
   {
      super();
      this.map = this;
      this.mapContainer = this.map._parent;
      this.browser = _level0.TIMELINE;
      this.xRatio = 500 / this.map.mapCenter._width;
      this.yRatio = 500 / this.map.mapCenter._height;
   }
   function getNewDepth(yPos, index)
   {
      var _loc2_ = Math.ceil(yPos * 2 + 6000 - index);
      return this.pinContainer.getDepth() + _loc2_;
   }
   function generatePinData()
   {
      this.pinData = new Array();
      var _loc6_ = 2000;
      var _loc7_ = 0;
      var _loc4_;
      var _loc10_;
      var _loc3_ = 0;
      var _loc11_;
      var _loc8_;
      var _loc2_;
      var _loc5_;
      var _loc9_;
      while(_loc3_ < this.website.propertyArray.length)
      {
         _loc11_ = this.website.propertyArray[_loc3_].XPOS / this.xRatio;
         _loc8_ = - this.website.propertyArray[_loc3_].YPOS / this.yRatio;
         _loc10_ = "button_pin_property";
         if(this.website.propertyArray[_loc3_].SIZE >= 1 && this.website.propertyArray[_loc3_].SIZE <= 3)
         {
            _loc10_ = "button_pin_garage";
         }
         _loc6_ = this.getNewDepth(_loc8_,_loc3_);
         _loc4_ = new Array();
         _loc7_ = 0;
         _loc2_ = 0;
         while(_loc2_ < this.website.propertyArray.length)
         {
            if(this.website.propertyArray[_loc3_].XPOS == this.website.propertyArray[_loc2_].XPOS && this.website.propertyArray[_loc3_].YPOS == this.website.propertyArray[_loc2_].YPOS)
            {
               _loc4_.push(_loc2_);
            }
            if(_loc6_ == this.pinData[_loc2_][3])
            {
               _loc6_ -= 2;
            }
            _loc2_ = _loc2_ + 1;
         }
         if(_loc4_.length == 0)
         {
            _loc4_.push(-1);
         }
         else
         {
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(_loc4_[_loc5_] == _loc3_)
               {
                  _loc7_ = _loc5_;
               }
               _loc5_ = _loc5_ + 1;
            }
         }
         if(_loc4_.length <= 6)
         {
            _loc9_ = 60;
         }
         else
         {
            _loc9_ = 360 / _loc4_.length;
         }
         this.pinData.push(new Array(_loc10_,_loc11_,_loc8_,_loc6_,_loc7_,_loc4_,_loc9_));
         _loc6_ = _loc6_ - 1;
         _loc3_ = _loc3_ + 1;
      }
   }
   function initialiseMap(_website)
   {
      this.website = _website;
      if(this.map.pinContainer != undefined)
      {
         this.pinContainer.removeMovieClip();
      }
      this.pinContainer = this.map.createEmptyMovieClip("pinContainer",this.map.getNextHighestDepth());
      this.pinContainer._x = this.map.mapCenter._x;
      this.pinContainer._y = this.map.mapCenter._y;
      this.generatePinData();
      var _loc2_ = 0;
      var _loc3_;
      var _loc8_;
      var _loc4_;
      var _loc7_;
      var _loc6_;
      var _loc5_;
      while(_loc2_ < this.website.propertyArray.length)
      {
         _loc3_ = "pin_" + _loc2_;
         _loc4_ = this.pinData[_loc2_][0];
         _loc7_ = this.pinData[_loc2_][1];
         _loc6_ = this.pinData[_loc2_][2];
         _loc5_ = this.pinData[_loc2_][3];
         _loc8_ = this.pinContainer.attachMovie(_loc4_,_loc3_,_loc5_,{_x:_loc7_,_y:_loc6_});
         _loc8_.starterPackIcon._visible = this.website.propertyArray[_loc2_].STARTER_PACK;
         _loc2_ = _loc2_ + 1;
      }
      this.disableHiddenButtons();
   }
   function move(_dir)
   {
      switch(_dir)
      {
         case "up":
            if(this.map.mapTop.hitTest(this.mapContainer.mapMask) == false)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.map,0.25,{_y:this.map._y + 50,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.disableHiddenButtons,onCompleteScope:this});
            }
            break;
         case "down":
            if(this.map.mapBot.hitTest(this.mapContainer.mapMask) == false)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.map,0.25,{_y:this.map._y - 50,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.disableHiddenButtons,onCompleteScope:this});
            }
            break;
         case "left":
            if(this.map.mapLeft.hitTest(this.mapContainer.mapMask) == false)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.map,0.25,{_x:this.map._x + 50,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.disableHiddenButtons,onCompleteScope:this});
            }
            break;
         case "right":
            if(this.map.mapRight.hitTest(this.mapContainer.mapMask) == false)
            {
               com.rockstargames.ui.tweenStar.TweenStarLite.to(this.map,0.25,{_x:this.map._x - 50,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.disableHiddenButtons,onCompleteScope:this});
            }
         default:
            return;
      }
   }
   function zoomInOnPin(_pin, _instant, _instantRot)
   {
      if(_instant == undefined)
      {
         _instant = false;
      }
      if(_instantRot == undefined)
      {
         _instantRot = false;
      }
      var _loc26_ = "pin_" + _pin;
      var _loc16_ = 100 * (100 / this.zoomScale) + 25;
      if(this.zoomScale == 50)
      {
         this.mapx = 0;
         this.mapy = 100;
      }
      else
      {
         this.mapx = - this.pinContainer[_loc26_]._x * (this.zoomScale / 100);
         this.mapy = - this.pinContainer[_loc26_]._y * (this.zoomScale / 100);
      }
      var _loc3_ = 0;
      var _loc15_;
      var _loc2_;
      var _loc9_;
      var _loc10_;
      var _loc17_;
      var _loc4_;
      var _loc13_;
      var _loc12_;
      var _loc5_;
      var _loc7_;
      var _loc8_;
      var _loc6_;
      var _loc14_;
      var _loc20_;
      var _loc11_;
      var _loc19_;
      var _loc18_;
      while(_loc3_ < this.website.propertyArray.length)
      {
         _loc15_ = "pin_" + _loc3_;
         _loc2_ = this.pinContainer[_loc15_];
         _loc9_ = 0;
         _loc10_ = this.pinData[_loc3_][3];
         _loc17_ = 0;
         if(_loc3_ == _pin)
         {
            _loc17_ = 100;
            _loc10_ = this.pinData[_loc3_][3] + 4000;
         }
         _loc4_ = 0;
         _loc13_ = this.pinData[_loc3_][1];
         _loc12_ = this.pinData[_loc3_][2];
         _loc2_._x = _loc13_;
         _loc2_._y = _loc12_;
         if(this.zoomScale == 250)
         {
            _loc5_ = this.pinData[_loc3_][5];
            _loc7_ = _loc5_.length;
            if(_loc5_[0] != -1 && _loc7_ > 0)
            {
               _loc8_ = 0;
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  if(this.pinContainer["pin_" + _loc5_[_loc6_]]._visible)
                  {
                     _loc8_ = _loc8_ + 1;
                  }
                  _loc6_ = _loc6_ + 1;
               }
               _loc14_ = false;
               _loc6_ = 0;
               while(_loc6_ < _loc7_)
               {
                  if(_loc5_[_loc6_] == _pin)
                  {
                     _loc14_ = true;
                     break;
                  }
                  _loc6_ = _loc6_ + 1;
               }
               if(_loc14_)
               {
                  _loc10_ = this.pinData[_loc3_][3] + 4000;
                  _loc9_ = 50;
                  _loc20_ = _loc8_ > 6 ? 360 / _loc8_ : 60;
                  _loc11_ = 0;
                  _loc6_ = 0;
                  while(_loc6_ < _loc7_)
                  {
                     if(_loc5_[_loc6_] == _loc3_)
                     {
                        _loc4_ = _loc11_ * _loc20_;
                        break;
                     }
                     if(this.pinContainer["pin_" + _loc5_[_loc6_]]._visible)
                     {
                        _loc11_ = _loc11_ + 1;
                     }
                     _loc6_ = _loc6_ + 1;
                  }
                  if(_loc8_ > 6)
                  {
                     _loc19_ = 2 * (_loc8_ - 7) + 2;
                     _loc18_ = _loc4_ * com.rockstargames.gtav.web.Dynasty8realestateMap.DEG_2_RAD;
                     _loc13_ -= _loc19_ * Math.cos(_loc18_);
                     _loc12_ -= _loc19_ * Math.sin(_loc18_);
                     _loc4_ -= 120;
                  }
               }
            }
         }
         if(_loc4_ - _loc2_._rotation > 180)
         {
            _loc4_ -= 360;
         }
         else if(_loc4_ - _loc2_._rotation < -180)
         {
            _loc4_ += 360;
         }
         if(_instant == false || _instantRot == false)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.4,{_x:_loc13_,_y:_loc12_,_rotation:_loc4_,_xscale:_loc16_ + _loc9_,_yscale:_loc16_ + _loc9_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.pinContainer[_loc15_]]});
            com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_.icon,0.4,{_rotation:- _loc4_,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf,onCompleteScope:this,onCompleteArgs:[this.pinContainer[_loc15_].icon]});
         }
         else
         {
            _loc2_._rotation = _loc4_;
            _loc2_._x = _loc13_;
            _loc2_._y = _loc12_;
            _loc2_._xscale = _loc16_ + _loc9_;
            _loc2_._yscale = _loc16_ + _loc9_;
            _loc2_.icon._rotation = - _loc4_;
         }
         if(_loc10_ != _loc2_.getDepth())
         {
            _loc2_.swapDepths(_loc10_);
         }
         _loc2_.pin_highlight._alpha = _loc17_;
         _loc3_ = _loc3_ + 1;
      }
      this.lastPin = _pin;
      if(_instant == false)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.map,0.4,{_xscale:this.zoomScale,_yscale:this.zoomScale,_x:this.mapx,_y:this.mapy + 76,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,onComplete:this.disableHiddenButtons,onCompleteScope:this});
      }
      else
      {
         this.map._xscale = this.zoomScale;
         this.map._yscale = this.zoomScale;
         this.map._x = this.mapx;
         this.map._y = this.mapy + 76;
      }
   }
   function disableHiddenButtons()
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.website.propertyArray.length)
      {
         _loc2_ = this.pinContainer["pin_" + _loc3_];
         if(_loc2_.hitTest(this.mapContainer.panHitArea) == true || _loc2_.hitTest(this.mapContainer.zoomHitArea))
         {
            _loc2_.disabled = true;
         }
         else if(_loc2_.hitTest(this.website.pinHitArea) == true)
         {
            if(_loc2_._visible == true)
            {
               _loc2_._alpha = 100;
               _loc2_.disabled = false;
            }
         }
         else
         {
            _loc2_._alpha = 0;
            _loc2_.disabled = true;
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.zoomScale == 250)
      {
         this.mapContainer.zoomIn._alpha = 50;
      }
      else
      {
         this.mapContainer.zoomIn._alpha = 100;
      }
      if(this.zoomScale == 50)
      {
         this.mapContainer.zoomOut._alpha = 50;
      }
      else
      {
         this.mapContainer.zoomOut._alpha = 100;
      }
   }
}
