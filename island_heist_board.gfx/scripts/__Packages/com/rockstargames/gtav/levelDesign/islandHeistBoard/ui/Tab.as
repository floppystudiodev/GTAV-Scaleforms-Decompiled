class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Tab
{
   var colourScheme;
   var isActive;
   var locked;
   var view;
   function Tab(view, label, locked, colourScheme)
   {
      this.view = view;
      this.locked = locked;
      this.colourScheme = colourScheme;
      this.setLabel(label);
   }
   function setLabel(label)
   {
      if(!this.locked)
      {
         this.view.locked._visible = false;
         this.view.label.tf.verticalAlign = "center";
         this.view.label.tf.text = label.toUpperCase();
         com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.label.tf);
      }
   }
   function setActive(isActive)
   {
      if(this.isActive !== isActive)
      {
         if(isActive)
         {
            this.view.label.transform.colorTransform = this.colourScheme.dark;
            this.view.background.transform.colorTransform = this.colourScheme.mid;
            this.view.background._alpha = 100;
            com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.background);
         }
         else
         {
            this.view.label.transform.colorTransform = this.colourScheme.mid;
            this.view.background.transform.colorTransform = this.colourScheme.mid;
            this.view.locked.transform.colorTransform = this.colourScheme.dark;
            this.view.background._alpha = this.isActive != undefined ? 30 : 0;
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.background,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE});
         }
         this.isActive = isActive;
      }
   }
   function get isLocked()
   {
      return this.locked;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.background);
      this.colourScheme = null;
      this.view = null;
   }
}
