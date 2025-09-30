class com.rockstargames.gtav.levelDesign.AUTO_SHOP_CREW_NAME extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   var TIMELINE;
   var crewNameMC;
   static var COLOURS = [14533465,14737632,4802373,3255904,16160031,14428457,11807876,4018591,8146088];
   function AUTO_SHOP_CREW_NAME()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.crewNameMC = this.CONTENT.crewName;
      this.crewNameMC.textField.textAutoSize = "shrink";
      this.crewNameMC.textField.verticalAlign = "center";
   }
   function SET_COLOUR(colourId)
   {
      if(colourId < 0 || colourId >= com.rockstargames.gtav.levelDesign.AUTO_SHOP_CREW_NAME.COLOURS.length || colourId == undefined)
      {
         colourId = 0;
      }
      this.crewNameMC.textField.textColor = com.rockstargames.gtav.levelDesign.AUTO_SHOP_CREW_NAME.COLOURS[colourId];
   }
   function SET_CREW_NAME(crewName)
   {
      this.crewNameMC.textField.text = crewName;
   }
}
