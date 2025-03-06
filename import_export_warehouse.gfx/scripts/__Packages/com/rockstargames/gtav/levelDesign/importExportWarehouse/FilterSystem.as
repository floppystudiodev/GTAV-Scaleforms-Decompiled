class com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem
{
   var _view;
   var _hasFilterBeenSet;
   var _allFilterButtons;
   var _buttonsDataStructure;
   var _allFilterOptionButtons;
   var _filterOptionsDataStructure;
   var _filterOptionsBg;
   var _currentFilterFlag;
   var _activeTab;
   var _currentSortOrder;
   var _currentSortIndex;
   var _currentSortField;
   static var INDEX_VALUE = 0;
   static var INDEX_NAME = 1;
   static var INDEX_CLASS = 2;
   static var INDEX_POSITION = 3;
   static var INDEX_DRIVERS = 4;
   static var INDEX_COMPLETION = 5;
   static var FILTER_OPTIONS_BG_HEIGHT_EXPORT = 183;
   static var FILTER_OPTIONS_BG_HEIGHT_COLLECTION = 227;
   var _filterLabels = ["IEW_FILTER_VALUE","IEW_FILTER_NAME","IEW_FILTER_RANGE","IEW_FILTER_POSITION","IEW_FILTER_DRIVERS","IEW_FILTER_COMPLETION"];
   function FilterSystem(view)
   {
      this._view = view;
      this.init();
   }
   function init()
   {
      this._hasFilterBeenSet = false;
      this._allFilterButtons = [];
      this._allFilterButtons[0] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(-1,this._view.filterButton0,"IEW_FILTER_VALUE",true);
      this._allFilterButtons[1] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(-1,this._view.filterButton1,"IEW_FILTER_VALUE",true);
      this._allFilterButtons[2] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(-1,this._view.filterButton2,"IEW_FILTER_VALUE",true);
      this._allFilterButtons[3] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(-1,this._view.filterButton3,"IEW_FILTER_VALUE",true);
      this._buttonsDataStructure = [[],[]];
      this._buttonsDataStructure[com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB] = [{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_VALUE,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_VALUE]},{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_NAME,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_NAME]},{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_CLASS,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_CLASS]},{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_POSITION,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_POSITION]}];
      this._buttonsDataStructure[com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB] = [{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_VALUE,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_VALUE]},{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_NAME,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_NAME]},{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_DRIVERS,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_DRIVERS]},{id:com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_COMPLETION,labelToken:this._filterLabels[com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.INDEX_COMPLETION]}];
      this._allFilterOptionButtons = [];
      this._allFilterOptionButtons[0] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_NONE,this._view.filterOptionNone,"IEW_FILTER_OPTION_NONE");
      this._allFilterOptionButtons[1] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_0,this._view.filterOption0,"IEW_FILTER_OPTION_NONE");
      this._allFilterOptionButtons[2] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_1,this._view.filterOption1,"IEW_FILTER_OPTION_NONE");
      this._allFilterOptionButtons[3] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_2,this._view.filterOption2,"IEW_FILTER_OPTION_NONE");
      this._allFilterOptionButtons[4] = new com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_3,this._view.filterOption3,"IEW_FILTER_OPTION_NONE");
      this._filterOptionsDataStructure = [[],[]];
      this._filterOptionsDataStructure[com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_EXPORT_TAB] = [{labelToken:"IEW_FILTER_OPTION_NONE",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.NONE},{labelToken:"IEW_FILTER_OPTION_RANGE_TOP",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.RANGE_TOP},{labelToken:"IEW_FILTER_OPTION_RANGE_MID",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.RANGE_MID},{labelToken:"IEW_FILTER_OPTION_RANGE_STANDARD",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.RANGE_STANDARD}];
      this._filterOptionsDataStructure[com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_COLLECTION_TAB] = [{labelToken:"IEW_FILTER_OPTION_NONE",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.NONE},{labelToken:"IEW_FILTER_OPTION_2_DRIVERS",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.TWO_DRIVERS},{labelToken:"IEW_FILTER_OPTION_3_DRIVERS",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.THREE_DRIVERS},{labelToken:"IEW_FILTER_OPTION_4_DRIVERS",filter:com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.FOUR_DRIVERS}];
      this._filterOptionsBg = this._view.filterOptionsBg;
      this._filterOptionsBg._height = com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterSystem.FILTER_OPTIONS_BG_HEIGHT_EXPORT;
      this.showFilterOptions(false);
      this._currentFilterFlag = com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.NONE;
   }
   function setTab(index)
   {
      this._view._visible = index != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB;
      if(index != com.rockstargames.gtav.levelDesign.importExportWarehouse.WarehouseScreen.ID_BUYERS_TAB)
      {
         var _loc2_ = 0;
         var _loc6_ = this._allFilterButtons.length;
         while(_loc2_ < _loc6_)
         {
            com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(this._allFilterButtons[_loc2_]).setId(this._buttonsDataStructure[index][_loc2_].id);
            com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(this._allFilterButtons[_loc2_]).setLabel(this._buttonsDataStructure[index][_loc2_].labelToken);
            _loc2_ = _loc2_ + 1;
         }
         var _loc3_ = 0;
         var _loc5_ = this._allFilterOptionButtons.length;
         while(_loc3_ < _loc5_)
         {
            if(this._filterOptionsDataStructure[index][_loc3_])
            {
               com.rockstargames.gtav.levelDesign.importExportWarehouse.Button(this._allFilterOptionButtons[_loc3_]).setLabel(this._filterOptionsDataStructure[index][_loc3_].labelToken);
            }
            _loc3_ = _loc3_ + 1;
         }
         this._activeTab = index;
         this.setFilter(com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_NONE);
      }
   }
   function openFilterOptions(selection)
   {
      this.showFilterOptions(true);
   }
   function setFilter(newFilterSelection)
   {
      switch(newFilterSelection)
      {
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_DRIVERS:
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_CLASS:
            this._hasFilterBeenSet = false;
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_NONE:
            this._currentFilterFlag = this._filterOptionsDataStructure[this._activeTab][0].filter;
            this._hasFilterBeenSet = true;
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_0:
            this._currentFilterFlag = this._filterOptionsDataStructure[this._activeTab][1].filter;
            this._hasFilterBeenSet = true;
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_1:
            this._currentFilterFlag = this._filterOptionsDataStructure[this._activeTab][2].filter;
            this._hasFilterBeenSet = true;
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_2:
            this._currentFilterFlag = this._filterOptionsDataStructure[this._activeTab][3].filter;
            this._hasFilterBeenSet = true;
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_OPTION_3:
            this._currentFilterFlag = this._filterOptionsDataStructure[this._activeTab][4].filter;
            this._hasFilterBeenSet = true;
      }
      this.showFilterOptions(false);
      this.updateButtons();
   }
   function setSortOrder(newSortSelection)
   {
      switch(newSortSelection)
      {
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_VALUE:
            this._currentSortOrder = !(this._currentSortOrder == Array.NUMERIC && this._currentSortIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_VALUE) ? Array.NUMERIC : Array.NUMERIC | Array.DESCENDING;
            this._currentSortField = "value";
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_NAME:
            this._currentSortOrder = !(this._currentSortOrder == Array.CASEINSENSITIVE && this._currentSortIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_NAME) ? Array.CASEINSENSITIVE : Array.CASEINSENSITIVE | Array.DESCENDING;
            this._currentSortField = "name";
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_POSITION:
            this._currentSortOrder = !(this._currentSortOrder == Array.NUMERIC && this._currentSortIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_POSITION) ? Array.NUMERIC : Array.NUMERIC | Array.DESCENDING;
            this._currentSortField = "warehousePosition";
            break;
         case com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_COMPLETION:
            this._currentSortOrder = !(this._currentSortOrder == Array.NUMERIC && this._currentSortIndex == com.rockstargames.gtav.levelDesign.importExportWarehouse.ButtonId.FILTER_BUTTON_COMPLETION) ? Array.NUMERIC : Array.NUMERIC | Array.DESCENDING;
            this._currentSortField = "completion";
      }
      this._currentSortIndex = newSortSelection;
      this.updateButtons();
   }
   function updateButtons()
   {
      var _loc4_ = 2;
      var _loc2_ = 0;
      var _loc3_ = this._allFilterButtons.length;
      while(_loc2_ < _loc3_)
      {
         if(_loc2_ != _loc4_)
         {
            if(this._allFilterButtons[_loc2_].id == this._currentSortIndex)
            {
               this._allFilterButtons[_loc2_].view.gotoAndStop("on");
            }
            else
            {
               this._allFilterButtons[_loc2_].view.gotoAndStop("off");
            }
         }
         _loc2_ = _loc2_ + 1;
      }
      this._allFilterButtons[_loc4_].view.gotoAndStop(this._currentFilterFlag != com.rockstargames.gtav.levelDesign.importExportWarehouse.FilterFlags.NONE ? "on" : "off");
   }
   function showFilterOptions(value)
   {
      var _loc2_ = 0;
      var _loc3_ = this._allFilterOptionButtons.length;
      while(_loc2_ < _loc3_)
      {
         if(this._filterOptionsDataStructure[this._activeTab][_loc2_])
         {
            this._allFilterOptionButtons[_loc2_].view._visible = value;
         }
         else
         {
            this._allFilterOptionButtons[_loc2_].view._visible = false;
         }
         _loc2_ = _loc2_ + 1;
      }
      this._filterOptionsBg._visible = value;
   }
   function get buttons()
   {
      return this._allFilterButtons;
   }
   function get filterOptionButtons()
   {
      var _loc3_ = [];
      var _loc2_ = 0;
      while(_loc2_ < this._allFilterOptionButtons.length)
      {
         if(this._allFilterOptionButtons[_loc2_].view._visible)
         {
            _loc3_.push(this._allFilterOptionButtons[_loc2_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_.concat(this._allFilterButtons[2]);
   }
   function get currentFilterFlag()
   {
      return this._currentFilterFlag;
   }
   function get currentSortIndex()
   {
      return this._currentSortIndex;
   }
   function get currentSortOrder()
   {
      return this._currentSortOrder;
   }
   function get currentSortField()
   {
      return this._currentSortField;
   }
   function get areFilterOptionsShowing()
   {
      return this._filterOptionsBg._visible;
   }
}
