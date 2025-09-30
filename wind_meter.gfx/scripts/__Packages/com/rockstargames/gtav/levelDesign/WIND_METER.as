class com.rockstargames.gtav.levelDesign.WIND_METER extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var _arrowRotation;
   var _strength;
   var mc;
   var _windColors = [13485106,7772776,1336471,6961750,13440791];
   var compassPointList = new Array();
   var angle = 0;
   var afactor = 57.2957795130823;
   var halfWidth = 15;
   var angleSteps = 60;
   function WIND_METER()
   {
      super();
      this.mc._textBig_tf = this.mc.txt_strength.getTextFormat();
      this.mc._textBig_tf.letterSpacing = -1;
      this.mc._textSub_tf = this.mc.txt_strength.getTextFormat();
      this.mc._textSub_tf.letterSpacing = 1;
      this.mc._textSub_tf.size = 10;
      this._arrowRotation = this.mc.mc_arrow._rotation;
      this._strength = this.mc.mc_strengthBG._currentframe;
   }
   function INITIALISE(_mc)
   {
      super.INITIALISE(_mc);
      this.mc = this.CONTENT.mc;
      this.initCompass();
   }
   function SET_WIND_DIRECTION(rotation, strg)
   {
      this.arrowRotation = rotation;
      this.strength = Math.round(strg);
   }
   function SET_COMPASS_DIRECTION(rotation)
   {
      this.setCompass(rotation);
   }
   function TINT_WIND_POINTER(id, r, g, b)
   {
      switch(id)
      {
         case 0:
            com.rockstargames.ui.utils.Colour.Colourise(this.mc.mc_arrow,r,g,b);
            break;
         case 1:
            com.rockstargames.ui.utils.Colour.Colourise(this.mc.mc_arrowBG,r,g,b);
         default:
            return;
      }
   }
   function get arrowRotation()
   {
      return this._arrowRotation;
   }
   function set arrowRotation(value)
   {
      if(value == this._arrowRotation)
      {
         return;
      }
      this.mc.mc_arrow._rotation = this._arrowRotation = value;
   }
   function get strength()
   {
      return this._strength;
   }
   function set strength(value)
   {
      this.mc.txt_strength.setNewTextFormat(this.mc._textBig_tf);
      this.mc.txt_strength.text = value + " mph".toUpperCase();
      this.mc.txt_strength.setTextFormat(value.toString().length,this.mc.txt_strength.text.length,this.mc._textSub_tf);
   }
   function initCompass()
   {
      this.compassPointList = [];
      var _loc4_ = ["N","W","S","E"];
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_ = this.mc.compassWordsMC.attachMovie("compassletter","compassletter" + _loc4_[_loc2_],this.mc.compassWordsMC.getNextHighestDepth());
         _loc3_.letterTF.text = _loc4_[_loc2_];
         _loc3_._alpha = 0;
         this.compassPointList.push(_loc3_);
         _loc2_ = _loc2_ + 1;
      }
      var _loc5_ = 30;
      this.halfWidth = _loc5_ / 2;
      this.angleSteps = _loc5_ * 2;
   }
   function setCompass(a)
   {
      var _loc6_ = Math.max(0,Math.min(a,360));
      var _loc5_ = - _loc6_ / 360 * this.angleSteps;
      var _loc7_ = _loc5_ % 28;
      var _loc2_;
      for(var _loc4_ in this.compassPointList)
      {
         _loc2_ = (a + 90 * _loc4_) % 360;
         this.setCompassPoint(this.compassPointList[_loc4_],_loc2_,_loc4_);
      }
   }
   function setCompassPoint(mc, a, index)
   {
      var _loc2_ = a / this.afactor;
      mc._x = Math.sin(_loc2_) * this.halfWidth;
      var _loc3_ = Math.abs(a - 180) - 80;
      mc._alpha = _loc3_;
   }
}
