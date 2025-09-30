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
      founderOrRank = Number(founderOrRank);
      var _loc4_ = ["","","&","{","|","}","~","â‚¬"];
      var _loc6_ = ["","","&","Ã€","Ã","Ã‚","Ãƒ","Ã„"];
      if(crewTypeIsPrivate)
      {
         this.CREW_TAG.midgroundTF.htmlText = ".";
         this.CREW_TAG.backgroundTF.htmlText = "/";
         this.CREW_TAG.rankOrFounderTF.htmlText = _loc4_[founderOrRank];
         if(crewColour != undefined)
         {
            this.CREW_TAG.rankOrFounderTF._visible = true;
            this.CREW_TAG.rankOrFounderTF.textColor = crewColour;
         }
         else
         {
            this.CREW_TAG.rankOrFounderTF._visible = false;
         }
      }
      else
      {
         this.CREW_TAG.midgroundTF.htmlText = ",";
         this.CREW_TAG.backgroundTF.htmlText = "-";
         this.CREW_TAG.rankOrFounderTF._visible = false;
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
   }
   function UNPACK_CREW_TAG(crewStr)
   {
      var _loc5_ = crewStr.charAt(0) != "(" ? false : true;
      var _loc6_ = crewStr.charAt(1) != "*" ? false : true;
      var _loc7_ = crewStr.slice(3);
      var _loc3_ = _loc7_.split("#");
      var _loc4_ = 0;
      if(crewStr.charAt(2) == "+")
      {
         _loc4_ = 1;
      }
      else if(crewStr.charAt(2) == "_")
      {
         _loc4_ = 0;
      }
      else
      {
         _loc4_ = Number(crewStr.charAt(2));
      }
      com.rockstargames.ui.utils.Debug.log("WHOLE MESS OF COLOR JUST HAPPENED: " + _loc3_[0] + ", " + "0x" + _loc3_[1]);
      this.SET_CREW_TAG(_loc5_,_loc6_,_loc3_[0],_loc4_,"0x" + _loc3_[1]);
   }
   function debug()
   {
      this.SET_CREW_TAG(false,true,"RSG",false);
   }
}
