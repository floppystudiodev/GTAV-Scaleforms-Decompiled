class com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP extends com.rockstargames.ui.core.BaseScreenLayout
{
   var CONTENT;
   var m;
   var noise;
   var noiseStep;
   var scale;
   var scaleGoal;
   var updateArgs;
   var x;
   var xGoal;
   var y;
   var yGoal;
   static var MAP_COORD_SCALE = 0.3415;
   static var MAP_ORIGIN_X = 1415.5;
   static var MAP_ORIGIN_Y = 2774;
   static var MAP_OFFSET_X = 360;
   static var MAP_OFFSET_Y = 360;
   static var MAP_SCALE_MIN = 0.2;
   static var MAP_SCALE_MAX = 2;
   static var MAP_SCALE_RANGE = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_SCALE_MAX - com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_SCALE_MIN;
   static var MOVEMENT_DAMPING = 0.1;
   static var SCALE_DAMPING = 0.05;
   static var START_X = 0;
   static var START_Y = 0;
   static var START_ZOOM = 0.2;
   static var FRAME_DURATION = 0.033;
   static var ZOOM_START_FRAME = 29;
   static var ZOOM_END_FRAME = 127;
   static var SHAKE_START_FRAME = 118;
   static var SHAKE_END_FRAME = 135;
   static var COUNTDOWN_COLOUR = new flash.geom.ColorTransform(0,0,0,1,201,0,0,0);
   static var NORMAL_COLOUR = new flash.geom.ColorTransform();
   function ORBITAL_CANNON_MAP()
   {
      super();
   }
   function initialise(mc)
   {
      super.INITIALISE(mc);
      this.m = new flash.geom.Matrix();
      this.noise = new com.rockstargames.ui.utils.Perlin1D();
      this.noiseStep = 0;
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      this.ZOOM_TO(com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.START_ZOOM);
      this.MOVE_TO(com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.START_X,com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.START_Y);
      this.CUT_TO_POSITION();
      this.CANCEL_ANIMATION();
      this.update();
   }
   function ZOOM_TO(normalisedZoom)
   {
      this.scaleGoal = normalisedZoom * com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_SCALE_RANGE + com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_SCALE_MIN;
   }
   function MOVE_TO(px, py)
   {
      this.xGoal = px * com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_COORD_SCALE + com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_ORIGIN_X;
      this.yGoal = (- py) * com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_COORD_SCALE + com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_ORIGIN_Y;
   }
   function CUT_TO_POSITION()
   {
      this.x = this.xGoal;
      this.y = this.yGoal;
      this.scale = this.scaleGoal;
      this.update();
   }
   function START_CHARGING()
   {
      this.CONTENT.hud.gotoAndPlay("charging");
      this.CONTENT.outerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.NORMAL_COLOUR;
      this.CONTENT.innerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.NORMAL_COLOUR;
   }
   function START_COUNTDOWN()
   {
      this.CONTENT.hud.gotoAndPlay("countdown");
      this.CONTENT.outerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.COUNTDOWN_COLOUR;
      this.CONTENT.innerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.COUNTDOWN_COLOUR;
   }
   function CANCEL_ANIMATION()
   {
      this.CONTENT.hud.gotoAndStop("normal");
      this.CONTENT.outerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.NORMAL_COLOUR;
      this.CONTENT.innerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.NORMAL_COLOUR;
   }
   function update()
   {
      var _loc6_ = this.CONTENT.map;
      var _loc3_ = this.CONTENT.hud._currentframe;
      var _loc7_ = _loc3_ >= com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.ZOOM_START_FRAME && _loc3_ <= com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.ZOOM_END_FRAME;
      var _loc10_ = _loc3_ >= com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.SHAKE_START_FRAME && _loc3_ <= com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.SHAKE_END_FRAME;
      var _loc5_ = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MOVEMENT_DAMPING * (this.xGoal - this.x);
      var _loc4_ = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MOVEMENT_DAMPING * (this.yGoal - this.y);
      this.x += _loc5_;
      this.y += _loc4_;
      var _loc11_ = !_loc7_ ? 1 : 1.2;
      this.scale += com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.SCALE_DAMPING * (_loc11_ * this.scaleGoal - this.scale);
      this.m.identity();
      this.m.translate(- this.x,- this.y);
      this.m.scale(this.scale,this.scale);
      this.m.translate(com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_OFFSET_X,com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.MAP_OFFSET_Y);
      var _loc9_;
      var _loc8_;
      if(_loc10_)
      {
         _loc9_ = 120 * this.noise.getValue(this.noiseStep);
         _loc8_ = 120 * this.noise.getValue(this.noiseStep + 5);
         this.noiseStep += 0.15;
         this.m.translate(_loc9_,_loc8_);
      }
      _loc6_.transform.matrix = this.m;
      var _loc2_ = (_loc5_ * _loc5_ + _loc4_ * _loc4_) / 20000;
      if(_loc2_ > 1)
      {
         _loc2_ = 1;
      }
      _loc2_ = _loc2_ * 200 + 0.05;
      this.CONTENT.outerScale._rotation += _loc2_;
      this.CONTENT.innerScale._rotation -= _loc2_;
      if(_loc3_ > com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.SHAKE_START_FRAME)
      {
         this.CONTENT.outerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.NORMAL_COLOUR;
         this.CONTENT.innerScale.transform.colorTransform = com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.NORMAL_COLOUR;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT,com.rockstargames.gtav.Multiplayer.ORBITAL_CANNON_MAP.FRAME_DURATION,this.updateArgs);
   }
}
