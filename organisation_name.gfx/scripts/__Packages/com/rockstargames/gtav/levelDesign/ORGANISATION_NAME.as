class com.rockstargames.gtav.levelDesign.ORGANISATION_NAME extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   static var DEFAULT_COLOUR = "#000000";
   static var DEFAULT_FONT = "$Font2";
   static var FONTS = ["$Machine","$Stencil","$Lubalin","$Bookman","$Stenberg","$Mistral","$HelveticaBLK","$HelveticaBLKI","$Times","$TradeGothic","$AnnaSC","$EngraversOldEnglish","$Bauhaus"];
   function ORGANISATION_NAME()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_ORGANISATION_NAME(str, styleIndex, colourIndex, fontIndex)
   {
      var _loc2_ = this.CONTENT.organisation_name;
      _loc2_.textAutoSize = "fit";
      _loc2_.verticalAlign = "center";
      var _loc5_ = !(typeof styleIndex != "number" || typeof colourIndex != "number") ? com.rockstargames.gtav.web.dynasty8ExecutiveRealty.OrganisationNameColour.getColourString(styleIndex,colourIndex) : com.rockstargames.gtav.levelDesign.ORGANISATION_NAME.DEFAULT_COLOUR;
      var _loc4_ = !(typeof fontIndex != "number" || fontIndex < 0) ? com.rockstargames.gtav.levelDesign.ORGANISATION_NAME.FONTS[fontIndex] : com.rockstargames.gtav.levelDesign.ORGANISATION_NAME.DEFAULT_FONT;
      _loc2_.htmlText = "<font face=\'" + _loc4_ + "\' color=\'" + _loc5_ + "\'>" + str + "</font>";
   }
   function debug()
   {
      this.SET_ORGANISATION_NAME("WWWWWWWWWWWWWWW",0,0,0);
   }
}
