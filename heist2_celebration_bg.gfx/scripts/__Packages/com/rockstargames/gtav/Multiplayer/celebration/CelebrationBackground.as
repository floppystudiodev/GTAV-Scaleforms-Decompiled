class com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground
{
   var view;
   static var SLOPE_Y_DELTA = -100;
   static var TEXTURE_ALPHA = 40;
   function CelebrationBackground(container, colour, alpha, sideTextureId)
   {
      this.initView(container);
      this.initSolidBackground(colour,alpha);
      if(sideTextureId >= 0)
      {
         this.initTexture(sideTextureId);
      }
   }
   function initView(container)
   {
      this.view = container.createEmptyMovieClip("viewMC",0);
      this.view._y = - com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT - Math.abs(com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA);
   }
   function initSolidBackground(colour, alpha)
   {
      var _loc3_ = 0;
      var _loc6_ = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_WIDTH;
      var _loc4_;
      var _loc7_;
      var _loc5_;
      var _loc8_;
      if(com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA > 0)
      {
         _loc4_ = - com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA;
         _loc7_ = 0;
         _loc5_ = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT;
         _loc8_ = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT + com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA;
      }
      else
      {
         _loc4_ = 0;
         _loc7_ = com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA;
         _loc5_ = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT - com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.SLOPE_Y_DELTA;
         _loc8_ = com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT;
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
   function initTexture(sideTextureId)
   {
      var _loc4_ = ["MoneyMesh","Grid"];
      var _loc3_ = this.view.attachMovie(_loc4_[sideTextureId],"textureLeft",1);
      _loc3_._alpha = com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.TEXTURE_ALPHA;
      _loc3_._x = !com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN ? 160 : 0;
      _loc3_._y = 0.5 * com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT;
      var _loc2_ = this.view.attachMovie(_loc4_[sideTextureId],"textureRight",2);
      _loc2_._alpha = com.rockstargames.gtav.Multiplayer.celebration.CelebrationBackground.TEXTURE_ALPHA;
      _loc2_._rotation = 180;
      _loc2_._x = !com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.IS_WIDESCREEN ? com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_WIDTH - 160 : com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_WIDTH;
      _loc2_._y = 0.5 * com.rockstargames.gtav.Multiplayer.celebration.CelebrationSequence.SCREEN_HEIGHT;
   }
   function dispose()
   {
   }
}
