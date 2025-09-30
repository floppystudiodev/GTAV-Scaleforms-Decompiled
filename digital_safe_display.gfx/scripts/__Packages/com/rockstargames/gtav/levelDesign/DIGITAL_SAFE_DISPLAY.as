class com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var cursorPosition;
   var displays;
   var values;
   static var CHARS = "0123456789EPRON -!*";
   static var SEGS = [119,36,93,109,46,107,123,37,127,111,91,31,159,119,55,0,8,256,512];
   static var NUM_SEGS = 10;
   static var RED = new flash.geom.ColorTransform(0.95,0.29,0.29,1,0,0,0,0);
   static var WHITE = new flash.geom.ColorTransform(1,1,1,1,0,0,0,0);
   static var NUM_DISPLAYS = 3;
   static var STATE_OFF = 0;
   static var STATE_NORMAL = 1;
   static var STATE_ERROR = 2;
   static var STATE_OPEN = 3;
   function DIGITAL_SAFE_DISPLAY()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "DIGITAL_SAFE_DISPLAY";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      this.cursorPosition = -1;
      this.displays = new Array(com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS);
      this.values = new Array(com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS);
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS)
      {
         this.displays[_loc2_] = this.CONTENT["display" + _loc2_];
         this.values[_loc2_] = -1;
         this.setChar(this.CONTENT["bg" + _loc2_].left,"8");
         this.setChar(this.CONTENT["bg" + _loc2_].right,"8");
         _loc2_ = _loc2_ + 1;
      }
      this.restoreView();
   }
   function SET_STATE(state)
   {
      switch(state)
      {
         case com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.STATE_OFF:
            this.show("      ",com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.WHITE);
            return;
         case com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.STATE_ERROR:
            this.show("ERROR!",com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.RED);
            return;
         case com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.STATE_OPEN:
            this.show("*OPEN*",com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.WHITE);
            return;
         default:
            this.restoreView();
            return;
      }
   }
   function SET_CURSOR_POSITION(position)
   {
      this.cursorPosition = this.clamp(position,0,com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS);
      this.restoreView();
   }
   function SET_VALUE(position, value)
   {
      this.values[this.clamp(position,0,com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS)] = this.clamp(value,-1,100);
      this.restoreView();
   }
   function CLEAR_VALUE(position)
   {
      this.values[this.clamp(position,0,com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS)] = -1;
      this.restoreView();
   }
   function show(display, colour)
   {
      this.setChar(this.displays[0].left,display.charAt(0));
      this.setChar(this.displays[0].right,display.charAt(1));
      this.setChar(this.displays[1].left,display.charAt(2));
      this.setChar(this.displays[1].right,display.charAt(3));
      this.setChar(this.displays[2].left,display.charAt(4));
      this.setChar(this.displays[2].right,display.charAt(5));
      this.hideCursor();
      this.CONTENT.transform.colorTransform = colour;
   }
   function hideCursor()
   {
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS)
      {
         this.displays[_loc2_].arrows._visible = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function restoreView()
   {
      var _loc2_ = 0;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_DISPLAYS)
      {
         _loc3_ = this.values[_loc2_] != -1 ? ("0" + this.values[_loc2_]).substr(-2) : "--";
         this.setChar(this.displays[_loc2_].left,_loc3_.charAt(0));
         this.setChar(this.displays[_loc2_].right,_loc3_.charAt(1));
         this.displays[_loc2_].arrows._visible = _loc2_ == this.cursorPosition;
         _loc2_ = _loc2_ + 1;
      }
      this.CONTENT.transform.colorTransform = com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.WHITE;
   }
   function clamp(value, min, max)
   {
      if(value < min)
      {
         return int(min);
      }
      if(value >= max)
      {
         return int(max - 1);
      }
      return int(value);
   }
   function setChar(display, char)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.SEGS[com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.CHARS.indexOf(char)];
      var _loc1_ = 0;
      while(_loc1_ < com.rockstargames.gtav.levelDesign.DIGITAL_SAFE_DISPLAY.NUM_SEGS)
      {
         display["seg" + _loc1_]._visible = _loc2_ & 1 << _loc1_;
         _loc1_ = _loc1_ + 1;
      }
   }
}
