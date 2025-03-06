class com.rockstargames.gtav.Multiplayer.PLAYER_NAME extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var TIMELINE;
   var CONTENT;
   var _speakerContainer;
   function PLAYER_NAME()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this._speakerContainer = this.CONTENT.speakerContainer;
   }
   function SET_PLAYER_NAME(str)
   {
      this.CONTENT.playerNameTF.htmlText = str;
      this.CONTENT.playerNameTF.autoSize = "center";
      this.CONTENT.playerNameOutlineTF.htmlText = str;
      this.CONTENT.playerNameOutlineTF.autoSize = "center";
      this._speakerContainer._x = this.CONTENT.playerNameTF._x - this._speakerContainer._width;
   }
   function SET_SPEAKER_STATE(state)
   {
      if(state >= 1 && state <= 4)
      {
         this._speakerContainer.gotoAndStop(state);
      }
   }
   function debug()
   {
      this.SET_PLAYER_NAME("cheesewhisk");
   }
}
