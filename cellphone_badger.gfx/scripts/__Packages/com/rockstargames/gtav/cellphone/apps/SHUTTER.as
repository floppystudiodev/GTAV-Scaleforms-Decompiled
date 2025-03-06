class com.rockstargames.gtav.cellphone.apps.SHUTTER extends MovieClip
{
   var CONTENT;
   function SHUTTER()
   {
      super();
      this.CONTENT = this;
   }
   function construct()
   {
      _level0.TIMELINE.toggleCellphoneButtonsVisible(false);
   }
   function populateContent()
   {
   }
   function CLEAN_UP_DATA()
   {
   }
   function CLOSE_APP()
   {
      _level0.TIMELINE.toggleCellphoneButtonsVisible(true);
   }
}
