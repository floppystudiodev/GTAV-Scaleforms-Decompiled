class com.rockstargames.ui.core.BrowserUIComponent extends MovieClip
{
   var dataProviderUI;
   var linkageKey;
   var container;
   var _numberOfColumns;
   var _numberOfVisibleRows;
   var _offsetX;
   var _offsetY;
   var _primaryColour;
   var _secondaryColour;
   var _levelDepth;
   var _rowSpace = 0;
   var _currentSelection = -1;
   var _columnSpace = 0;
   function BrowserUIComponent()
   {
      super();
      this.dataProviderUI = new Array();
   }
   function construct(parentContainer, linkageID, params)
   {
      this.linkageKey = linkageID;
      if(this.container)
      {
         this.container.removeMovieClip();
      }
      this.container = parentContainer.createEmptyMovieClip("container",parentContainer.getNextHighestDepth());
      this.container._x = 0;
      if(params.numberOfColumns)
      {
         this.numberOfColumns = params.numberOfColumns;
      }
      if(params.numberOfVisibleRows)
      {
         this.numberOfVisibleRows = params.numberOfVisibleRows;
      }
      if(params.rowSpace)
      {
         this.rowSpace = params.rowSpace;
      }
      if(params.dataProviderUI)
      {
         this.dataProviderUI = params.dataProviderUI;
      }
      if(params.offsetX)
      {
         this.offsetX = params.offsetX;
      }
      if(params.offsetY)
      {
         this.offsetY = params.offsetY;
      }
      if(params.primaryColour)
      {
         this.primaryColour = params.primaryColour;
      }
      if(params.secondaryColour)
      {
         this.secondaryColour = params.secondaryColour;
      }
      if(params.levelDepth)
      {
         this.levelDepth = params.levelDepth;
      }
      if(params.columnSpace)
      {
         this.columnSpace = params.columnSpace;
      }
   }
   function renderContainers()
   {
   }
   function navigate(direction)
   {
   }
   function setState(item, isActive)
   {
   }
   function SHOW()
   {
      this.container._visible = true;
   }
   function HIDE()
   {
      this.container._visible = false;
   }
   function get numberOfColumns()
   {
      return this._numberOfColumns;
   }
   function set numberOfColumns(newNumberOfColumns)
   {
      this._numberOfColumns = newNumberOfColumns;
   }
   function get numberOfVisibleRows()
   {
      return this._numberOfVisibleRows;
   }
   function set numberOfVisibleRows(newNumberOfVisibleRows)
   {
      this._numberOfVisibleRows = newNumberOfVisibleRows;
   }
   function get rowSpace()
   {
      return this._rowSpace;
   }
   function set rowSpace(newRowSpace)
   {
      this._rowSpace = newRowSpace;
   }
   function get offsetX()
   {
      return this._offsetX;
   }
   function set offsetX(newOffsetX)
   {
      this._offsetX = newOffsetX;
   }
   function get offsetY()
   {
      return this._offsetY;
   }
   function set offsetY(newOffsetY)
   {
      this._offsetY = newOffsetY;
   }
   function get primaryColour()
   {
      return this._primaryColour;
   }
   function set primaryColour(newPrimaryColour)
   {
      this._primaryColour = newPrimaryColour;
   }
   function get secondaryColour()
   {
      return this._secondaryColour;
   }
   function set secondaryColour(newSecondaryColour)
   {
      this._secondaryColour = newSecondaryColour;
   }
   function get levelDepth()
   {
      return this._levelDepth;
   }
   function set levelDepth(newLevelDepth)
   {
      this._levelDepth = newLevelDepth;
   }
   function get columnSpace()
   {
      return this._columnSpace;
   }
   function set columnSpace(newColumnSpace)
   {
      this._columnSpace = newColumnSpace;
   }
   function get currentSelection()
   {
      return this._currentSelection;
   }
   function set currentSelection(newCurrentSelection)
   {
      this._currentSelection = newCurrentSelection;
   }
}
