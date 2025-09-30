class com.rockstargames.gtav.FrontendGen9.components.StatBar extends MovieClip
{
   var statBarFull;
   var textTF;
   function StatBar()
   {
      super();
   }
   function SET_STATS(title, stat)
   {
      this.textTF.text = title;
      this.statBarFull._xscale = stat;
   }
}
