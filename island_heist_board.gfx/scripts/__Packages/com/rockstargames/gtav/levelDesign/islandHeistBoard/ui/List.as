class com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.List
{
   var colourScheme;
   var currentItemID;
   var currentTabIndex;
   var firstRun;
   var heistData;
   var listItems;
   var view;
   var viewPrev;
   static var MAX_LIST_ITEMS = 8;
   static var CREW_LIST_ITEMS = 4;
   function List(viewA, viewB, heistData, colourScheme)
   {
      this.view = viewA;
      this.viewPrev = viewB;
      this.heistData = heistData;
      this.colourScheme = colourScheme;
      this.currentTabIndex = heistData.initialView;
      this.currentItemID = -1;
      this.listItems = [];
      this.firstRun = true;
      this.viewPrev._alpha = 0;
      this.view.swapDepths(this.view._parent.getNextHighestDepth());
      this.viewPrev.swapDepths(this.view._parent.getNextHighestDepth());
      this.showItems(this.currentTabIndex,0,false);
   }
   function getListItems()
   {
      return this.listItems;
   }
   function getCurrentItemID()
   {
      return this.currentItemID;
   }
   function showItems(tabIndex, itemID, showParent)
   {
      var _loc2_ = false;
      if(showParent)
      {
         itemID = this.heistData.getParentID(tabIndex,this.currentItemID);
      }
      if(tabIndex != this.currentTabIndex || itemID != this.currentItemID && itemID != undefined)
      {
         switch(tabIndex)
         {
            case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.INTEL:
               _loc2_ = this.drawSetup(itemID,tabIndex);
               break;
            case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.PREP:
               _loc2_ = this.drawSetup(itemID,tabIndex);
               break;
            case com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE:
               _loc2_ = this.drawFinale(itemID);
         }
      }
      if(_loc2_)
      {
         this.currentTabIndex = tabIndex;
         this.currentItemID = itemID;
      }
      return _loc2_;
   }
   function showItemsAfterRemoval(tabIndex, parentID)
   {
      this.currentItemID = -1;
      this.showItems(tabIndex,parentID,false);
   }
   function updateSetupItem(itemID, numComplete)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.listItems.length)
      {
         if(this.listItems[_loc2_].id == itemID)
         {
            this.listItems[_loc2_].updateCheckboxes(numComplete);
            break;
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function updateFinaleItem(itemID, isSelected)
   {
      var _loc3_;
      var _loc5_;
      var _loc2_;
      var _loc4_;
      if(this.currentTabIndex == com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.TabGroup.FINALE)
      {
         if(this.currentItemID == 0)
         {
            _loc3_ = 0;
            while(_loc3_ < this.listItems.length)
            {
               _loc5_ = this.heistData.getFinaleItem(this.listItems[_loc3_].id);
               _loc2_ = this.listItems[_loc3_];
               if(_loc2_.id == this.heistData.timeOfDayID)
               {
                  this.updateFinaleTopLevelItem(_loc5_,_loc2_,"");
               }
               else if(_loc2_.id == this.heistData.approachVehicleID || _loc2_.id == this.heistData.entryPointID || _loc2_.id == this.heistData.compoundEntryPointID || _loc2_.id == this.heistData.exitPointID)
               {
                  this.updateFinaleTopLevelItem(_loc5_,_loc2_,"// ");
               }
               _loc3_ = _loc3_ + 1;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < this.listItems.length)
            {
               _loc4_ = this.listItems[_loc3_];
               if(_loc4_.id == itemID)
               {
                  _loc4_.checkBox1Selected = isSelected;
               }
               _loc3_ = _loc3_ + 1;
            }
         }
      }
   }
   function updateCrew()
   {
      var _loc5_ = 0;
      var _loc4_;
      var _loc6_;
      var _loc3_;
      var _loc2_;
      while(_loc5_ < this.listItems.length)
      {
         _loc4_ = this.listItems[_loc5_];
         _loc6_ = false;
         _loc3_ = 0;
         while(_loc3_ < this.heistData.crew.length)
         {
            _loc2_ = this.heistData.crew[_loc3_];
            if(_loc2_.id == _loc4_.id)
            {
               _loc4_.populate(_loc5_,_loc2_.gamertag,_loc2_.percentage,_loc2_.headsetState);
               _loc6_ = true;
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
         _loc4_.view._visible = _loc6_;
         _loc4_.enabled = _loc6_;
         _loc5_ = _loc5_ + 1;
      }
   }
   function setCrewCutsVisible(isVisible)
   {
      var _loc3_ = 0;
      var _loc2_;
      while(_loc3_ < this.listItems.length)
      {
         _loc2_ = this.listItems[_loc3_];
         if(_loc2_.id == this.heistData.crewCutID)
         {
            _loc2_.enabled = this.heistData.crewCutsVisible;
            _loc2_.view._visible = this.heistData.crewCutsVisible;
            _loc2_.setState(false);
            break;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function drawSetup(itemID, tabIndex)
   {
      var _loc11_ = this.heistData.getSetupItem(tabIndex,itemID);
      var _loc10_ = _loc11_.items;
      if(_loc10_ == undefined || _loc10_.length == 0)
      {
         return false;
      }
      this.clearListItems();
      this.swapListViews(itemID != 0 ? "setupSubLevel" : "setupTopLevel");
      var _loc3_ = 0;
      var _loc2_;
      var _loc5_;
      var _loc4_;
      var _loc8_;
      var _loc9_;
      var _loc6_;
      var _loc7_;
      while(_loc3_ < _loc10_.length)
      {
         _loc2_ = _loc10_[_loc3_];
         _loc5_ = this.view["listItem" + _loc3_];
         _loc4_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem(_loc2_.id,_loc5_,this.colourScheme);
         _loc8_ = _loc2_.numComplete;
         _loc9_ = _loc2_.numTotal;
         _loc6_ = _loc2_.locked == 1;
         _loc7_ = _loc2_.locked == 2;
         _loc4_.populate(_loc2_.title,true,_loc2_.numerator,_loc2_.denominator,_loc8_,_loc9_,_loc6_,_loc7_,_loc2_.isMandatory,_loc2_.showDollar);
         this.listItems.push(_loc4_);
         _loc5_._visible = true;
         _loc3_ = _loc3_ + 1;
      }
      while(_loc3_ < com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.List.MAX_LIST_ITEMS)
      {
         this.view["listItem" + _loc3_]._visible = false;
         _loc3_ = _loc3_ + 1;
      }
      if(itemID != 0)
      {
         this.view.heading.transform.colorTransform = this.colourScheme.light;
         this.view.divider.transform.colorTransform = this.colourScheme.mid;
         this.view.heading.arrow.verticalAlign = "center";
         this.view.heading.heading.verticalAlign = "center";
         this.view.heading.heading.text = _loc11_.title;
         com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.heading);
         this.view.heading.fraction.verticalAlign = "center";
         if(_loc11_.denominator > 0)
         {
            this.view.heading.fraction.text = _loc11_.numerator + " / " + _loc11_.denominator;
            com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.fraction);
         }
         else
         {
            this.view.heading.fraction.text = "";
         }
      }
      return true;
   }
   function drawFinale(itemID)
   {
      var _loc2_ = false;
      switch(itemID)
      {
         case 0:
            _loc2_ = this.drawFinaleTopLevel();
            break;
         case this.heistData.crewCutID:
            _loc2_ = this.drawFinaleCrewCut();
            break;
         default:
            _loc2_ = this.drawFinaleSubLevel(itemID);
      }
      return _loc2_;
   }
   function drawFinaleTopLevel()
   {
      this.clearListItems();
      this.swapListViews("finaleTopLevel");
      this.initFinaleTopLevelItem(this.heistData.getFinaleItem(this.heistData.approachVehicleID),this.view.approachVehicle,"// ");
      this.initFinaleTopLevelItem(this.heistData.getFinaleItem(this.heistData.entryPointID),this.view.entryPoint,"// ");
      this.initFinaleTopLevelItem(this.heistData.getFinaleItem(this.heistData.compoundEntryPointID),this.view.compoundEntryPoint,"// ");
      this.initFinaleTopLevelItem(this.heistData.getFinaleItem(this.heistData.exitPointID),this.view.exitPoint,"// ");
      this.initFinaleTopLevelItem(this.heistData.getFinaleItem(this.heistData.timeOfDayID),this.view.timeOfDay,"// ");
      var _loc2_;
      var _loc3_;
      _loc2_ = this.heistData.getFinaleItem(this.heistData.weaponsID);
      _loc3_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.FinaleListItem(_loc2_.id,this.view.weapons,this.colourScheme);
      _loc3_.populate(_loc2_.title,true,!_loc2_.showDollar ? "" : "$",false,false);
      this.listItems.push(_loc3_);
      _loc3_.enabled = _loc2_ != null;
      _loc3_.view._visible = _loc2_ != null;
      _loc2_ = this.heistData.getFinaleItem(this.heistData.supportCrewID);
      _loc3_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.FinaleListItem(_loc2_.id,this.view.supportCrew,this.colourScheme);
      _loc3_.populate(_loc2_.title,true,!_loc2_.showDollar ? "" : "$",false,false);
      this.listItems.push(_loc3_);
      _loc3_.enabled = _loc2_ != null;
      _loc3_.view._visible = _loc2_ != null;
      _loc2_ = this.heistData.getFinaleItem(this.heistData.crewCutID);
      _loc3_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.FinaleListItem(_loc2_.id,this.view.crewCut,this.colourScheme);
      _loc3_.populate(_loc2_.title,true,!_loc2_.showDollar ? "" : "$",false,false);
      this.listItems.push(_loc3_);
      _loc3_.enabled = this.heistData.crewCutsVisible && _loc2_ != null;
      _loc3_.view._visible = this.heistData.crewCutsVisible && _loc2_ != null;
      this.view.divider2._visible = this.heistData.crewCutsVisible && _loc2_ != null;
      this.view.divider1.transform.colorTransform = this.colourScheme.light;
      this.view.divider2.transform.colorTransform = this.colourScheme.light;
      this.view.heading.transform.colorTransform = this.colourScheme.light;
      this.view.divider.transform.colorTransform = this.colourScheme.mid;
      this.view.heading.heading.verticalAlign = "center";
      this.view.heading.heading.text = this.heistData.finaleListTitle;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.heading);
      return true;
   }
   function initFinaleTopLevelItem(item, itemView, secondaryLabelPrefix)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.FinaleListItem(item.id,itemView,this.colourScheme);
      this.updateFinaleTopLevelItem(item,_loc2_,secondaryLabelPrefix);
      this.listItems.push(_loc2_);
      _loc2_.enabled = item != null;
      _loc2_.view._visible = item != null;
   }
   function updateFinaleTopLevelItem(item, listItem, secondaryLabelPrefix)
   {
      var _loc3_ = secondaryLabelPrefix + item.description;
      var _loc4_ = false;
      var _loc1_ = 0;
      while(_loc1_ < item.items.length)
      {
         if(item.items[_loc1_].isSelected)
         {
            _loc3_ = secondaryLabelPrefix + item.items[_loc1_].title;
            _loc4_ = true;
            item.isSelected = true;
            break;
         }
         _loc1_ = _loc1_ + 1;
      }
      listItem.populate(item.title,true,_loc3_,true,_loc4_);
   }
   function drawFinaleCrewCut()
   {
      var _loc7_ = this.heistData.getFinaleItem(this.heistData.crewCutID);
      var _loc6_ = _loc7_.items;
      if(_loc6_ == undefined || _loc6_.length == 0)
      {
         return false;
      }
      this.clearListItems();
      this.swapListViews("finaleCrewCut");
      var _loc2_ = 0;
      var _loc5_;
      var _loc3_;
      var _loc4_;
      while(_loc2_ < _loc6_.length)
      {
         _loc5_ = _loc6_[_loc2_];
         _loc3_ = this.view["listItem" + _loc2_];
         _loc4_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.CrewListItem(_loc5_.id,_loc3_,this.colourScheme);
         this.listItems.push(_loc4_);
         _loc3_._visible = true;
         _loc2_ = _loc2_ + 1;
      }
      this.updateCrew();
      this.view.heading.transform.colorTransform = this.colourScheme.light;
      this.view.divider.transform.colorTransform = this.colourScheme.mid;
      this.view.heading.arrow.verticalAlign = "center";
      this.view.heading.heading.verticalAlign = "center";
      this.view.heading.heading.text = _loc7_.title;
      com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.heading);
      this.view.heading.fraction.verticalAlign = "center";
      return true;
   }
   function drawFinaleSubLevel(itemID)
   {
      var _loc9_ = this.heistData.getFinaleItem(itemID);
      var _loc8_ = _loc9_.items;
      if(_loc8_ == undefined || _loc8_.length == 0)
      {
         return false;
      }
      this.clearListItems();
      this.swapListViews("finaleSubLevel");
      var _loc2_ = 0;
      var _loc3_;
      var _loc5_;
      var _loc4_;
      var _loc6_;
      var _loc7_;
      while(_loc2_ < _loc8_.length)
      {
         _loc3_ = _loc8_[_loc2_];
         _loc5_ = this.view["listItem" + _loc2_];
         _loc4_ = new com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.ListItem(_loc3_.id,_loc5_,this.colourScheme);
         _loc6_ = _loc3_.locked == 1;
         _loc7_ = _loc3_.locked == 2;
         _loc4_.populate(_loc3_.title,true,0,0,!_loc3_.isSelected ? 0 : 1,1,_loc6_,_loc7_,false,_loc3_.showDollar);
         this.listItems.push(_loc4_);
         _loc5_._visible = true;
         _loc2_ = _loc2_ + 1;
      }
      while(_loc2_ < com.rockstargames.gtav.levelDesign.islandHeistBoard.ui.List.MAX_LIST_ITEMS)
      {
         this.view["listItem" + _loc2_]._visible = false;
         _loc2_ = _loc2_ + 1;
      }
      if(itemID != 0)
      {
         this.view.heading.transform.colorTransform = this.colourScheme.light;
         this.view.divider.transform.colorTransform = this.colourScheme.mid;
         this.view.heading.arrow.verticalAlign = "center";
         this.view.heading.heading.verticalAlign = "center";
         this.view.heading.heading.text = _loc9_.title;
         com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.resizeAsianText(this.view.heading.heading);
      }
      return true;
   }
   function clearListItems()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.listItems.length)
      {
         this.listItems[_loc2_].dispose();
         _loc2_ = _loc2_ + 1;
      }
      this.listItems = [];
   }
   function swapListViews(frameLabel)
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.reveal);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.viewPrev);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.viewPrev.reveal);
      var _loc2_ = this.view;
      this.view = this.viewPrev;
      this.viewPrev = _loc2_;
      this.viewPrev.swapDepths(this.view);
      this.view.gotoAndStop(frameLabel);
      this.view.reveal.transform.colorTransform = this.colourScheme.dark;
      this.view._alpha = 100;
      if(this.firstRun)
      {
         this.viewPrev._alpha = 0;
         this.view.reveal.gotoAndStop(1);
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.reveal,0.75,{onCompleteScope:this.view.reveal,onComplete:this.view.reveal.gotoAndPlay,onCompleteArgs:[1]});
         this.firstRun = false;
      }
      else
      {
         this.view.reveal.gotoAndPlay(1);
         this.viewPrev._alpha = Math.min(30,this.viewPrev._alpha);
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.viewPrev,com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_DURATION,{_alpha:0,ease:com.rockstargames.gtav.levelDesign.ISLAND_HEIST_BOARD.ELEMENT_FADE_OUT_CURVE});
         com.rockstargames.ui.game.GameInterface.call("PLAY_SOUND",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"Change_Display_Draw_Menu_Options","DLC_Hei4_Planning_Board_Planning_Board_Soundset");
      }
   }
   function dispose()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.reveal);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.viewPrev);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.viewPrev.reveal);
      this.clearListItems();
      this.listItems = null;
      this.heistData = null;
      this.view = null;
      this.colourScheme = null;
   }
}
