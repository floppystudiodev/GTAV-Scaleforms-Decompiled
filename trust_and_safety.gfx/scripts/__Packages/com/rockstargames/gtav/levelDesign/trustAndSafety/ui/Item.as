class com.rockstargames.gtav.levelDesign.trustAndSafety.ui.Item
{
   var heading;
   var body;
   var view;
   function Item(heading, body)
   {
      this.heading = heading;
      this.body = body.join("");
   }
   function setView(view)
   {
      this.view = view;
      view.highlight._visible = false;
      view.label.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.TRUST_AND_SAFETY.truncate(view.label,this.heading.toUpperCase());
   }
}
