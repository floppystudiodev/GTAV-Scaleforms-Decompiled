class com.rockstargames.gtav.levelDesign.islandHeistBoard.data.HeistData
{
   var tabLabels;
   var tabsLocked;
   var intelItem;
   var prepItem;
   var finaleItem;
   var initialView;
   var isHardMode;
   var payoutsVisible;
   var mainPayout;
   var subPayout;
   var crew;
   var icons;
   var launchButtonEnabled;
   var launchButtonLabel;
   var crewCutsVisible;
   var mapView;
   var finaleListTitle;
   var timeOfDayID;
   var approachVehicleID;
   var entryPointID;
   var compoundEntryPointID;
   var exitPointID;
   var weaponsID;
   var supportCrewID;
   var crewCutID;
   function HeistData()
   {
      this.tabLabels = ["","",""];
      this.tabsLocked = [false,false,false];
      this.intelItem = new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem(0,0);
      this.prepItem = new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem(0,0);
      this.finaleItem = new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.FinaleItem(0,0);
      this.initialView = 0;
      this.isHardMode = false;
      this.payoutsVisible = false;
      this.mainPayout = 0;
      this.subPayout = 0;
      this.crew = [new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.Crew(),new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.Crew(),new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.Crew(),new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.Crew()];
      this.icons = [];
      this.launchButtonEnabled = true;
      this.launchButtonLabel = "";
      this.crewCutsVisible = false;
      this.mapView = com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.Map.MAIN_MAP;
      this.finaleListTitle = "";
   }
   function setTabs(tab1Label, tab1Locked, tab2Label, tab2Locked, tab3Label, tab3Locked)
   {
      this.tabLabels[0] = tab1Label;
      this.tabLabels[1] = tab2Label;
      this.tabLabels[2] = tab3Label;
      this.tabsLocked[0] = tab1Locked;
      this.tabsLocked[1] = tab2Locked;
      this.tabsLocked[2] = tab3Locked;
   }
   function addSetupItem(tabID, parentID, itemID, title, numComplete, numTotal, locked, isMandatory, description, texture, showDollar, numerator, denominator)
   {
      var _loc2_ = this.getItemByID(parentID,tabID != com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL ? this.prepItem : this.intelItem);
      if(_loc2_)
      {
         _loc2_.items.push(new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem(itemID,parentID,title,numComplete,numTotal,locked,isMandatory,description,texture,showDollar,numerator,denominator));
      }
   }
   function addFinaleItem(parentID, itemID, title, isSelected, description, texture, locked, showDollar)
   {
      var _loc2_ = this.getItemByID(parentID,this.finaleItem);
      if(_loc2_)
      {
         _loc2_.items.push(new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.FinaleItem(itemID,parentID,title,isSelected,description,texture,locked,showDollar));
      }
   }
   function setFinaleMenuIDs(timeOfDayID, approachVehicleID, entryPointID, compoundEntryPointID, exitPointID, weaponsID, supportCrewID, crewCutID)
   {
      this.timeOfDayID = timeOfDayID;
      this.approachVehicleID = approachVehicleID;
      this.entryPointID = entryPointID;
      this.compoundEntryPointID = compoundEntryPointID;
      this.exitPointID = exitPointID;
      this.weaponsID = weaponsID;
      this.supportCrewID = supportCrewID;
      this.crewCutID = crewCutID;
   }
   function addMapIcon(setupItemID, finaleItemID, iconID, mapID, x, y, isWorldCoordinates)
   {
      this.icons.push(new com.rockstargames.gtav.levelDesign.islandHeistBoard.data.MapIcon(setupItemID,finaleItemID,iconID,mapID,x,y,isWorldCoordinates));
   }
   function setFinaleItemSelected(itemID, isSelected)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.FinaleItem(this.getItemByID(itemID,this.finaleItem));
      if(_loc2_)
      {
         _loc2_.isSelected = isSelected;
         return true;
      }
      return false;
   }
   function setSetupItemNumComplete(itemID, numComplete)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem(this.getItemByID(itemID,this.intelItem)) || com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem(this.getItemByID(itemID,this.prepItem));
      if(_loc2_)
      {
         _loc2_.numComplete = numComplete;
         return true;
      }
      return false;
   }
   function removeFinaleItem(itemID)
   {
      var _loc4_ = this.getItemByID(itemID,this.finaleItem);
      if(_loc4_)
      {
         _loc4_.items.lenghth = 0;
         var _loc3_ = this.getItemByID(_loc4_.parentID,this.finaleItem);
         var _loc2_ = 0;
         while(_loc2_ < _loc3_.items.length)
         {
            if(_loc3_.items[_loc2_] == _loc4_)
            {
               _loc3_.items.splice(_loc2_,1);
               break;
            }
            _loc2_ = _loc2_ + 1;
         }
         return _loc3_.id;
      }
      return NaN;
   }
   function getItemByID(id, item)
   {
      if(id == item.id)
      {
         return item;
      }
      var _loc2_ = 0;
      while(_loc2_ < item.items.length)
      {
         var _loc3_ = this.getItemByID(id,item.items[_loc2_]);
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         _loc2_ = _loc2_ + 1;
      }
      return null;
   }
   function getParentID(tabIndex, id)
   {
      switch(tabIndex)
      {
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL:
            return this.getItemByID(id,this.intelItem).parentID;
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP:
            return this.getItemByID(id,this.prepItem).parentID;
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE:
            return this.getItemByID(id,this.finaleItem).parentID;
         default:
            return null;
      }
   }
   function getHistoryID(tabIndex, id)
   {
      switch(tabIndex)
      {
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL:
            return this.getItemByID(id,this.intelItem).historyID;
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP:
            return this.getItemByID(id,this.prepItem).historyID;
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE:
            return this.getItemByID(id,this.finaleItem).historyID;
         default:
            return null;
      }
   }
   function setHistoryID(tabIndex, id, historyID)
   {
      switch(tabIndex)
      {
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL:
            this.getItemByID(id,this.intelItem).historyID = historyID;
            break;
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP:
            this.getItemByID(id,this.prepItem).historyID = historyID;
            break;
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE:
            this.getItemByID(id,this.finaleItem).historyID = historyID;
      }
   }
   function getSetupItem(tabIndex, id)
   {
      switch(tabIndex)
      {
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL:
            return com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem(this.getItemByID(id,this.intelItem));
         case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP:
            return com.rockstargames.gtav.levelDesign.islandHeistBoard.data.SetupItem(this.getItemByID(id,this.prepItem));
         default:
            return null;
      }
   }
   function getFinaleItem(id)
   {
      return com.rockstargames.gtav.levelDesign.islandHeistBoard.data.FinaleItem(this.getItemByID(id,this.finaleItem));
   }
}
