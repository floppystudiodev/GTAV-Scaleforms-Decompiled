class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Button
{
   var bottom;
   var colourScheme;
   var depth;
   var enabled;
   var firstRun;
   var id;
   var left;
   var right;
   var top;
   var view;
   function Button(id, view, colourScheme)
   {
      this.id = id;
      this.view = view;
      this.colourScheme = colourScheme;
      this.depth = id;
      this.updateBounds();
      this.enabled = true;
      this.firstRun = true;
      view.backgroundOn.transform.colorTransform = colourScheme.light;
      view.backgroundOff.transform.colorTransform = colourScheme.mid;
   }
   function setLabel(label, isStringLiteral)
   {
      if(this.view.label && label)
      {
         this.view.label.tf.verticalAlign = "center";
         if(isStringLiteral)
         {
            this.view.label.tf.text = label.toUpperCase();
         }
         else
         {
            this.view.label.tf.text = com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.setLocalisedText(this.view.label.tf,label).toUpperCase();
         }
      }
      else
      {
         this.view.label.tf.text = "";
      }
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.label.tf);
   }
   function updateBounds()
   {
      var _loc3_ = this.view.getBounds(_root);
      this.left = _loc3_.xMin;
      this.right = _loc3_.xMax;
      this.top = _loc3_.yMin;
      this.bottom = _loc3_.yMax;
   }
   function setState(isOn)
   {
      if(isOn)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.backgroundOn);
         this.view.backgroundOn._alpha = 100;
         this.view.backgroundOff._visible = false;
         this.view.label.transform.colorTransform = this.colourScheme.dark;
      }
      else
      {
         if(this.firstRun)
         {
            this.view.backgroundOn._alpha = 0;
         }
         else
         {
            this.view.backgroundOn._alpha = Math.min(this.view.backgroundOn._alpha,30);
            com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.backgroundOn,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE});
         }
         this.view.backgroundOff._visible = true;
         this.view.label.transform.colorTransform = this.colourScheme.light;
      }
      this.firstRun = false;
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.backgroundOn);
      this.view = null;
      this.colourScheme = null;
   }
}
