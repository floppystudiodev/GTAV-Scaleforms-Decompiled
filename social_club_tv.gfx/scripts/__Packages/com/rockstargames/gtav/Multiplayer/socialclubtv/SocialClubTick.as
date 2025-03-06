class com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick extends MovieClip
{
   var endMC;
   static var TYPE_TEXT = 0;
   static var TYPE_GAMER_TAG = 1;
   static var TYPE_CREW_TAG = 2;
   var crewTagScale = 85;
   var crewtagOffset = -12;
   function SocialClubTick()
   {
      super();
   }
   function setLabel(enum, str)
   {
      var _loc4_ = undefined;
      var _loc5_ = 0;
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         switch(arguments[_loc3_])
         {
            case com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_CREW_TAG:
               var _loc6_ = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(this.attachMovie("CREW_TAG_MOVIECLIP","l" + _loc3_ / 2,this.getNextHighestDepth(),{_x:_loc5_ + 8,_y:10.5,_xscale:this.crewTagScale,_yscale:this.crewTagScale}));
               _loc6_.UNPACK_CREW_TAG(arguments[_loc3_ + 1]);
               _loc4_ = _loc6_;
               break;
            case com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_GAMER_TAG:
               _loc4_ = this.attachMovie("TickGamerTag","l" + _loc3_ / 2,this.getNextHighestDepth(),{_x:_loc5_ + 8});
               _loc4_.textTF.autoSize = true;
               _loc4_.textTF.text = arguments[_loc3_ + 1];
               break;
            case com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_TEXT:
            default:
               _loc4_ = this.attachMovie("TickText","l" + _loc3_ / 2,this.getNextHighestDepth(),{_x:_loc5_ + 8});
               _loc4_.textTF.autoSize = true;
               _loc4_.textTF.text = arguments[_loc3_ + 1];
         }
         _loc5_ = _loc4_._x + _loc4_._width;
         if(arguments[_loc3_] == com.rockstargames.gtav.Multiplayer.socialclubtv.SocialClubTick.TYPE_CREW_TAG)
         {
            _loc5_ += this.crewtagOffset;
         }
         _loc3_ += 2;
      }
      this.endMC._x = Math.round(_loc5_ + 8);
   }
   function get tickWidth()
   {
      return this.endMC._x + 1;
   }
}
