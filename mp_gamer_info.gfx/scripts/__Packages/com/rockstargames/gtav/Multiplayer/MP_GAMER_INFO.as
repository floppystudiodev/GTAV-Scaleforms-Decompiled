class com.rockstargames.gtav.Multiplayer.MP_GAMER_INFO extends MovieClip
{
   var TIMELINE;
   var GAMER_NAME;
   var GAMER_NAME_NEARBY;
   var CREW_TAG;
   function MP_GAMER_INFO()
   {
      super();
      this.TIMELINE = this;
      this.GAMER_NAME = this.TIMELINE.GAMERTAG_CENTER.GAMER_NAME;
      this.GAMER_NAME_NEARBY = this.TIMELINE.GAMERTAG_CENTER.GAMER_NAME_NEARBY;
      this.CREW_TAG = com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP(this.attachMovie("CREW_TAG_MOVIECLIP","CREW_TAG_MOVIECLIP",this.getNextHighestDepth(),{_x:0,_y:-60,_xscale:70,_yscale:70}));
      this.TIMELINE.healthArmour._visible = false;
      this.TIMELINE.MP_BAG_LARGE._visible = false;
      this.TIMELINE.MP_TAG_ARROW._visible = false;
      this.TIMELINE.GAMERTAG_CENTER.MP_PHONE._visible = false;
      this.TIMELINE.BIKER_ARROW._visible = false;
      this.TIMELINE.MP_TRANSMITTER._visible = false;
      this.TIMELINE.MP_BOMB._visible = false;
   }
   function SET_GAMERNAME_AND_PACKED_CREW_TAG(gamerName, crewTag)
   {
      this.GAMER_NAME.htmlText = gamerName;
      this.GAMER_NAME.autoSize = true;
      this.GAMER_NAME_NEARBY.htmlText = gamerName;
      this.GAMER_NAME_NEARBY.autoSize = true;
      this.CREW_TAG.UNPACK_CREW_TAG(crewTag);
      this.CREW_TAG._x = (- this.CREW_TAG._width) / 2 + 13;
   }
   function debug()
   {
   }
}
