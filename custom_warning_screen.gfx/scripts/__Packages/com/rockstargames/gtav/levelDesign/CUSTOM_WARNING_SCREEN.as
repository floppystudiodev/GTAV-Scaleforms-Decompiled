class com.rockstargames.gtav.levelDesign.CUSTOM_WARNING_SCREEN extends com.rockstargames.gtav.levelDesign.INSTRUCTIONAL_BUTTONS
{
   var BOUNDING_BOX;
   var CONTENT;
   function CUSTOM_WARNING_SCREEN()
   {
      super();
      this.CONTENT.DividerMC._visible = false;
      this.CONTENT.WarningScreenListMC.reset();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
   }
   function SHOW_CUSTOM_WARNING_SCREEN()
   {
      var _loc12_ = this.CONTENT.HeaderTF;
      var _loc13_ = this.CONTENT.DescriptionTF;
      var _loc10_ = this.CONTENT.WarningScreenListMC;
      var _loc15_ = this.CONTENT.Divider1MC;
      var _loc14_ = this.CONTENT.Divider2MC;
      var _loc11_ = arguments[6];
      var _loc3_;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.CONTENT.HeaderTF,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_YELLOW);
      _loc12_.text = arguments[7];
      _loc13_.text = arguments[8];
      _loc10_.reset();
      _loc3_ = 0;
      while(_loc3_ < _loc11_)
      {
         _loc10_.setItem(arguments[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      var _loc16_ = 10;
      var _loc17_ = 0;
      var _loc6_ = new Array();
      _loc6_.push([_loc12_,5]);
      _loc6_.push([_loc15_,_loc16_]);
      _loc6_.push([_loc13_,_loc16_]);
      _loc6_.push([_loc10_,5]);
      _loc6_.push([_loc14_,0]);
      var _loc9_ = _loc6_.length;
      var _loc7_ = 0;
      _loc3_ = 0;
      var _loc5_;
      while(_loc3_ < _loc9_)
      {
         _loc5_ = _loc6_[_loc3_];
         _loc7_ += _loc5_[0]._height;
         _loc7_ += _loc5_[1];
         _loc3_ = _loc3_ + 1;
      }
      var _loc8_ = (this.BOUNDING_BOX._height - _loc7_) * 0.5;
      _loc3_ = 0;
      var _loc4_;
      while(_loc3_ < _loc9_)
      {
         _loc5_ = _loc6_[_loc3_];
         _loc4_ = _loc5_[0];
         _loc4_._y = _loc8_;
         _loc8_ += _loc4_._height + _loc5_[1];
         _loc3_ = _loc3_ + 1;
      }
      _loc10_.setSelectedItem(0);
      this.CONTENT._visible = true;
      _loc12_._visible = true;
      _loc13_._visible = true;
      _loc15_._visible = true;
      _loc14_._visible = true;
      this.CONTENT.WarningScreenListMC._visible = true;
   }
   function HIDE_CUSTOM_WARNING_SCREEN(msecs)
   {
      this.CONTENT.WarningScreenListMC.reset();
      this.CONTENT._visible = false;
      this.CONTENT.HeaderTF._visible = false;
      this.CONTENT.DescriptionTF._visible = false;
      this.CONTENT.DividerMC._visible = false;
      this.CONTENT.WarningScreenListMC._visible = false;
   }
   function SET_SELECTED_INDEX()
   {
      this.CONTENT.WarningScreenListMC.setSelectedItem(arguments[0] - 1);
   }
   function debug()
   {
      this.CONTENT.HeaderTF.text = "TITLE";
      this.CONTENT.DescriptionTF.text = "MESSASGE";
      this.CONTENT._visible = true;
      this.CONTENT.HeaderTF._visible = true;
      this.CONTENT.DescriptionTF._visible = true;
      this.CONTENT.DividerMC._visible = true;
   }
}
