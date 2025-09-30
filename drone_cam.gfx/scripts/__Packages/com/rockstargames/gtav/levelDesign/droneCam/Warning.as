class com.rockstargames.gtav.levelDesign.droneCam.Warning
{
   var flashOffDuration;
   var flashOnDuration;
   var flashing;
   var updateArgs;
   var view;
   static var MAX_FLASH_ON_DURATION = 1;
   static var MIN_FLASH_ON_DURATION = 0.15;
   static var MAX_FLASH_OFF_DURATION = 1;
   static var MIN_FLASH_OFF_DURATION = 0.1;
   function Warning(view, visible, label)
   {
      this.view = view;
      this.visible = visible;
      view.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.DRONE_CAM.setLocalisedText(view.label,label,4);
      this.updateArgs = {onCompleteScope:this,onComplete:this.updateFlash};
      this.flashing = false;
   }
   function set visible(isVisible)
   {
      this.view._visible = isVisible;
      if(!isVisible)
      {
         this.stopFlash();
      }
   }
   function set flashRate(normRate)
   {
      if(normRate < 0)
      {
         this.stopFlash();
      }
      else
      {
         normRate = Math.min(1,normRate);
         this.flashOnDuration = (1 - normRate) * (com.rockstargames.gtav.levelDesign.droneCam.Warning.MAX_FLASH_ON_DURATION - com.rockstargames.gtav.levelDesign.droneCam.Warning.MIN_FLASH_ON_DURATION) + com.rockstargames.gtav.levelDesign.droneCam.Warning.MIN_FLASH_ON_DURATION;
         this.flashOffDuration = (1 - normRate) * (com.rockstargames.gtav.levelDesign.droneCam.Warning.MAX_FLASH_OFF_DURATION - com.rockstargames.gtav.levelDesign.droneCam.Warning.MIN_FLASH_OFF_DURATION) + com.rockstargames.gtav.levelDesign.droneCam.Warning.MIN_FLASH_OFF_DURATION;
         if(!this.flashing)
         {
            this.startFlash();
         }
      }
   }
   function startFlash()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view,!this.view._visible ? this.flashOffDuration : this.flashOnDuration,this.updateArgs);
      this.flashing = true;
   }
   function stopFlash()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.flashing = false;
   }
   function updateFlash()
   {
      this.view._visible = !this.view._visible;
      this.startFlash();
   }
}
