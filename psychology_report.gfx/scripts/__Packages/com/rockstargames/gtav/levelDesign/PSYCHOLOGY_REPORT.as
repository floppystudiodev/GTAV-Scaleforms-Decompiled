class com.rockstargames.gtav.levelDesign.PSYCHOLOGY_REPORT extends com.rockstargames.gtav.levelDesign.LETTER_SCRAPS
{
   var CONTENT;
   function PSYCHOLOGY_REPORT()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT.letterTF.fauxBold = false;
      this.CONTENT.gamertagTF.fauxBold = false;
   }
   function SET_PLAYER_NAME(gamerTitle, gamerTag, crewtag)
   {
      this.CONTENT.gamertagTF.autoSize = "right";
      this.CONTENT.gamertagTF.htmlText = gamerTag;
      this.CONTENT.gamerTitleTF._x = this.CONTENT.gamertagTF._x - this.CONTENT.gamerTitleTF._width;
      this.CONTENT.gamerTitleTF.htmlText = gamerTitle;
   }
}
