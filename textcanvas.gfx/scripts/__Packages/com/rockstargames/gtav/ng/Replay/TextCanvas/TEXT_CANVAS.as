class com.rockstargames.gtav.ng.Replay.TextCanvas.TEXT_CANVAS extends MovieClip
{
   var TIMELINE;
   var _currentTemplate;
   var _currentTemplateId;
   var _customTemplate;
   var _movieHeight;
   var _movieWidth;
   function TEXT_CANVAS()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this._movieWidth = Math.round(this.TIMELINE._width);
      this._movieHeight = Math.round(this.TIMELINE._height);
   }
   function SET_ASPECT_RATIO(xRatio, yRatio)
   {
   }
   function BEGIN_SETUP_TEMPLATE(templateTypeId)
   {
      if(this._currentTemplate)
      {
         this.DISPOSE();
      }
      this._currentTemplateId = templateTypeId;
      this.initCustomTemplate(templateTypeId);
   }
   function UPDATE_PROPERTY()
   {
      var _loc3_ = arguments;
      var _loc5_ = _loc3_[0];
      var _loc4_ = _loc3_[1];
      switch(_loc4_)
      {
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.TEXT:
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.FONT:
            this._currentTemplate.updatePropertyWithString(_loc5_,_loc4_,_loc3_[2]);
            return;
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.POSITION_X:
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.POSITION_Y:
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.SCALE:
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.OPACITY:
         case com.rockstargames.gtav.ng.Replay.TextCanvas.types.PropertyTypes.COLOUR:
            this._currentTemplate.updatePropertyWithNumber(_loc5_,_loc4_,_loc3_[2]);
            return;
         default:
            com.rockstargames.ui.utils.Debug.log("~~ ERROR: TextCanvas couldn\'t match Id: " + _loc4_ + " with data: " + _loc3_[2]);
            return;
      }
   }
   function END_SETUP_TEMPLATE()
   {
   }
   function START_TEMPLATE()
   {
      this._currentTemplate.start();
   }
   function PAUSE_TEMPLATE()
   {
      this._currentTemplate.pause();
   }
   function DISPOSE()
   {
      if(this._currentTemplate)
      {
         this._currentTemplate.dispose();
      }
   }
   function initCustomTemplate(templateTypeId)
   {
      this._customTemplate = com.rockstargames.gtav.ng.Replay.TextCanvas.customtemplates.CustomTemplate(this.TIMELINE.attachMovie("CustomTemplate","CustomTemplate",this.TIMELINE.getNextHighestDepth()));
      this._customTemplate.setDisplayConfig(this._movieWidth,this._movieHeight,0.05,0.95,0.05,0.95,true);
      this._customTemplate.init(templateTypeId);
      this._currentTemplate = this._customTemplate;
   }
}
