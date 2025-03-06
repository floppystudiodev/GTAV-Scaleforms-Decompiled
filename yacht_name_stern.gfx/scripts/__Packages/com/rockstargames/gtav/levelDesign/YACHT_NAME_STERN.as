class com.rockstargames.gtav.levelDesign.YACHT_NAME_STERN extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CONTENT;
   function YACHT_NAME_STERN()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SET_YACHT_NAME(str, isWhiteText, country)
   {
      var _loc2_ = this.CONTENT.yacht_text.yacht_name;
      var _loc3_ = this.CONTENT.yacht_text.yacht_country;
      _loc2_.textAutoSize = "shrink";
      _loc3_.textAutoSize = "shrink";
      if(country == undefined)
      {
         country = "";
      }
      if(isWhiteText)
      {
         str = "<font color=\'#FFFFFF\'>" + str + "</font>";
         country = "<font color=\'#FFFFFF\'>" + country + "</font>";
      }
      _loc2_.htmlText = str;
      _loc3_.htmlText = country;
      _loc3_._y = _loc2_._y + _loc2_.textHeight + 50;
      _loc2_.textAutoSize = "shrink";
      _loc3_.textAutoSize = "shrink";
   }
   function debug()
   {
      this.SET_YACHT_NAME("WWWWWWW",false,"Scotland");
      trace("RAH!");
   }
}
