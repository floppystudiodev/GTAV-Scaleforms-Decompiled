class com.rockstargames.gtav.Multiplayer.CREW_TAG_MOVIECLIP extends MovieClip
{
   var CREW_TAG;
   function CREW_TAG_MOVIECLIP()
   {
      super();
      this.CREW_TAG = this;
   }
   function SET_CREW_TAG(crewTypeIsPrivate, crewTagContainsRockstar, crewTag, founderOrRank, crewColour)
   {
      if(founderOrRank == "n" || founderOrRank == undefined)
      {
         founderOrRank = 5;
      }
      founderOrRank = Number(founderOrRank);
      crewColour = Number(crewColour);
      var _loc6_ = [String.fromCharCode(8364),"Â£","}","|","{",""];
      if(crewTypeIsPrivate)
      {
         this.CREW_TAG.midgroundTF.htmlText = ".";
         this.CREW_TAG.backgroundTF.htmlText = "/";
         this.CREW_TAG.rankOrFounderTF.htmlText = _loc6_[founderOrRank];
      }
      else
      {
         this.CREW_TAG.midgroundTF.htmlText = ",";
         this.CREW_TAG.backgroundTF.htmlText = "-";
      }
      if(crewTagContainsRockstar)
      {
         crewTag = "@" + crewTag;
      }
      else
      {
         crewTag = "" + crewTag;
      }
      crewTag = "" + crewTag;
      this.CREW_TAG.crewTagTF.htmlText = crewTag;
      var _loc4_ = this.CREW_TAG.rankOrFounderTF.getTextFormat();
      _loc4_.color = Number(crewColour);
      this.CREW_TAG.rankOrFounderTF.setTextFormat(_loc4_);
   }
   function UNPACK_CREW_TAG(crewStr)
   {
      var _loc5_ = crewStr.charAt(0) != "(" ? false : true;
      var _loc6_ = crewStr.charAt(1) != "*" ? false : true;
      var _loc7_ = crewStr.slice(3);
      var _loc4_ = _loc7_.split("#");
      var _loc3_ = 0;
      if(crewStr.charAt(2) == "+")
      {
         _loc3_ = 1;
      }
      else if(crewStr.charAt(2) == "_")
      {
         _loc3_ = 0;
      }
      else
      {
         _loc3_ = Number(crewStr.charAt(2));
      }
      this.SET_CREW_TAG(_loc5_,_loc6_,_loc4_[0],_loc3_,"0x" + _loc4_[1]);
   }
   function debug()
   {
      this.SET_CREW_TAG(false,true,"RSG",false);
   }
}
