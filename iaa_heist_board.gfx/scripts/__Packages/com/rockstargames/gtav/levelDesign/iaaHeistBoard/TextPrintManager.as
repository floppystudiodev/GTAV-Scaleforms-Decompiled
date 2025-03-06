class com.rockstargames.gtav.levelDesign.iaaHeistBoard.TextPrintManager
{
   var updateMovieClip;
   var printItems;
   var updateArgs;
   var running;
   static var UPDATE_INTERVAL = 0.03;
   function TextPrintManager(updateMovieClip)
   {
      this.updateMovieClip = updateMovieClip;
      this.printItems = [];
      this.updateArgs = {onCompleteScope:this,onComplete:this.update};
      this.running = false;
   }
   function printText(text, textField, preDelay, updateMultiplier)
   {
      var _loc2_ = 0;
      var _loc3_ = this.printItems.length;
      while(_loc2_ < _loc3_)
      {
         var _loc6_ = this.printItems[_loc2_];
         if(_loc6_.textFieldMatches(textField))
         {
            if(_loc6_.textMatches(text))
            {
               return undefined;
            }
            this.printItems.splice(_loc2_,1);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
      _loc6_ = new com.rockstargames.gtav.levelDesign.iaaHeistBoard.TextPrintItem(text,textField,preDelay,updateMultiplier);
      this.printItems.push(_loc6_);
      if(!this.running)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.updateMovieClip,com.rockstargames.gtav.levelDesign.iaaHeistBoard.TextPrintManager.UPDATE_INTERVAL,this.updateArgs);
         this.running = true;
      }
   }
   function reset()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.updateMovieClip);
      this.running = false;
      this.printItems.length = 0;
   }
   function update()
   {
      var _loc2_ = this.printItems.length - 1;
      while(_loc2_ >= 0)
      {
         var _loc3_ = this.printItems[_loc2_].update();
         if(_loc3_)
         {
            this.printItems.splice(_loc2_,1);
         }
         _loc2_ = _loc2_ - 1;
      }
      if(this.printItems.length > 0)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.updateMovieClip,com.rockstargames.gtav.levelDesign.iaaHeistBoard.TextPrintManager.UPDATE_INTERVAL,this.updateArgs);
      }
      else
      {
         this.running = false;
      }
   }
}
