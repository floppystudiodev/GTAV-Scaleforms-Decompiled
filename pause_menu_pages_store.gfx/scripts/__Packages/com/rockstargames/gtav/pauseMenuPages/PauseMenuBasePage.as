class com.rockstargames.gtav.pauseMenuPages.PauseMenuBasePage extends MovieClip
{
   var timelineMC;
   var pageMC;
   var columnList = new Array();
   function PauseMenuBasePage()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.timelineMC = mc;
      this.columnList = new Array();
   }
   function setupPage()
   {
      if(this.pageMC != undefined)
      {
         this.pageMC.removeMovieClip();
      }
      this.pageMC = this.timelineMC.createEmptyMovieClip("pageMC",1);
   }
   function setupColumns()
   {
      var _loc3_ = 0;
      while(_loc3_ < arguments.length)
      {
         var _loc4_ = arguments[_loc3_];
         _loc4_.INITIALISE();
         this.columnList[_loc3_] = _loc4_;
         _loc3_ = _loc3_ + 1;
      }
      this.hideColumns();
   }
   function setScaledContent()
   {
   }
   function setDisplayConfig()
   {
   }
   function setupScroll(visible, columnIndex, columns, scrollType, arrowPosition, override, columnXOffset)
   {
      var _loc2_ = this["column" + columnIndex];
      _loc2_.INIT_SCROLL_BAR(visible,columns,scrollType,arrowPosition,override,columnXOffset);
   }
   function stateChanged(id)
   {
      this.hideColumns();
   }
   function addColumn(linkageID, depth, xpos)
   {
      var _loc2_ = this.pageMC.attachMovie(linkageID,"c" + depth + "MC",depth,{_x:xpos});
      return com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase(_loc2_);
   }
   function getColumn(i)
   {
      return com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase(this.columnList[i]);
   }
   function getMaxColumns()
   {
      return this.columnList.length;
   }
   function hideColumns()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.columnList.length)
      {
         var _loc3_ = this.columnList[_loc2_];
         _loc3_._visible = false;
         _loc3_.columnID = -1;
         _loc2_ = _loc2_ + 1;
      }
      this.columnList = [];
   }
   function showColumns()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.columnList.length)
      {
         var _loc3_ = this.columnList[_loc2_];
         _loc3_._visible = true;
         _loc3_.columnID = _loc2_;
         _loc2_ = _loc2_ + 1;
      }
   }
   function onPageExit()
   {
      var _loc3_ = this.columnList.length;
      var _loc2_ = 0;
      while(_loc2_ < _loc3_)
      {
         com.rockstargames.gtav.pauseMenu.pauseComponents.PauseMenuComponentBase(this.columnList[_loc2_]).ON_DESTROY();
         _loc2_ = _loc2_ + 1;
      }
   }
}
