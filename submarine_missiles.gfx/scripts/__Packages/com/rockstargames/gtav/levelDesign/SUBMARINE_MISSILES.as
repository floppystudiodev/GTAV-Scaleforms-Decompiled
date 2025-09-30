class com.rockstargames.gtav.levelDesign.SUBMARINE_MISSILES extends com.rockstargames.gtav.levelDesign.TURRET_CAM
{
   var CONTENT;
   var flashOffDuration;
   var flashOnDuration;
   var flashing;
   var fovMC;
   var updateArgs;
   static var MAX_FLASH_ON_DURATION = 1;
   static var MIN_FLASH_ON_DURATION = 0.15;
   static var MAX_FLASH_OFF_DURATION = 1;
   static var MIN_FLASH_OFF_DURATION = 0.1;
   function SUBMARINE_MISSILES()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT.warning._visible = false;
      this.CONTENT.warning.label.textAutoSize = "shrink";
      this.setLocalisedText(this.CONTENT.warning.label,"SUBMISSILE_WARN",4);
      this.updateArgs = {onCompleteScope:this,onComplete:this.updateFlash};
      this.flashing = false;
   }
   function SET_ZOOM_VISIBLE(isVisible)
   {
      this.fovMC._visible = isVisible;
   }
   function SET_WARNING_IS_VISIBLE(isVisible)
   {
      this.CONTENT.warning._visible = isVisible;
      if(!isVisible)
      {
         this.stopFlash();
      }
   }
   function SET_WARNING_FLASH_RATE(normRate)
   {
      if(normRate < 0)
      {
         this.stopFlash();
      }
      else
      {
         normRate = Math.min(1,normRate);
         this.flashOnDuration = (1 - normRate) * (com.rockstargames.gtav.levelDesign.SUBMARINE_MISSILES.MAX_FLASH_ON_DURATION - com.rockstargames.gtav.levelDesign.SUBMARINE_MISSILES.MIN_FLASH_ON_DURATION) + com.rockstargames.gtav.levelDesign.SUBMARINE_MISSILES.MIN_FLASH_ON_DURATION;
         this.flashOffDuration = (1 - normRate) * (com.rockstargames.gtav.levelDesign.SUBMARINE_MISSILES.MAX_FLASH_OFF_DURATION - com.rockstargames.gtav.levelDesign.SUBMARINE_MISSILES.MIN_FLASH_OFF_DURATION) + com.rockstargames.gtav.levelDesign.SUBMARINE_MISSILES.MIN_FLASH_OFF_DURATION;
         if(!this.flashing)
         {
            this.startFlash();
         }
      }
   }
   function startFlash()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.CONTENT.warning,!this.CONTENT.warning._visible ? this.flashOffDuration : this.flashOnDuration,this.updateArgs);
      this.flashing = true;
   }
   function stopFlash()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.CONTENT.warning);
      this.flashing = false;
   }
   function updateFlash()
   {
      this.CONTENT.warning._visible = !this.CONTENT.warning._visible;
      this.startFlash();
   }
   function setLocalisedText(tf, label, letterSpacing)
   {
      var _loc2_ = tf.getNewTextFormat();
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      if(letterSpacing != undefined)
      {
         _loc2_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc2_);
      }
      return tf.text;
   }
}
