class com.rockstargames.gtav.levelDesign.robberyComputer.data.Robbery
{
   var missions;
   static var STATE_INCOMPLETE = 0;
   static var STATE_COMPLETE_BASIC = 1;
   static var STATE_COMPLETE_ADVANCED = 2;
   static var STATE_COMPLETE_PROCESSING = 3;
   function Robbery()
   {
      this.missions = [];
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.MAX_MISSIONS)
      {
         this.missions[_loc2_] = null;
         _loc2_ = _loc2_ + 1;
      }
   }
}
