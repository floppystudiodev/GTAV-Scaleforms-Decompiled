class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.HardModeWarning
{
   var lowerYPosition;
   var upperYPosition;
   var view;
   static var ICON_SPACING = 8;
   function HardModeWarning(view, isHardMode, upperYPosition, lowerYPosition, colourScheme)
   {
      this.view = view;
      this.upperYPosition = upperYPosition;
      this.lowerYPosition = lowerYPosition;
      if(isHardMode)
      {
         view.reveal.transform.colorTransform = colourScheme.dark;
         view.leftIcon.transform.colorTransform = colourScheme.mid;
         view.rightIcon.transform.colorTransform = colourScheme.mid;
         view.label.transform.colorTransform = colourScheme.mid;
         view.fill.transform.colorTransform = colourScheme.mid;
         view.background.transform.colorTransform = colourScheme.dark;
         view.label.tf.verticalAlign = "center";
         view.label.tf.autoSize = "left";
         view.label.tf.text = com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.setLocalisedText(view.label.tf,"IHB_HARD_MODE").toUpperCase();
         com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(view.label.tf);
         view.label._x = 0.5 * (view.background._width - view.label._width);
         view.leftIcon._x = view.label._x - view.leftIcon._width - com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.HardModeWarning.ICON_SPACING;
         view.rightIcon._x = view.label._x + view.label._width + com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.HardModeWarning.ICON_SPACING;
      }
      else
      {
         view._visible = false;
      }
   }
   function setYPosition(isUpperYPosition)
   {
      this.view._y = !isUpperYPosition ? this.lowerYPosition : this.upperYPosition;
   }
   function dispose()
   {
      this.view = null;
   }
}
