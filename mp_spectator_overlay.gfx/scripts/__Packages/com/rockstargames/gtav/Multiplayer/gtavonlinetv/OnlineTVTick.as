class com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick extends MovieClip
{
   var endMC;
   static var TYPE_FEED = 0;
   static var TYPE_TWITTER = 1;
   static var TYPE_SOCIAL = 2;
   static var TYPE_JOB = 3;
   var crewTagScale = 85;
   var crewtagOffset = -12;
   function OnlineTVTick()
   {
      super();
   }
   function setLabel(enum, str)
   {
      var _loc3_ = undefined;
      var _loc5_ = 0;
      var _loc7_ = 14;
      var _loc4_ = 0;
      while(_loc4_ < arguments.length)
      {
         switch(arguments[_loc4_])
         {
            case com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_JOB:
               _loc3_ = this.attachMovie("TickJobItem","l" + _loc4_ / 2,this.getNextHighestDepth(),{_x:_loc5_});
               _loc3_.bgMC._alpha = 0;
               _loc7_ = 20;
               break;
            case com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_SOCIAL:
               _loc3_ = this.attachMovie("TickFeedItem","l" + _loc4_ / 2,this.getNextHighestDepth(),{_x:_loc5_});
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.bgMC,255,167,21);
               break;
            case com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_TWITTER:
               _loc3_ = this.attachMovie("TickFeedItem","l" + _loc4_ / 2,this.getNextHighestDepth(),{_x:_loc5_});
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.bgMC,92,173,226);
               break;
            case com.rockstargames.gtav.Multiplayer.gtavonlinetv.OnlineTVTick.TYPE_FEED:
            default:
               _loc3_ = this.attachMovie("TickFeedItem","l" + _loc4_ / 2,this.getNextHighestDepth(),{_x:_loc5_});
               com.rockstargames.ui.utils.Colour.Colourise(_loc3_.bgMC,193,3,15);
         }
         _loc3_.textTF.autoSize = true;
         _loc3_.textTF.htmlText = arguments[_loc4_ + 1];
         var _loc6_ = _loc3_.textTF._width + _loc7_ * 2;
         _loc3_.bgMC._width = _loc6_;
         _loc3_.textTF._x = _loc7_;
         _loc5_ = _loc3_._x + _loc6_;
         _loc4_ += 2;
      }
      this.endMC._x = Math.round(_loc5_);
   }
   function get tickWidth()
   {
      return this.endMC._x + 1;
   }
}
