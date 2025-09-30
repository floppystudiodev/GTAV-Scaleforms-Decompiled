class com.rockstargames.gtav.levelDesign.REMOTE_SNIPER_HUD extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var SET_DISPLAY_CONFIG;
   var ref;
   var safeBottom;
   var safeLeft;
   var safeRight;
   var safeTop;
   var screenHeightPixels;
   var screenWidthPixels;
   var windGaugeMC;
   var zoomLevelTF;
   var zoom = 0;
   var angle = 0;
   var aspeed = 4;
   var afactor = 57.2957795130823;
   var compassPointList = new Array();
   var halfWidth = 196;
   var angleSteps = 676;
   var szone = 0.15;
   function REMOTE_SNIPER_HUD()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.loadingAnimation();
      this.windGaugeMC = this.CONTENT.scopeMC.windGaugeMC.circleMC.handMC;
      this.zoomLevelTF = this.CONTENT.zoomLevel;
      this.compassPointList = [];
      var _loc5_ = ["N","E","S","W"];
      var _loc3_ = 0;
      while(_loc3_ < _loc5_.length)
      {
         mc = this.CONTENT.scopeMC.compassWordsMC.attachMovie("compassletter","compassletter" + _loc5_[_loc3_],this.CONTENT.scopeMC.compassWordsMC.getNextHighestDepth());
         mc.letterTF.text = _loc5_[_loc3_];
         mc._alpha = 0;
         this.compassPointList.push(mc);
         _loc3_ = _loc3_ + 1;
      }
      this.halfWidth = this.CONTENT.scopeMC.compassMC._width / 2;
      this.angleSteps = this.CONTENT.scopeMC.compassMC._width * 2;
      this.loadingAnimation();
   }
   function loadingAnimation()
   {
      this.CONTENT._visible = false;
      var _loc11_ = 0.25;
      var _loc10_ = 0.5;
      var _loc8_ = 0.75;
      var _loc7_ = 1;
      this.CONTENT.scopeMC.blackGradMC._alpha = 0;
      this.CONTENT.scopeMC.circlesMC._alpha = 0;
      this.CONTENT.scopeMC.circlesMC._xscale = 0;
      this.CONTENT.scopeMC.circlesMC.outerRing._alpha = 0;
      this.CONTENT.scopeMC.circlesMC.outerRing._xscale = 0;
      this.CONTENT.scopeMC.circlesMC.outerRing._yscale = 0;
      this.CONTENT.scopeMC.circlesMC.circMC._alpha = 0;
      this.CONTENT.scopeMC.circlesMC.circMC._xscale = 0;
      this.CONTENT.scopeMC.circlesMC.circMC._yscale = 0;
      this.CONTENT.scopeMC.circlesMC.ringMC._alpha = 0;
      this.CONTENT.scopeMC.circlesMC.ringMC._xscale = 150;
      this.CONTENT.scopeMC.circlesMC.ringMC._yscale = 150;
      this.CONTENT.scopeMC.circlesMC.ringMC._rotation = -20;
      this.CONTENT.scopeMC.compassMC._alpha = 0;
      this.CONTENT.scopeMC.compassWordsMC._alpha = 0;
      this.CONTENT.scopeMC.windGaugeMC._alpha = 0;
      this.CONTENT.scopeMC.windGaugeMC._xscale = 0;
      this.CONTENT.scopeMC.windGaugeMC._yscale = 0;
      this.CONTENT.scopeMC.crosshairMC._alpha = 0;
      this.CONTENT.scopeMC.crosshairMC._xscale = 50;
      this.CONTENT.scopeMC.crosshairMC._yscale = 50;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.blackGradMC,0.5,{_alpha:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.circlesMC,0.5,{_alpha:100,_xscale:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_IN,delay:0.25});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.circlesMC.outerRing,0.5,{_alpha:100,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_IN,delay:0.75});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.circlesMC.circMC,0.5,{_alpha:100,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,delay:1});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.circlesMC.ringMC,0.5,{_alpha:100,_xscale:100,_yscale:100,_rotation:0,ease:com.rockstargames.ui.tweenStar.Ease.SINE_IN,delay:1.25});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.compassMC,0.5,{_alpha:100,delay:1.5});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.compassWordsMC,0.75,{_alpha:100,delay:1.75});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.windGaugeMC,0.5,{_alpha:100,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,delay:1.5});
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.CONTENT.scopeMC.crosshairMC,0.5,{_alpha:100,_xscale:100,_yscale:100,ease:com.rockstargames.ui.tweenStar.Ease.SINE_OUT,delay:2});
      this.CONTENT._visible = true;
   }
   function debug()
   {
      var _loc2_ = 0.15;
      this.SET_DISPLAY_CONFIG(960,720,_loc2_,1 - _loc2_,_loc2_,1 - _loc2_,false,true);
      this.CONTENT.ref = this;
      this.CONTENT.onEnterFrame = function()
      {
         this.ref.update();
      };
   }
   function update()
   {
      if(Key.isDown(37))
      {
         this.angle -= this.aspeed;
         if(this.angle < 0)
         {
            this.angle += 360;
         }
         this.SET_COMPASS(this.angle);
      }
      if(Key.isDown(39))
      {
         this.angle += this.aspeed;
         if(this.angle > 360)
         {
            this.angle -= 360;
         }
         this.SET_COMPASS(this.angle);
      }
      if(Key.isDown(38))
      {
         this.zoom += this.aspeed;
         if(this.zoom > 100)
         {
            this.zoom -= 100;
         }
         this.SET_WIND(this.zoom,true);
         this.szone += 0.05;
      }
      if(Key.isDown(40))
      {
         this.zoom -= this.aspeed;
         if(this.zoom < 0)
         {
            this.zoom += 100;
         }
         this.SET_WIND(this.zoom,false);
         this.szone -= 0.05;
      }
   }
   function initScreenLayout()
   {
      var _loc3_ = this.CONTENT.scopeMC.blackGradMC;
      _loc3_._width = this.screenWidthPixels;
      _loc3_._height = this.screenHeightPixels;
      var _loc4_ = this.CONTENT.scopeMC.circlesMC;
      _loc4_._x = (this.safeRight + this.safeLeft) / 2;
      _loc4_._y = this.safeTop + (this.safeBottom - this.safeTop) / 2;
      var _loc7_ = this.CONTENT.scopeMC.crosshairMC;
      _loc7_._x = (this.safeRight + this.safeLeft) / 2;
      _loc7_._y = this.safeTop + (this.safeBottom - this.safeTop) / 2;
      var _loc2_ = this.CONTENT.scopeMC.compassMC;
      _loc2_._x = (this.safeRight + this.safeLeft) / 2;
      _loc2_._y = this.safeTop;
      var _loc5_ = this.CONTENT.scopeMC.compassWordsMC;
      _loc5_._x = (this.safeRight + this.safeLeft) / 2;
      _loc5_._y = _loc2_._y + _loc2_._height + 16;
      var _loc6_ = this.CONTENT.scopeMC.windGaugeMC;
      _loc6_._x = this.safeRight - 127 - _loc6_._width;
   }
   function SET_ZOOM_LEVEL(zoomLevel)
   {
   }
   function SET_WIND(windValue, directionIsRight)
   {
      var _loc2_ = Math.max(0,Math.min(windValue,100));
      if(directionIsRight)
      {
         this.windGaugeMC._xscale = 100;
      }
      else
      {
         this.windGaugeMC._xscale = -100;
      }
      this.windGaugeMC.maskMC._xScale = _loc2_;
      this.windGaugeMC.maskMC._yScale = _loc2_;
   }
   function SET_COMPASS(a)
   {
      this.angle = a;
      var _loc6_ = Math.max(0,Math.min(this.angle,360));
      var _loc4_ = - _loc6_ / 360 * this.angleSteps;
      var _loc5_ = _loc4_ % 28;
      var _loc2_;
      for(var _loc3_ in this.compassPointList)
      {
         _loc2_ = (this.angle + 90 * _loc3_) % 360;
         this.setCompassPointPos(this.compassPointList[_loc3_],_loc2_,_loc3_);
      }
      this.CONTENT.scopeMC.compassMC.compassInnerMC._x = 14 + _loc5_;
   }
   function setCompassPointPos(mc, a, index)
   {
      var _loc2_ = a / this.afactor;
      mc._x = Math.sin(_loc2_) * this.halfWidth;
      mc._alpha = Math.abs(a - 180) / 1.8;
   }
}
