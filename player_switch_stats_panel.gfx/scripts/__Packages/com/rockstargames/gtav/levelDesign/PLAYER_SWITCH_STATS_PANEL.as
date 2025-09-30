class com.rockstargames.gtav.levelDesign.PLAYER_SWITCH_STATS_PANEL extends com.rockstargames.gtav.levelDesign.BaseScriptUI
{
   var BOUNDING_BOX;
   var CONTENT;
   var panelMC;
   var MAX_STAT_ITEMS = 9;
   var STAT_HEIGHT = 29;
   function PLAYER_SWITCH_STATS_PANEL()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.panelMC = this.CONTENT.panel;
      com.rockstargames.ui.utils.Colour.ApplyHudColour(this.panelMC.bgMC,com.rockstargames.ui.utils.HudColour.HUD_COLOUR_INGAME_BG);
   }
   function SET_STATS_LABELS(charColourEnum)
   {
      var _loc15_ = 2;
      var _loc18_ = arguments.length;
      var _loc14_ = (_loc18_ - _loc15_) / 2;
      var _loc16_ = this.BOUNDING_BOX._height - (6 + _loc14_ * (this.STAT_HEIGHT - 1));
      var _loc5_ = 0;
      var _loc3_;
      var _loc4_;
      var _loc11_;
      var _loc8_;
      var _loc6_;
      var _loc10_;
      var _loc7_;
      var _loc9_;
      while(_loc5_ < this.MAX_STAT_ITEMS)
      {
         _loc3_ = this.panelMC["statMC" + _loc5_];
         if(_loc5_ == 0 && arguments[1])
         {
            _loc3_.statBarMask5MC._visible = false;
            _loc4_ = _loc3_.statBarMask10MC;
            _loc11_ = 9.2;
            _loc8_ = 10;
         }
         else
         {
            _loc3_.statBarMask10MC._visible = false;
            _loc4_ = _loc3_.statBarMask5MC;
            _loc11_ = 20.4;
            _loc8_ = 5;
         }
         if(_loc3_.statBar == undefined)
         {
            _loc3_.attachMovie("GenericColourBar","statBar",_loc3_.getNextHighestDepth(),{_x:_loc4_._x,_y:_loc4_._y});
         }
         _loc6_ = _loc5_ < _loc14_;
         _loc10_ = _loc3_.nameTF;
         _loc7_ = com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(_loc3_.statBar);
         _loc10_._visible = _loc6_;
         _loc7_.mc._visible = _loc4_._visible = _loc6_;
         if(_loc6_)
         {
            com.rockstargames.gtav.pauseMenu.pauseMenuItems.PauseMenuColourBar(_loc3_.statBar).setMask(_loc4_);
            _loc9_ = _loc5_ * 2 + _loc15_;
            _loc7_.init(charColourEnum,_loc4_._width,_loc4_._height);
            _loc7_.percent(com.rockstargames.gtav.utils.GTAVUIUtils.getAdjustedSegmentPct(arguments[_loc9_],_loc11_,2,_loc8_));
            _loc10_.text = arguments[_loc9_ + 1];
            _loc3_._y = _loc16_ + _loc5_ * (this.STAT_HEIGHT - 1);
         }
         _loc5_ = _loc5_ + 1;
      }
      this.panelMC.bgMC._height = _loc14_ * this.STAT_HEIGHT;
      this.panelMC.bgMC._y = this.BOUNDING_BOX._height - this.panelMC.bgMC._height;
   }
   function SHOW()
   {
      this.CONTENT._visible = true;
   }
   function HIDE()
   {
      this.CONTENT._visible = false;
   }
}
