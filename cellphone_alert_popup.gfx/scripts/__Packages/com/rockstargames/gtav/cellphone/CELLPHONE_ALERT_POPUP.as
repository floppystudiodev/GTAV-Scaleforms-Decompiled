class com.rockstargames.gtav.cellphone.CELLPHONE_ALERT_POPUP extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var alert;
   var CONTENT;
   function CELLPHONE_ALERT_POPUP()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.alert = this.CONTENT.createEmptyMovieClip("alert",this.CONTENT.getNextHighestDepth());
   }
   function CREATE_ALERT(iconID, newX, newY, titleString)
   {
      var _loc4_ = iconID;
      var _loc5_ = titleString;
      var _loc3_ = this.alert.getNextHighestDepth();
      var _loc2_ = this.alert.attachMovie("alertDialogBox","alertDialogBox" + _loc3_,_loc3_,{_x:newX,_y:newY});
      if(_loc5_ != undefined)
      {
         _loc2_.alertTitle.text = _loc5_;
      }
      if(_loc4_ != undefined)
      {
         _loc2_.alertIcon.gotoAndStop(com.rockstargames.gtav.cellphone.IconLabels.lookUp(_loc4_)[1]);
      }
   }
   function CLEAR_ALL()
   {
      this.alert.removeMovieClip();
      this.alert = this.CONTENT.createEmptyMovieClip("alert",this.CONTENT.getNextHighestDepth());
   }
}
