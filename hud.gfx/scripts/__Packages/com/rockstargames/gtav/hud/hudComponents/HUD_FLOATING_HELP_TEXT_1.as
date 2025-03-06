class com.rockstargames.gtav.hud.hudComponents.HUD_FLOATING_HELP_TEXT_1 extends com.rockstargames.gtav.hud.hudComponents.HUD_FLOATING_HELP_TEXT
{
   var hudCompEnum;
   var helpTextType;
   var TIMELINE;
   var CONTENT;
   var BOUNDING_BOX;
   function HUD_FLOATING_HELP_TEXT_1()
   {
      super();
      this.hudCompEnum = com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1;
      this.helpTextType = 1;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = this;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.BOUNDING_BOX = this.TIMELINE.BOUNDING_BOX;
      this.BOUNDING_BOX._visible = false;
   }
}
