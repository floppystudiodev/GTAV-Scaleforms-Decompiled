class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.FinaleListItem extends com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Button
{
   var checkBoxComplete;
   var view;
   var colourScheme;
   static var LABEL_X_POSITIONS = [22,44];
   function FinaleListItem(id, view, colourScheme)
   {
      super(id,view,colourScheme);
      this.checkBoxComplete = false;
      view.backgroundFill.transform.colorTransform = colourScheme.mid;
      view.backgroundFill._alpha = 30;
   }
   function populate(label, labelIsStringLiteral, secondaryLabel, showCheckBox, checkBoxComplete)
   {
      this.setLabel(label,labelIsStringLiteral);
      this.view.checkBox._visible = showCheckBox;
      this.view.label._x = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.FinaleListItem.LABEL_X_POSITIONS[!showCheckBox ? 0 : 1];
      this.checkBoxComplete = checkBoxComplete;
      this.view.secondaryLabel.tf.verticalAlign = "center";
      this.view.secondaryLabel.tf.text = secondaryLabel;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.secondaryLabel.tf);
      this.view.lowerLabel.tf.verticalAlign = "center";
      this.view.lowerLabel.tf.text = secondaryLabel;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.lowerLabel.tf);
      this.view.lowerLabel.transform.colorTransform = this.colourScheme.light;
   }
   function setState(isOn)
   {
      super.setState(isOn);
      if(isOn)
      {
         this.view.bezel.transform.colorTransform = this.colourScheme.light;
         this.view.label.transform.colorTransform = this.colourScheme.dark;
         this.view.secondaryLabel.transform.colorTransform = this.colourScheme.dark;
         this.view.checkBox.outline.transform.colorTransform = !this.checkBoxComplete ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox.fill.transform.colorTransform = !this.checkBoxComplete ? this.colourScheme.light : this.colourScheme.mid;
      }
      else
      {
         this.view.bezel.transform.colorTransform = this.colourScheme.mid;
         this.view.label.transform.colorTransform = this.colourScheme.light;
         this.view.secondaryLabel.transform.colorTransform = this.colourScheme.light;
         this.view.checkBox.outline.transform.colorTransform = !this.checkBoxComplete ? this.colourScheme.light : this.colourScheme.mid;
         this.view.checkBox.fill.transform.colorTransform = !this.checkBoxComplete ? this.colourScheme.dark : this.colourScheme.mid;
         this.view.checkBox.fill._visible = this.checkBoxComplete;
      }
   }
}
