class com.rockstargames.gtav.levelDesign.BANK_JOB_LOGIN extends com.rockstargames.ui.core.BaseScreenLayout
{
   var TIMELINE;
   var BOUNDING_BOX;
   var CONTENT;
   var loginView;
   function BANK_JOB_LOGIN()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "BANK_JOB_LOGIN";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.loginView = this.CONTENT.attachMovie("loginScreen","loginScreen",this.CONTENT.getNextHighestDepth());
      this.loginView.title.verticalAlign = "center";
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HTD_LOGIN_TITLE",this.loginView.title,false);
      com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Hand_Scanner","DLC_BTL_Hacker_Truck_Computer_Sounds");
   }
}
