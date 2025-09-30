class com.rockstargames.gtav.levelDesign.TEXT_INPUT_BOX extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
   var CONTENT;
   var TIMELINE;
   var bTrackCursorDrag;
   var bTrackCursorLoc;
   var cursorLocations;
   var lastTrackedCursorLocation;
   function TEXT_INPUT_BOX()
   {
      super();
      _global.gfxExtensions = true;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.CONTENT.InputTF.text = "";
      this.CONTENT.TitleTF.text = "";
      this.CONTENT.DescriptionTF.text = "";
      this.CONTENT._visible = false;
      Mouse.addListener(this);
      Selection.setFocus(this.CONTENT.InputTF);
      this.lastTrackedCursorLocation = 0;
      this.bTrackCursorLoc = false;
      this.bTrackCursorDrag = false;
      this.cursorLocations = new Object();
   }
   function SET_TEXT_BOX()
   {
      this.CONTENT._visible = true;
      var _loc4_ = this.CONTENT.TitleTF;
      var _loc5_ = this.CONTENT.DescriptionTF;
      var _loc3_ = this.CONTENT.InputTF;
      _loc4_.text = arguments[0];
      _loc5_.text = arguments[1];
      _loc3_.text = arguments[2];
      _loc3_.scroll = _loc3_.maxscroll;
      this.clearCursorHistory();
   }
   function SET_MULTI_LINE()
   {
      this.CONTENT._visible = true;
      if(arguments[0])
      {
         this.CONTENT.InputTF._height = 130;
         this.CONTENT.Panel_BG._height = 172;
         this.CONTENT.Input_BG._height = 132;
      }
      else
      {
         this.CONTENT.InputTF._height = 20;
         this.CONTENT.Panel_BG._height = 64;
         this.CONTENT.Input_BG._height = 24;
      }
   }
   function UPDATE_DISPLAY_PARAMS()
   {
      this.CONTENT._visible = true;
      var _loc3_ = arguments[0];
      var _loc4_ = arguments[1];
      this.TIMELINE._x = 0;
      this.TIMELINE._y = 0;
      this.TIMELINE._width = _loc3_;
      this.TIMELINE._height = _loc4_;
   }
   function UPDATE_INPUT(text, cursorLocation)
   {
      this.CONTENT._visible = true;
      var _loc2_ = this.CONTENT.InputTF;
      _loc2_.text = text;
      _loc2_.scroll = _loc2_.maxscroll;
      this.SET_CURSOR_LOCATION(cursorLocation);
      this.clearCursorHistory();
   }
   function SET_CURSOR_LOCATION(cursorLocation)
   {
      this.lastTrackedCursorLocation = cursorLocation;
      Selection.setSelection(cursorLocation,cursorLocation);
   }
   function CLEANUP()
   {
      Mouse.removeListener(this);
   }
   function HANDLE_KEY_PRESS(key)
   {
      var _loc4_ = 0;
      switch(key)
      {
         case 38:
            _loc4_ = -1;
            break;
         case 40:
            _loc4_ = 1;
            break;
         default:
            this.clearCursorHistory();
      }
      var _loc3_;
      var _loc2_;
      var _loc8_;
      var _loc5_;
      var _loc6_;
      var _loc7_;
      var _loc9_;
      if(_loc4_ != 0)
      {
         _loc3_ = this.CONTENT.InputTF;
         _loc2_ = _loc3_.getExactCharBoundaries(this.lastTrackedCursorLocation);
         _loc8_ = _loc2_.height;
         _loc6_ = _loc3_.getLineIndexAtPoint(_loc2_.x,_loc2_.y);
         if(this.cursorLocations[_loc6_ + _loc4_])
         {
            _loc5_ = this.cursorLocations[_loc6_ + _loc4_];
         }
         else
         {
            _loc7_ = _loc3_.getCharIndexAtPoint(_loc2_.x,_loc2_.y + _loc8_ * 0.5 + _loc4_ * _loc8_);
            _loc5_ = _loc7_;
            if(_loc5_ == -1)
            {
               if(key == 40 && _loc3_.numLines > 1)
               {
                  _loc5_ = _loc3_.length;
               }
            }
            else
            {
               _loc9_ = _loc3_.getExactCharBoundaries(_loc7_);
               if(_loc2_.x > _loc9_.x + _loc9_.width * 0.5)
               {
                  _loc5_ += 1;
               }
            }
         }
         if(_loc5_ != -1)
         {
            this.cursorLocations[_loc6_] = this.lastTrackedCursorLocation;
            this.SET_CURSOR_LOCATION(_loc5_);
            this.dispatchCursorLocationChange(true);
         }
      }
   }
   function clearCursorHistory()
   {
      this.cursorLocations = new Object();
   }
   function onMouseDown()
   {
      this.bTrackCursorDrag = true;
      this.dispatchCursorLocationChange();
   }
   function onMouseUp()
   {
      this.bTrackCursorDrag = false;
   }
   function onMouseMove()
   {
      if(this.bTrackCursorDrag)
      {
         this.dispatchCursorLocationChange();
      }
   }
   function dispatchCursorLocationChange(bForceDispatch)
   {
      var _loc2_ = Selection.getCaretIndex();
      if(bForceDispatch || _loc2_ != -1 && this.lastTrackedCursorLocation != _loc2_)
      {
         com.rockstargames.ui.game.GameInterface.call("CURSOR_LOCATION_CHANGED",com.rockstargames.ui.game.GameInterface.SF_BASE_CLASS_TEXT_INPUT,_loc2_);
         this.lastTrackedCursorLocation = _loc2_;
      }
   }
}
