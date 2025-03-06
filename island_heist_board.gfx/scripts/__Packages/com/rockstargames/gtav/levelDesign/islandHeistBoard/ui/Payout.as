class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Payout
{
   var view;
   function Payout(view, label, defaultLabel, value, isVisible, colourScheme)
   {
      this.view = view;
      view.label.tf.verticalAlign = "center";
      if(label == undefined)
      {
         view.label.tf.text = com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.setLocalisedText(view.label.tf,defaultLabel).toUpperCase();
      }
      else
      {
         view.label.tf.text = label.toUpperCase();
      }
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(view.label.tf);
      view.value.tf.verticalAlign = "center";
      view.value.tf.textAutoSize = "shrink";
      view.value.tf.text = "$" + com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.formatNumber(value);
      view.label.transform.colorTransform = colourScheme.dark;
      view.value.transform.colorTransform = colourScheme.light;
      view.bezel.transform.colorTransform = colourScheme.mid;
      view.reveal.transform.colorTransform = colourScheme.dark;
      view.background.transform.colorTransform = colourScheme.dark;
      view._visible = isVisible;
   }
}
