class com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground
{
   var view;
   static var SLOPE_Y_DELTA = -100;
   static var TEXTURE_ALPHA = 40;
   function CelebrationBackground(container, colour, alpha, useMoneyMesh)
   {
      this.initView(container);
      this.initSolidBackground(colour,alpha);
      if(useMoneyMesh)
      {
         this.initTexture();
      }
   }
   function initView(container)
   {
      this.view = container.createEmptyMovieClip("viewMC",0);
      this.view._y = - com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT - Math.abs(com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA);
   }
   function initSolidBackground(colour, alpha)
   {
      var _loc3_ = 0;
      var _loc6_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH;
      var _loc4_ = undefined;
      var _loc7_ = undefined;
      var _loc5_ = undefined;
      var _loc8_ = undefined;
      if(com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA > 0)
      {
         _loc4_ = - com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA;
         _loc7_ = 0;
         _loc5_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT;
         _loc8_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT + com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA;
      }
      else
      {
         _loc4_ = 0;
         _loc7_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA;
         _loc5_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT - com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.SLOPE_Y_DELTA;
         _loc8_ = com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT;
      }
      var _loc2_ = this.view.createEmptyMovieClip("solidBG",0);
      _loc2_.beginFill(colour,alpha);
      _loc2_.moveTo(_loc3_,_loc4_);
      _loc2_.lineTo(_loc6_,_loc7_);
      _loc2_.lineTo(_loc6_,_loc8_);
      _loc2_.lineTo(_loc3_,_loc5_);
      _loc2_.lineTo(_loc3_,_loc4_);
      _loc2_.endFill();
   }
   function initTexture()
   {
      var _loc3_ = this.view.attachMovie("MoneyMesh","textureLeft",1);
      _loc3_._alpha = com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.TEXTURE_ALPHA;
      _loc3_._x = !com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN ? 160 : 0;
      _loc3_._y = 0.5 * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT;
      var _loc2_ = this.view.attachMovie("MoneyMesh","textureRight",2);
      _loc2_._alpha = com.rockstargames.gtav.levelDesign.celebration.CelebrationBackground.TEXTURE_ALPHA;
      _loc2_._rotation = 180;
      _loc2_._x = !com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.IS_WIDESCREEN ? com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH - 160 : com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_WIDTH;
      _loc2_._y = 0.5 * com.rockstargames.gtav.levelDesign.celebration.CelebrationSequence.SCREEN_HEIGHT;
   }
   function dispose()
   {
   }
}
