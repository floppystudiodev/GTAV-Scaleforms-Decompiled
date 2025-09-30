class com.rockstargames.gtav.Multiplayer.OPEN_WHEEL_HEALTH_INDICATOR extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var _name;
   var VEHICLE_FRONT = 0;
   var VEHICLE_BODY = 1;
   var VEHICLE_SPOILER = 2;
   var VEHICLE_WHEEL_FRONTLEFT = 3;
   var VEHICLE_WHEEL_FRONTRIGHT = 4;
   var VEHICLE_WHEEL_BACKLEFT = 5;
   var VEHICLE_WHEEL_BACKRIGHT = 6;
   function OPEN_WHEEL_HEALTH_INDICATOR()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "OPEN_WHEEL_HEALTH_INDICATOR";
   }
   function colorDestroyedPart(mc, isDestroyed)
   {
      if(isDestroyed)
      {
         com.rockstargames.ui.utils.Colour.Colourise(mc,224,50,50,100);
      }
      else
      {
         com.rockstargames.ui.utils.Colour.Colourise(mc,240,240,240,100);
      }
   }
   function colorWheelFromDmg(mc, dmg)
   {
      if(dmg == 100)
      {
         mc.gotoAndPlay(101);
      }
      else if(dmg >= 2 && dmg <= 99)
      {
         mc.gotoAndStop(dmg);
      }
      else if(dmg == 1)
      {
         mc.gotoAndPlay(161);
      }
      else
      {
         mc.gotoAndStop(1);
      }
   }
   function SET_PART_TO_DESTROYED(part, isDestroyed)
   {
      var _loc2_;
      switch(part)
      {
         case this.VEHICLE_FRONT:
            _loc2_ = this.CONTENT.healthIndicator.front;
            break;
         case this.VEHICLE_BODY:
            _loc2_ = this.CONTENT.healthIndicator.body;
            break;
         case this.VEHICLE_SPOILER:
            _loc2_ = this.CONTENT.healthIndicator.spoiler;
      }
      this.colorDestroyedPart(_loc2_,isDestroyed);
      _loc2_.gotoAndPlay(2);
   }
   function SET_WHEEL_DAMAGE(setWheel, setDmg)
   {
      var _loc2_;
      switch(setWheel)
      {
         case this.VEHICLE_WHEEL_FRONTLEFT:
            _loc2_ = this.CONTENT.healthIndicator.wheelAnim_FL;
            break;
         case this.VEHICLE_WHEEL_FRONTRIGHT:
            _loc2_ = this.CONTENT.healthIndicator.wheelAnim_FR;
            break;
         case this.VEHICLE_WHEEL_BACKLEFT:
            _loc2_ = this.CONTENT.healthIndicator.wheelAnim_BL;
            break;
         case this.VEHICLE_WHEEL_BACKRIGHT:
            _loc2_ = this.CONTENT.healthIndicator.wheelAnim_BR;
      }
      this.colorWheelFromDmg(_loc2_,setDmg);
   }
}
