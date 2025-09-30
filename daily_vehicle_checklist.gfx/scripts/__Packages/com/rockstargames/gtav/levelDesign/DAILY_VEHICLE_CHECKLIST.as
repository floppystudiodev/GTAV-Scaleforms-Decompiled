class com.rockstargames.gtav.levelDesign.DAILY_VEHICLE_CHECKLIST extends com.rockstargames.ui.core.BaseScreenLayout
{
   var BOUNDING_BOX;
   var CONTENT;
   var TIMELINE;
   var _name;
   var currentVehicle;
   static var LIST_LENGTH = 10;
   function DAILY_VEHICLE_CHECKLIST()
   {
      super();
      _global.gfxExtensions = true;
      this._name = "DAILY_VEHICLE_CHECKLIST";
   }
   function initialise(mc)
   {
      this.TIMELINE = mc;
      this.BOUNDING_BOX = this.TIMELINE.attachMovie("BOUNDING_BOX","BOUNDING_BOX",this.TIMELINE.getNextHighestDepth());
      this.BOUNDING_BOX._visible = false;
      this.CONTENT = this.TIMELINE.attachMovie("CONTENT","CONTENT",this.TIMELINE.getNextHighestDepth());
      com.rockstargames.gtav.levelDesign.DAILY_VEHICLE_CHECKLIST.setLocalisedText(this.CONTENT.header.textField,"DVC_HEADER");
      var _loc2_ = 0;
      var _loc4_;
      var _loc3_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.DAILY_VEHICLE_CHECKLIST.LIST_LENGTH)
      {
         _loc4_ = this.CONTENT["vehicleText_" + _loc2_].textField;
         _loc3_ = this.CONTENT["vehicleText_" + _loc2_].crossoutLines;
         _loc4_._visible = false;
         _loc3_.line1._visible = false;
         _loc3_.line2._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.currentVehicle = 0;
   }
   function ADD_VEHICLE(vehicleName, checkedOff)
   {
      var _loc2_ = this.CONTENT["vehicleText_" + this.currentVehicle].textField;
      var _loc3_ = this.CONTENT["vehicleText_" + this.currentVehicle].crossoutLines;
      _loc2_.text = vehicleName.toUpperCase();
      _loc2_._visible = true;
      this.initStrikethrough(_loc3_,_loc2_,checkedOff);
      this.currentVehicle = this.currentVehicle + 1;
      if(this.currentVehicle > 9)
      {
         this.currentVehicle = 0;
      }
   }
   function initStrikethrough(crossoutLines, textField, isVisible)
   {
      var _loc3_;
      var _loc1_;
      var _loc2_;
      if(isVisible && textField.length > 0)
      {
         _loc3_ = textField.bottomScroll;
         _loc1_ = 1;
         while(_loc1_ <= 2)
         {
            _loc2_ = crossoutLines["line" + _loc1_];
            _loc2_._visible = _loc1_ <= _loc3_;
            _loc1_ = _loc1_ + 1;
         }
      }
      else
      {
         crossoutLines.line1._visible = false;
         crossoutLines.line2._visible = false;
      }
   }
   function CLEAR_ALL_VEHICLES()
   {
      var _loc2_ = 0;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.DAILY_VEHICLE_CHECKLIST.LIST_LENGTH)
      {
         _loc3_ = this.CONTENT["vehicleText_" + _loc2_].textField;
         _loc4_ = this.CONTENT["vehicleText_" + _loc2_].crossoutLines;
         _loc3_.text = "";
         _loc3_._visible = false;
         _loc4_.line1._visible = false;
         _loc4_.line2._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      this.currentVehicle = 0;
   }
   static function setLocalisedText(tf, label)
   {
      com.rockstargames.ui.game.GameInterface.call("SET_TEXT_WITH_TRANSLATION",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,label,tf,tf.html);
      return tf.text;
   }
}
