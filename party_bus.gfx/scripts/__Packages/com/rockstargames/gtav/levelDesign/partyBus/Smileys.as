class com.rockstargames.gtav.levelDesign.partyBus.Smileys extends com.rockstargames.gtav.levelDesign.partyBus.Animation
{
   var beatSets;
   var beatStep;
   var height;
   var icons;
   var smileySets;
   var view;
   static var FALL_SPEED = 4;
   static var SET_HEIGHT = 240;
   static var BEAT_SCALE = 200;
   function Smileys(container, width, height)
   {
      super(container,width,height,"smileyComp");
      this.init();
   }
   function init()
   {
      this.smileySets = [this.view.smileys0,this.view.smileys1];
      this.icons = [[],[]];
      this.beatSets = [[],[],[],[]];
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < this.smileySets.length)
      {
         for(var _loc5_ in this.smileySets[_loc2_])
         {
            _loc3_ = this.smileySets[_loc2_][_loc5_];
            this.icons[_loc2_].push(_loc3_);
            _loc4_ = parseInt(_loc3_._name.charAt(3));
            if(!isNaN(_loc4_))
            {
               this.beatSets[_loc4_].push(_loc3_);
            }
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function update()
   {
      var _loc3_ = 0;
      var _loc4_;
      var _loc2_;
      while(_loc3_ < this.smileySets.length)
      {
         this.smileySets[_loc3_]._y += com.rockstargames.gtav.levelDesign.partyBus.Smileys.FALL_SPEED;
         _loc4_ = 0;
         while(_loc4_ < this.icons[_loc3_].length)
         {
            _loc2_ = this.icons[_loc3_][_loc4_];
            _loc2_._xscale += 0.2 * (100 - _loc2_._xscale);
            _loc2_._yscale = _loc2_._xscale;
            _loc2_._rotation += Math.random() * 4 - 2;
            _loc4_ = _loc4_ + 1;
         }
         if(this.smileySets[_loc3_]._y >= this.height)
         {
            this.reset(this.smileySets[_loc3_],this.icons[_loc3_]);
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function reset(smileySet, icons)
   {
      smileySet._y -= 2 * com.rockstargames.gtav.levelDesign.partyBus.Smileys.SET_HEIGHT;
      var _loc1_ = 0;
      while(_loc1_ < icons.length)
      {
         icons[_loc1_]._rotation = Math.random() * 90 - 45;
         _loc1_ = _loc1_ + 1;
      }
   }
   function beat()
   {
      var _loc4_ = this.beatSets[this.beatStep % this.beatSets.length];
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < _loc4_.length)
      {
         _loc3_ = _loc4_[_loc2_];
         _loc3_._xscale = _loc3_._yscale = com.rockstargames.gtav.levelDesign.partyBus.Smileys.BEAT_SCALE;
         _loc2_ = _loc2_ + 1;
      }
      this.beatStep = this.beatStep + 1;
   }
}
