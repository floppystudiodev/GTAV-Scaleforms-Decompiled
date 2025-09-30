class com.rockstargames.gtav.minigames.golf.floatingui.GOLF_FLOATING_UI extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var _alpha;
   var _visible;
   var bgMC;
   var floatingUIMC;
   var slotContainerMC;
   var slots;
   var slotsData;
   var ARROW_OFF = 0;
   var ARROW_UP = 1;
   var ARROW_DOWN = 2;
   var slotsVisible = 0;
   var slotHeight = 17;
   function GOLF_FLOATING_UI()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.floatingUIMC = this.CONTENT.floatingUIMC;
      this.slotContainerMC = this.floatingUIMC.createEmptyMovieClip("slotContainerMC",this.floatingUIMC.getNextHighestDepth());
      this.bgMC = this.floatingUIMC.bgMC;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
      this.bgMC._height = 0;
      this.slotsData = [];
      this.slots = [];
      var _loc3_;
      var _loc4_ = 0;
      while(_loc4_ < this.slots.length)
      {
         _loc3_ = this.slots[_loc4_];
         _loc3_._visible = false;
         _loc3_._alpha = 0;
         _loc3_.valueTF.autoSize = "right";
         _loc3_.arrowMC._visible = false;
         _loc4_ = _loc4_ + 1;
      }
   }
   function SET_SWING_DISTANCE(label, value, arrow)
   {
      arguments.unshift(1);
      this.UPDATE_SLOT.apply(this,arguments);
   }
   function SET_PIN_DISTANCE(label, value, arrow)
   {
      arguments.unshift(2);
      this.UPDATE_SLOT.apply(this,arguments);
   }
   function SET_HEIGHT(label, value, arrow)
   {
      arguments.unshift(3);
      this.UPDATE_SLOT.apply(this,arguments);
   }
   function SET_STRENGTH(label, value, arrow)
   {
      arguments.unshift(0);
      this.UPDATE_SLOT.apply(this,arguments);
   }
   function UPDATE_SLOT(id, label, value, arrow)
   {
      if(label != "" && label != undefined)
      {
         this.slotsData[id] = {label:(label == undefined ? "" : label),value:(value == undefined ? "" : value),arrow:arrow,updated:true};
      }
      else
      {
         this.slotsData[id] = undefined;
         while(this.slotsData.length > 0 && this.slotsData[this.slotsData.length - 1] == undefined)
         {
            this.slotsData.pop();
         }
      }
      var _loc8_ = this.slots.length < this.slotsData.length ? this.slotsData.length : this.slots.length;
      var _loc2_;
      var _loc3_;
      _loc3_ = 0;
      while(_loc3_ < _loc8_)
      {
         _loc2_ = this.slots[_loc3_];
         if(this.slotsData[_loc3_] != undefined)
         {
            if(_loc2_ == undefined)
            {
               this.slots[_loc3_] = _loc2_ = this.slotContainerMC.attachMovie("slot","s" + _loc3_,this.slotContainerMC.getNextHighestDepth(),{_x:5,_y:2 + this.slotHeight * _loc3_,_alpha:0});
               _loc2_.valueTF.autoSize = "right";
               com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,0.2,{delay:0.1 * _loc3_,_alpha:100});
            }
            if(this.slotsData[_loc3_].updated)
            {
               _loc2_.labelTF.text = this.slotsData[_loc3_].label;
               _loc2_.valueTF._width = 10;
               _loc2_.valueTF.text = this.slotsData[_loc3_].value;
               _loc2_.valueTF._x = 140 - _loc2_.valueTF._width;
               if(arrow == undefined || arrow == this.ARROW_OFF)
               {
                  _loc2_.arrowMC._visible = false;
               }
               else
               {
                  if(arrow == this.ARROW_UP)
                  {
                     _loc2_.arrowMC._rotation = 0;
                  }
                  if(arrow == this.ARROW_DOWN)
                  {
                     _loc2_.arrowMC._rotation = 180;
                  }
                  _loc2_.arrowMC._x = _loc2_.valueTF._x - 8;
                  _loc2_.arrowMC._visible = true;
               }
               this.slotsData[_loc3_].updated = false;
            }
         }
         else if(_loc2_ != undefined)
         {
            if(_loc3_ == this.slotsData.length - 1)
            {
               while(this.slotsData[this.slotsData.length - 1] == undefined)
               {
                  this.slotsData.pop();
               }
            }
            else
            {
               this.slots[_loc3_] = undefined;
            }
            _loc2_.removeMovieClip();
         }
         _loc3_ = _loc3_ + 1;
      }
      if(this.slotsVisible != this.slotsData.length)
      {
         this.slotsVisible = this.slotsData.length;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.bgMC,0.2,{_height:(this.slotsVisible <= 0 ? 0 : this.slotsVisible * this.slotHeight + 10),ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.floatingUIMC,0.2,{_y:(this.BOUNDING_BOX._height - (this.slotsVisible <= 0 ? 0 : this.slotsVisible * this.slotHeight + 10)) / 2,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      }
   }
   function TRANSITION_IN(duration)
   {
      if(duration == undefined || duration == 0)
      {
         this._alpha = 100;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.floatingUIMC,duration / 1000,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_OUT});
      }
      this._visible = true;
   }
   function TRANSITION_OUT(duration)
   {
      if(duration == undefined || duration == 0)
      {
         this._alpha = 0;
         this._visible = false;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.floatingUIMC,duration / 1000,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.QUADRATIC_IN,onComplete:this._handleTransitionOutComplete,onCompleteScope:this});
      }
   }
   function _handleTransitionOutComplete()
   {
      this._visible = false;
   }
}
