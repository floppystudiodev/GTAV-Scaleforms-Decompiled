class com.rockstargames.gtav.web.prixluxuryrealestate.ToggleButton extends com.rockstargames.gtav.web.buttons.WebButtonAnchor
{
   var disabled;
   function ToggleButton()
   {
      super();
   }
   function gotoAndStop(frame)
   {
      if(!this.disabled)
      {
         super.gotoAndStop(frame);
      }
   }
}
