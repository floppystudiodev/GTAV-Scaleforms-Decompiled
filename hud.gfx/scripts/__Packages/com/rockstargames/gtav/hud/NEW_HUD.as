class com.rockstargames.gtav.hud.NEW_HUD extends com.rockstargames.ui.core.BaseContainer
{
   var loadedHudComps;
   var listArray;
   var listManager;
   var charColourEnum;
   var COMPONENT_ARRAY;
   var MAX_HUD_COMPONENTS;
   var loadedCompPrefix;
   var IS_HUD_VISIBLE;
   var mcPrefix;
   var TIMELINE;
   var weaponWheelActive = false;
   var weaponTypeHash = 0;
   var _isWeaponSelectable = true;
   function NEW_HUD()
   {
      super();
      this.loadedHudComps = {};
      this.listArray = [];
      this.listManager = [];
      this.charColourEnum = com.rockstargames.ui.utils.HudColour.HUD_COLOUR_BLACK;
   }
   function SET_CHARACTER_COLOUR(colourEnum)
   {
      this.charColourEnum = colourEnum;
   }
   function SET_WEAPON_WHEEL_ACTIVE(bool)
   {
      this.weaponWheelActive = bool;
   }
   function GET_CURRENT_WEAPON_WHEEL_HASH()
   {
      if(this._isWeaponSelectable)
      {
         return this.weaponTypeHash;
      }
      return Number(this._isWeaponSelectable);
   }
   function SET_CURRENT_WEAPON_WHEEL_HASH(newWeaponHash, isWeaponSelectable)
   {
      this._isWeaponSelectable = isWeaponSelectable;
      this.weaponTypeHash = newWeaponHash;
   }
   function setupComponent(componentID)
   {
      super.setupComponent(componentID);
      var _loc3_ = this.COMPONENT_ARRAY[componentID];
      var _loc5_ = _loc3_._mc;
      if(componentID == com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1 || componentID == com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_2)
      {
         _loc5_._x = 0;
         _loc5_._y = 0;
      }
      if(componentID < this.MAX_HUD_COMPONENTS)
      {
         this.loadedHudComps[this.loadedCompPrefix + componentID] = _loc3_;
      }
      if(_loc3_._displayList != -1)
      {
         this.addObjectToList(componentID,_loc3_._displayList,_loc3_._displayListPriority);
      }
   }
   function setAllHudIntendedVisibility(isVisible)
   {
      var _loc4_ = undefined;
      var _loc3_ = 0;
      while(_loc3_ < this.MAX_HUD_COMPONENTS)
      {
         _loc4_ = super.checkForCompInfo(_loc3_ + 1);
         _loc4_._intendedVisibleState = isVisible;
         _loc3_ = _loc3_ + 1;
      }
   }
   function SHOW(componentID)
   {
      var _loc3_ = super.checkForCompInfo(componentID);
      _loc3_._intendedVisibleState = true;
      if(_loc3_._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
      {
         _loc3_._mc._visible = true;
         _loc3_._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
      }
      this.reorderList(_loc3_._displayList);
   }
   function HIDE(componentID)
   {
      var _loc3_ = super.checkForCompInfo(componentID);
      _loc3_._intendedVisibleState = false;
      if(_loc3_._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
      {
         _loc3_._mc._visible = false;
         _loc3_._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
      }
      this.reorderList(_loc3_._displayList);
   }
   function SHOW_ALL()
   {
      this.setAllHudIntendedVisibility(true);
      for(var _loc3_ in this.loadedHudComps)
      {
         var _loc2_ = this.loadedHudComps[_loc3_];
         if(_loc2_._status == com.rockstargames.ui.core.BaseContainer.HIDDEN)
         {
            _loc2_._mc._visible = true;
            _loc2_._status = com.rockstargames.ui.core.BaseContainer.ONSCREEN;
         }
      }
      this.reorderAllKnownLists();
      this.IS_HUD_VISIBLE = true;
   }
   function HIDE_ALL()
   {
      this.setAllHudIntendedVisibility(false);
      for(var _loc3_ in this.loadedHudComps)
      {
         var _loc2_ = this.loadedHudComps[_loc3_];
         if(_loc2_._status == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
         {
            _loc2_._mc._visible = false;
            _loc2_._status = com.rockstargames.ui.core.BaseContainer.HIDDEN;
         }
      }
      this.reorderAllKnownLists();
      this.IS_HUD_VISIBLE = false;
   }
   function REMOVE_HUD_ITEM(componentID, wasCalledFromCode)
   {
      if(wasCalledFromCode == undefined)
      {
         wasCalledFromCode = false;
      }
      var _loc2_ = this.COMPONENT_ARRAY[componentID];
      var _loc6_ = _loc2_._displayList;
      _loc2_._status = com.rockstargames.ui.core.BaseContainer.NOT_LOADED;
      if(_loc2_._hasGfx)
      {
         var _loc5_ = this.mcPrefix + componentID;
         this.TIMELINE[_loc5_].removeMovieClip();
         _loc2_._mc.removeMovieClip();
         _loc2_.sanitise();
         this.loadedHudComps[this.loadedCompPrefix + componentID] = null;
         delete this.loadedHudComps[this.loadedCompPrefix + componentID];
         if(componentID == 16)
         {
            delete com.rockstargames.gtav.hud.hudComponents.HUD_RADIO_STATIONS_WHEEL;
         }
         com.rockstargames.ui.game.GameInterface.call("SET_HUD_COMPONENT_AS_NO_LONGER_NEEDED",com.rockstargames.ui.game.GameInterface.HUD_TYPE,componentID,wasCalledFromCode);
      }
      else
      {
         _loc2_._status = com.rockstargames.ui.core.BaseContainer.DEACTIVATED;
         _loc2_._mc._visible = false;
         com.rockstargames.ui.game.GameInterface.call("SET_HUD_COMPONENT_AS_NO_LONGER_NEEDED",com.rockstargames.ui.game.GameInterface.HUD_TYPE,componentID,wasCalledFromCode);
      }
      this.reorderList(_loc6_);
   }
   function addObjectToList(componentID, listID, rowPriority)
   {
      if(this.listArray[listID] == undefined)
      {
         this.listArray[listID] = [];
         this.listManager.push(listID);
      }
      if(rowPriority != undefined)
      {
         this.listArray[listID][rowPriority] = componentID;
      }
      else
      {
         this.listArray[listID].push(componentID);
      }
      this.reorderList(listID);
   }
   function reorderAllKnownLists()
   {
      var _loc2_ = undefined;
      for(_loc2_ in this.listManager)
      {
         this.reorderList(this.listManager[_loc2_]);
      }
   }
   function reorderList(listID)
   {
      if(listID < 0 || listID == undefined)
      {
         return undefined;
      }
      var _loc8_ = this.listArray[listID];
      var _loc2_ = undefined;
      var _loc7_ = undefined;
      var _loc5_ = undefined;
      var _loc9_ = _loc8_.length;
      var _loc3_ = null;
      var _loc10_ = 8;
      var _loc4_ = 0;
      while(_loc4_ < _loc9_)
      {
         var _loc6_ = this.COMPONENT_ARRAY[_loc8_[_loc4_]];
         _loc2_ = com.rockstargames.ui.hud.HUD_COMPONENT(_loc6_._mc);
         _loc7_ = _loc6_._status;
         _loc5_ = this.safeTop;
         if(_loc7_ == com.rockstargames.ui.core.BaseContainer.ONSCREEN)
         {
            if(_loc3_ != null)
            {
               _loc5_ = _loc3_._y + _loc3_.BOUNDING_BOX._height + _loc10_ + _loc3_.getBottomCompOffset();
               if(_loc2_.getTopCompOffset() != undefined)
               {
                  _loc2_._y = _loc5_ + _loc2_.getTopCompOffset();
               }
               else
               {
                  _loc2_._y = _loc5_;
               }
            }
            else
            {
               _loc2_._y = this.safeTop;
            }
            if(_loc2_ != undefined)
            {
               _loc3_ = _loc2_;
            }
         }
         _loc4_ = _loc4_ + 1;
      }
   }
   function createComponentMovieClip(currentComp)
   {
      currentComp._status = com.rockstargames.ui.core.BaseContainer.LOADED;
      var _loc5_ = currentComp._enumId;
      var _loc4_ = currentComp._depth;
      var _loc3_ = this.mcPrefix + _loc5_;
      var _loc7_ = "HUD_SUBTITLE_TEXT";
      var _loc6_ = "HUD_HELP_TEXT";
      var _loc8_ = "MP_RANK_BAR";
      if(!this.isWideScreen)
      {
         _loc8_ = "MP_RANK_BAR_smaller";
      }
      if(this.NEEDS_BIGGER_HELP_AND_SUBTITLES)
      {
         _loc7_ = "HUD_SUBTITLE_TEXT_BIG";
         _loc6_ = "HUD_HELP_TEXT_BIG";
      }
      switch(_loc5_)
      {
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_HELP_TEXT:
            currentComp._mc = this.TIMELINE.attachMovie(_loc6_,_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_1:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_FLOATING_HELP_TEXT_1",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_FLOATING_HELP_TEXT_2:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_FLOATING_HELP_TEXT_2",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_ICON:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_WEAPON_ICON",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_WEAPON_WHEEL",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WEAPON_WHEEL_STATS:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_WEAPON_WHEEL_STATS",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_WANTED_STARS:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_WANTED_STARS",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_SUBTITLE_TEXT:
            currentComp._mc = this.TIMELINE.attachMovie(_loc7_,_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_VEHICLE_CLASS:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_VEHICLE_NAME:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_STREET_NAME:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_AREA_NAME:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_AREA_VEHICLE_STREET_NAME",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_CASH:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_MP_CASH:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_CASH",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_CASH_CHANGE:
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_MP_MESSAGE:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_CASH_CHANGED",_loc3_,_loc4_);
            break;
         case com.rockstargames.gtav.constants.HudComponentConstants.HUD_RADIO_STATIONS:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_RADIO_WHEEL",_loc3_,_loc4_);
            break;
         case 125:
         case 126:
         case 127:
         case 128:
         case 129:
         case 130:
         case 131:
         case 132:
         case 133:
         case 134:
         case 135:
         case 136:
         case 137:
         case 138:
         case 139:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_MP_INVENTORY",_loc3_,_loc4_);
            break;
         case 140:
            currentComp._mc = this.TIMELINE.attachMovie(_loc8_,_loc3_,_loc4_);
            break;
         case 141:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_DIRECTOR_MODE",_loc3_,_loc4_);
            break;
         case 142:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_CHIPS",_loc3_,_loc4_);
            break;
         case 143:
            currentComp._mc = this.TIMELINE.attachMovie("HUD_CHIPS_CHANGED",_loc3_,_loc4_);
      }
      com.rockstargames.ui.game.GameInterface.call("SET_ACTIVE_STATE",com.rockstargames.ui.game.GameInterface.HUD_TYPE,currentComp._enumId,true);
      currentComp._mc.INITIALISE();
      currentComp._mc._visible = false;
      this.setupComponent(_loc5_);
   }
}
