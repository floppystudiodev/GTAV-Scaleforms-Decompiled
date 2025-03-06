class com.rockstargames.gtav.web.buttons.ButtonManager
{
   var toolbarMCList = new Array();
   var buttonMCList = new Array();
   var browserButtonMCList = new Array();
   function ButtonManager()
   {
   }
   function setToolBarList(toolBarMCs)
   {
      this.toolbarMCList = toolBarMCs;
   }
   function updateButtonList(dataArray)
   {
      this.buttonMCList = [];
      var _loc2_ = 0;
      while(_loc2_ < dataArray.length)
      {
         if(dataArray[_loc2_]._name == "btnTxt")
         {
            var _loc3_ = dataArray[_loc2_]._parent;
            this.buttonMCList.push(_loc3_);
            _loc3_.slot = _loc2_;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateBrowserList(dataMC, arrayIndex)
   {
      this.browserButtonMCList[arrayIndex] = dataMC;
   }
   function clearBrowserList()
   {
      this.browserButtonMCList = [];
   }
   function clearEverything()
   {
      this.browserButtonMCList = [];
      this.toolbarMCList = [];
      this.buttonMCList = [];
   }
}
