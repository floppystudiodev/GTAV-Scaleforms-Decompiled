class com.rockstargames.gtav.levelDesign.MISSION_TARGET_COMPLETE extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var innerMC;
   var CONTENT;
   var totalHeight = 41;
   var itemsPadding = 10;
   var data = new Array();
   var fadeTime = 1;
   function MISSION_TARGET_COMPLETE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.innerMC = this.CONTENT.targetItemMC.innerMC;
      this.CONTENT._alpha = 0;
   }
   function SET_DATA_SLOT()
   {
      var _loc3_ = arguments;
      this.data = _loc3_;
      this.innerMC.animMC._alpha = 100;
      var _loc9_ = _loc3_[1];
      var _loc4_ = "";
      var _loc10_ = _loc3_[_loc3_.length - 1];
      this.innerMC._alpha = 100;
      switch(_loc9_)
      {
         case 0:
            this.innerMC._alpha = 50;
            break;
         case 1:
            _loc4_ = _loc3_[_loc3_.length - 2];
            break;
         case 2:
            _loc4_ = _loc3_[_loc3_.length - 2];
            break;
         case 3:
            _loc4_ = _loc3_[_loc3_.length - 2] + "%";
            break;
         case 4:
            var _loc5_ = _loc3_[_loc3_.length - 3];
            var _loc7_ = String(_loc5_);
            if(_loc5_ < 10)
            {
               _loc7_ = "0" + _loc5_;
            }
            var _loc6_ = _loc3_[_loc3_.length - 2];
            var _loc8_ = String(_loc6_);
            if(_loc6_ < 10)
            {
               _loc8_ = "0" + _loc6_;
            }
            _loc4_ = _loc7_ + ":" + _loc8_;
            break;
         case 5:
            _loc4_ = _loc3_[_loc3_.length - 3] + "/" + _loc3_[_loc3_.length - 2];
            break;
         case 6:
            _loc4_ = "$" + _loc3_[_loc3_.length - 2];
      }
      this.innerMC.itemTextLeft.text = _loc10_;
      this.innerMC.itemTextLeft.autoSize = "left";
      this.innerMC.itemTextRight.text = _loc4_;
      this.innerMC.itemTextRight.autoSize = "right";
   }
   function clampText(textF, labelS, maxVal)
   {
      textF.text = labelS;
      textF.wordWrap = false;
      if(textF._width > maxVal)
      {
         textF._xscale = maxVal / textF._width * 100;
      }
   }
   function SHOW(_fadeTime)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,_fadeTime != undefined ? _fadeTime : this.fadeTime,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT,onComplete:this.onShow,onCompleteScope:this});
   }
   function onShow()
   {
      this.innerMC.completeMC.gotoAndStop(this.data[0] != 1 ? 1 : 2);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.innerMC.animMC,1,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
   }
   function HIDE(_fadeTime)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT,_fadeTime != undefined ? _fadeTime : this.fadeTime,{_alpha:0,ease:com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT});
   }
}
