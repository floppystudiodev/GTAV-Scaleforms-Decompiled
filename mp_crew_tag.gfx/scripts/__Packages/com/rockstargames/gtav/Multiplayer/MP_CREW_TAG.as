class com.rockstargames.gtav.Multiplayer.MP_CREW_TAG extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var CREW_TAG;
   var CONTENT;
   function MP_CREW_TAG()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CREW_TAG = this.CONTENT.attachMovie("CREW_TAG_MOVIECLIP","CREW_TAG_MOVIECLIP",this.CONTENT.getNextHighestDepth(),{_x:0,_y:8,_xscale:70,_yscale:70});
   }
   function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank)
   {
      this.CREW_TAG.SET_CREW_TAG(crewTypeIsPrivate,crewTagContainsRockstar,crewTag,founderOrRank);
   }
   function debug()
   {
      this.SET_CREW_TAG(true,true,"RSG",false);
   }
}
