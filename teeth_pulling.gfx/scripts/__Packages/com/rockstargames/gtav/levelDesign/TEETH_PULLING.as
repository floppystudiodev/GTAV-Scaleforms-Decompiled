class com.rockstargames.gtav.levelDesign.TEETH_PULLING extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var toothMC;
   var depth = 0;
   var angle = 30;
   var isFinished = false;
   var isBroken = false;
   function TEETH_PULLING()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.toothMC = this.CONTENT.teethMC.toothMC;
   }
   function update()
   {
      if(Key.isDown(38))
      {
         this.depth += 10;
         this.SET_TEETH_BRITTLE(this.depth);
      }
      if(Key.isDown(40))
      {
         this.depth -= 10;
         this.SET_TEETH_BRITTLE(this.depth);
      }
      if(Key.isDown(37))
      {
         this.angle -= 1;
         this.SET_TEETH_ANGLE(this.angle);
      }
      if(Key.isDown(39))
      {
         this.angle += 1;
         this.SET_TEETH_ANGLE(this.angle);
      }
   }
   function tortureSuccess()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.toothMC,0.2,{_rotation:0});
      this.angle = 30;
   }
   function tortureFail()
   {
      if(this.toothMC.innerMC.painMC._currentFrame == 1)
      {
         this.toothMC.innerMC.painMC.gotoAndPlay("out");
      }
      this.toothMC.innerMC.painMC.gradMC._alpha = 0;
   }
   function SET_TEETH_BRITTLE(amount)
   {
      var _loc2_ = Math.max(0,Math.min(amount,100));
      this.toothMC.innerMC.painMC.gradMC._alpha = _loc2_;
      this.isBroken = _loc2_ >= 100;
      if(this.isBroken)
      {
         this.tortureFail();
      }
   }
   function SET_TEETH_ANGLE(amount)
   {
      var _loc2_ = Math.max(0,Math.min(amount,60));
      var _loc3_ = (330 + _loc2_) % 360;
      if(!this.isFinished)
      {
         this.toothMC._rotation = _loc3_;
      }
   }
   function SET_TEETH_DEPTH(amount)
   {
      var _loc3_ = Math.max(0,Math.min(amount,100));
      var _loc2_ = 45 * _loc3_ / 100;
      var _loc4_ = 10 - _loc2_;
      this.toothMC.innerMC._y = _loc4_;
      this.isFinished = amount >= 100;
      if(this.isFinished)
      {
         this.tortureSuccess();
      }
   }
   function CLEANUP_MOVIE()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.toothMC);
   }
}
