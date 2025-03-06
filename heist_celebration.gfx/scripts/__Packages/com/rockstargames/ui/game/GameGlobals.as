class com.rockstargames.ui.game.GameGlobals
{
   static var CELEBRATION_SCREEN = 10;
   function GameGlobals()
   {
   }
   static function setGlobalFlag(globalFlagID, value)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_GLOBAL_ACTIONSCRIPT_FLAG",com.rockstargames.ui.game.GameInterface.SCRIPT_TYPE,globalFlagID,value);
   }
}
