class com.rockstargames.gtav.levelDesign.NAS_UPLOAD extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var currScreen;
   var currScreenID;
   var currentProgress;
   var displayConfig;
   var screenContainer;
   static var STAGE_WIDTH = 2048;
   static var STAGE_HEIGHT = 1152;
   static var STAGE_CENTRE_X = 0.5 * com.rockstargames.gtav.levelDesign.NAS_UPLOAD.STAGE_WIDTH;
   static var STAGE_CENTRE_Y = 0.5 * com.rockstargames.gtav.levelDesign.NAS_UPLOAD.STAGE_HEIGHT;
   var UPLOADING_SCREEN = 0;
   var COMPLETE_SCREEN = 1;
   var WAITING_SCREEN = 2;
   var CODE_SCREEN = 3;
   var SCREEN_CLASSES = [com.rockstargames.gtav.levelDesign.nasUpload.screens.UploadingScreen,com.rockstargames.gtav.levelDesign.nasUpload.screens.CompleteScreen,com.rockstargames.gtav.levelDesign.nasUpload.screens.WaitingScreen,com.rockstargames.gtav.levelDesign.nasUpload.screens.CodeScreen];
   function NAS_UPLOAD()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "NAS_UPLOAD";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.currScreenID = -1;
      this.displayConfig = new com.rockstargames.ui.utils.DisplayConfig();
      com.rockstargames.ui.game.GameInterface.call("SET_DISPLAY_CONFIG",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,this.displayConfig);
      this.screenContainer = this.CONTENT.createEmptyMovieClip("screenContainer",this.CONTENT.getNextHighestDepth());
      this.currentProgress = 0;
   }
   function SHOW_CODE_SCREEN()
   {
      this.showScreen(this.CODE_SCREEN);
   }
   function SHOW_UPLOADING_SCREEN()
   {
      this.showScreen(this.UPLOADING_SCREEN);
   }
   function SHOW_COMPLETE_SCREEN()
   {
      this.showScreen(this.COMPLETE_SCREEN);
   }
   function SHOW_WAITING_SCREEN()
   {
      this.showScreen(this.WAITING_SCREEN);
   }
   function UPDATE_PROGRESS(percentage)
   {
      this.currentProgress = percentage;
      if(this.currScreenID == 0)
      {
         this.currScreen.updateProgress(percentage);
      }
   }
   function GET_CURRENT_SCREEN_ID()
   {
      return this.currScreenID;
   }
   function getCurrentProgress()
   {
      return this.currentProgress;
   }
   function showScreen(screenID, dataObject)
   {
      if(screenID != this.currScreenID)
      {
         if(this.currScreen)
         {
            this.currScreen.dispose();
         }
         this.currScreenID = screenID;
         this.currScreen = new this.SCREEN_CLASSES[screenID](this,this.screenContainer);
      }
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
   static function formatPercentage(value)
   {
      return int(value * 100) / 100 + "%";
   }
   static function formatNumber(value)
   {
      var _loc3_ = Math.abs(int(value)).toString();
      var _loc4_ = _loc3_.length;
      var _loc2_ = 0;
      var _loc1_ = _loc4_ % 3 || 3;
      var _loc5_ = (value >= 0 ? "" : "-") + _loc3_.slice(_loc2_,_loc1_);
      while(_loc1_ < _loc4_)
      {
         _loc2_ = _loc1_;
         _loc1_ += 3;
         _loc5_ += "," + _loc3_.slice(_loc2_,_loc1_);
      }
      return _loc5_;
   }
   static function formatTime(seconds)
   {
      var _loc1_ = seconds % 60;
      var _loc3_ = Math.floor((seconds - _loc1_) / 60) % 60;
      var _loc5_ = Math.floor((seconds - _loc1_ - _loc3_ * 60) / 3600);
      var _loc2_ = ("0" + _loc3_).substr(-2);
      var _loc4_ = ("0" + _loc1_).substr(-2);
      return _loc5_ != 0 ? _loc5_ + ":" + _loc2_ + ":" + _loc4_ : _loc2_ + ":" + _loc4_;
   }
   static function truncate(tf, txt, autoSize, letterSpacing)
   {
      tf.text = txt;
      var _loc3_;
      if(!isNaN(letterSpacing))
      {
         _loc3_ = tf.getTextFormat();
         _loc3_.letterSpacing = letterSpacing;
         tf.setTextFormat(_loc3_);
      }
      var _loc6_;
      var _loc2_;
      if(tf.textWidth > tf._width)
      {
         _loc6_ = tf._width;
         tf.autoSize = autoSize;
         _loc2_ = txt.length;
         while(_loc2_ > 0)
         {
            tf.text = txt.substring(0,_loc2_) + "...";
            if(!isNaN(letterSpacing))
            {
               _loc3_ = tf.getTextFormat();
               _loc3_.letterSpacing = letterSpacing;
               tf.setTextFormat(_loc3_);
            }
            if(tf._width <= _loc6_)
            {
               break;
            }
            _loc2_ = _loc2_ - 1;
         }
         tf.autoSize = "none";
         tf._width = _loc6_;
      }
   }
   static function playSound(soundName, soundSet)
   {
      if(soundSet == undefined)
      {
      }
   }
   static function delegate(scope, method)
   {
      var params = arguments.splice(2,arguments.length - 2);
      var _loc2_ = function()
      {
         method.apply(scope,arguments.concat(params));
      };
      return _loc2_;
   }
}
