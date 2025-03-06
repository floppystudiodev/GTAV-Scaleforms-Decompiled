class com.rockstargames.gtav.Multiplayer.MP_UNLOCKS_FREEMODE extends com.rockstargames.gtav.Multiplayer.MP_AWARD_BASE
{
   var TIMELINE;
   var FILE_NAME;
   var CONTENT;
   function MP_UNLOCKS_FREEMODE()
   {
      super();
   }
   function INITIALISE(mc, fileName)
   {
      this.TIMELINE = mc;
      this.FILE_NAME = fileName;
      this.CONTENT = this.TIMELINE.attachMovie("GENERIC_SECONDARY_INFO","GENERIC_SECONDARY_INFO",10);
      this.CONTENT._x = 640;
      this.CONTENT.BLACK_BAR._visible = false;
      this.CONTENT.line_top._visible = false;
      this.CONTENT.line_bottom._visible = false;
   }
   function RESET_AWARDS_MOVIE()
   {
      if(typeof this.CONTENT == "movieclip")
      {
         this.CONTENT.removeMovieClip();
         this.INITIALISE(this.TIMELINE,this.FILE_NAME);
      }
   }
   function SHOW_UNLOCK_AND_MESSAGE(awTitle, awDesc, txd, texture, awDesc2, colEnum)
   {
      this.CONTENT.BIG_TEXT.htmlText = awTitle;
      this.CONTENT.MESSAGE_TEXT.autoSize = "center";
      this.CONTENT.MESSAGE_TEXT.htmlText = awDesc;
      if(awDesc2 != undefined && awDesc2 != "")
      {
         this.CONTENT.INFO_TEXT.htmlText = awDesc2;
         this.CONTENT.BLACK_BAR._height = 52;
         var _loc3_ = Math.max(this.CONTENT.INFO_TEXT.textWidth,this.CONTENT.MESSAGE_TEXT.textWidth);
         this.CONTENT.BLACK_BAR._width = _loc3_ + 100;
      }
      else
      {
         this.CONTENT.BLACK_BAR._width = this.CONTENT.MESSAGE_TEXT.textWidth + 100;
         this.CONTENT.BLACK_BAR._height = this.CONTENT.MESSAGE_TEXT.textHeight + 10;
      }
      this.CONTENT.line_top._width = this.CONTENT.BLACK_BAR._width;
      this.CONTENT.line_bottom._width = this.CONTENT.BLACK_BAR._width;
      this.CONTENT.line_bottom._y = this.CONTENT.BLACK_BAR._height + this.CONTENT.BLACK_BAR._y;
      this.CONTENT.BLACK_BAR._visible = true;
      this.CONTENT.line_top._visible = true;
      this.CONTENT.line_bottom._visible = true;
   }
   function SHOW_COLLECTION_PROGRESS(title, completed, totalToDo, message, info)
   {
      var _loc2_ = String(completed) + " / " + String(totalToDo) + " " + info;
      this.SHOW_UNLOCK_AND_MESSAGE(title,message,"","",_loc2_);
   }
   function SHOW_BRIDGES_KNIVES_PROGRESS(title, totalToDo, message, info, completed)
   {
      var _loc2_ = String(completed) + " / " + String(totalToDo) + " " + info;
      this.SHOW_UNLOCK_AND_MESSAGE(title,message,"","",_loc2_);
   }
   function debug()
   {
   }
}
