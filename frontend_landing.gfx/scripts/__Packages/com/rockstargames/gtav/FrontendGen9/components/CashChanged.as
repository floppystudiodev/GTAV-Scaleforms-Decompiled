class com.rockstargames.gtav.FrontendGen9.components.CashChanged extends com.rockstargames.gtav.FrontendGen9.components.Cash
{
   var _alpha;
   function CashChanged()
   {
      super();
      this._alpha = 0;
   }
   function SET_TEXT(str, isRichText)
   {
      super.SET_TEXT(str,isRichText);
      this.fadeIn();
   }
   function fadeIn()
   {
      var _loc2_ = 0.133;
      var _loc5_ = 0.133;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,0.5,{_alpha:100,onComplete:this.wait,onCompleteScope:this});
   }
   function wait()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this,2,{onComplete:this.fadeOut,onCompleteScope:this});
   }
   function fadeOut()
   {
      var _loc2_ = 0.133;
      var _loc3_ = 0.133;
      this._alpha = 0;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this,0.5,{_alpha:0});
   }
}
