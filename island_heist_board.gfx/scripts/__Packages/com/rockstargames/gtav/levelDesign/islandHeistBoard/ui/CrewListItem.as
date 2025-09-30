class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.CrewListItem extends com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem
{
   var colourScheme;
   var view;
   function CrewListItem(id, view, colourScheme)
   {
      super(id,view,colourScheme);
      view.swatch.transform.colorTransform = colourScheme.mid;
      view.gamertag.tf.verticalAlign = "center";
      view.percentage.tf.verticalAlign = "center";
   }
   function populate(index, gamertag, percentage, headsetState)
   {
      this.view.swatch.gotoAndStop(index + 1);
      this.view.gamertag.tf.text = gamertag;
      this.view.percentage.tf.text = percentage + "%";
      this.view.headset.gotoAndStop(headsetState + 1);
   }
   function setState(isOn)
   {
      super.setState(isOn);
      if(isOn)
      {
         this.view.gamertag.transform.colorTransform = this.colourScheme.dark;
         this.view.percentage.transform.colorTransform = this.colourScheme.dark;
         this.view.headset.transform.colorTransform = this.colourScheme.dark;
         this.view.arrows.transform.colorTransform = this.colourScheme.dark;
      }
      else
      {
         this.view.gamertag.transform.colorTransform = this.colourScheme.light;
         this.view.percentage.transform.colorTransform = this.colourScheme.light;
         this.view.headset.transform.colorTransform = this.colourScheme.light;
         this.view.arrows.transform.colorTransform = this.colourScheme.light;
      }
   }
}
