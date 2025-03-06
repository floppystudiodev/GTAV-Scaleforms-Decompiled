class com.rockstargames.gtav.levelDesign.heists.HEIST_MP extends com.rockstargames.ui.components.GUIController
{
   var linkageArray;
   var itemTypeList;
   var currentBoard;
   var CONTENT;
   var model;
   var numPlayers;
   var heistDesc;
   var heistName;
   var heistInfo;
   var heistTeam;
   var crewLabels = new Array();
   var pieChartLabels = new Array();
   var _highlighted = false;
   var playerTxdArray = new Array();
   var heistboardInitialised = false;
   var planningboardInitialised = false;
   var strandboardInitialised = false;
   function HEIST_MP()
   {
      super();
      _global.gfxExtensions = true;
      this.linkageArray = [];
      this.itemTypeList = [];
      this.itemTypeList[0] = "teamSelection";
      this.itemTypeList[1] = "launchButton";
      this.itemTypeList[2] = "heistSelection";
      this.itemTypeList[3] = "pieChart";
      this.itemTypeList[4] = "todolistSelection";
      this.itemTypeList[5] = "playerCard";
      this.itemTypeList[6] = "planningPreviews";
      this.itemTypeList[7] = "planningSelection";
      this.itemTypeList[8] = "strandSelection";
      this.currentBoard = this.CONTENT.boardMC;
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      var _loc6_ = this.CONTENT.attachMovie("HeistBoard","boardMC",this.CONTENT.getNextHighestDepth());
      var _loc5_ = this.CONTENT.attachMovie("PlanningBoard","planningMC",this.CONTENT.getNextHighestDepth());
      var _loc4_ = this.CONTENT.attachMovie("StrandBoard","strandMC",this.CONTENT.getNextHighestDepth());
      this.model = new com.rockstargames.gtav.levelDesign.heists.MPHeistModel();
      this.model.createView(0,{id:0,x:0,y:0,container:_loc6_,visibleItems:16,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
      this.model.createView(1,{id:0,x:0,y:0,container:_loc5_,visibleItems:22,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
      this.model.createView(2,{id:0,x:0,y:0,container:_loc4_,visibleItems:22,selectstyle:com.rockstargames.ui.components.GUIView.FOCUS_SELECTSTYLE});
      var _loc3_ = 0;
      while(_loc3_ < 8)
      {
         this.ADD_CREW_MEMBER(_loc3_);
         _loc3_ = _loc3_ + 1;
      }
      this.ADD_LAUNCH_BUTTON();
      this.SET_HEIST_NAME();
      this.ADD_PIECHART();
      this.ADD_TODO_LIST();
      this.ADD_PLAYERCARD();
      this.ADD_PREVIEW();
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         this.ADD_PLANNING_SLOT(_loc3_);
         _loc3_ = _loc3_ + 1;
      }
      _loc3_ = 0;
      while(_loc3_ < 6)
      {
         this.ADD_STRAND_SLOT(_loc3_);
         _loc3_ = _loc3_ + 1;
      }
      this.CONTENT.boardMC._visible = false;
      this.CONTENT.planningMC._visible = false;
      this.CONTENT.strandMC._visible = false;
   }
   function TXD_HAS_LOADED(textureDict, success, uniqueID)
   {
      if(success == true)
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.currentBoard + "." + uniqueID));
         if(il.textureDict == textureDict)
         {
            il.displayTxdResponse(textureDict,success);
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HEIST_MP",textureDict);
         }
      }
   }
   function TXD_ALREADY_LOADED(textureDict, uniqueID)
   {
      var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.currentBoard + "." + uniqueID));
      if(il.textureDict == textureDict)
      {
         il.displayTxdResponse(textureDict,true);
      }
      else
      {
         com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HEIST_MP",textureDict);
      }
   }
   function ADD_TXD_REF_RESPONSE(textureDict, uniqueID, success)
   {
      if(success == true)
      {
         var il = com.rockstargames.ui.media.ImageLoaderMC(eval(this.currentBoard + "." + uniqueID));
         if(il != undefined)
         {
            il.displayTxdResponse(textureDict);
         }
         else
         {
            com.rockstargames.ui.game.GameInterface.call("REMOVE_TXD_REF",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,"HEIST_MP",textureDict);
         }
      }
   }
   function DISPLAY_VIEW(viewIndex)
   {
      var _loc3_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(viewIndex));
      _loc3_.viewLinkageList = this.linkageArray;
      if(viewIndex == undefined)
      {
         viewIndex = 0;
      }
      this.model.displayView(viewIndex);
   }
   function HIGHLIGHT_ITEM(_itemIndex, _subItemIndex, leftArrow, rightArrow)
   {
      if(_itemIndex == 8)
      {
         this.HIGHLIGHT_BUTTON_HACK();
      }
      else
      {
         if(_itemIndex == -1 || _itemIndex == undefined)
         {
            _itemIndex = 99;
            _subItemIndex = undefined;
            leftArrow = undefined;
            rightArrow = undefined;
         }
         if(_subItemIndex == -1)
         {
            _subItemIndex = 0;
         }
         if(leftArrow == -1)
         {
            leftArrow = 0;
         }
         if(rightArrow == -1)
         {
            rightArrow = 0;
         }
         var _loc6_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView());
         this.model.setItem(_loc6_,_itemIndex,_subItemIndex,leftArrow,rightArrow);
      }
   }
   function HIGHLIGHT_BUTTON_HACK()
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.viewList[0]);
      this.model.setItem(_loc2_,8,0,0,0);
   }
   function SET_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc3_ = arguments.slice(1);
      var _loc4_ = this.itemTypeList[_loc3_[1]];
      this.linkageArray[_slotIndex] = _loc4_;
      this.model.addDataToView(_viewIndex,_slotIndex,_loc3_);
   }
   function UPDATE_DATA_SLOT(_viewIndex, _slotIndex)
   {
      var _loc3_ = arguments.slice(1);
      this.model.updateSlot(_viewIndex,_slotIndex,_loc3_);
   }
   function SHOW_VIEW(_viewIndex, _show)
   {
      var _loc2_ = this.model.getCurrentView(_viewIndex);
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(_loc2_).show(Boolean(_show));
   }
   function CLEAR_VIEW()
   {
      this.model = new com.rockstargames.gtav.levelDesign.heists.MPHeistModel();
      this.linkageArray = [];
      this.model.removeDataFromSlot(0);
      this.model.removeDataFromSlot(1);
      this.model.removeDataFromSlot(2);
      var _loc2_ = this.model.getCurrentView(0);
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(_loc2_).itemList = [];
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(_loc2_).dataList = [];
      _loc2_ = this.model.getCurrentView(1);
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(_loc2_).itemList = [];
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(_loc2_).dataList = [];
      _loc2_ = this.model.getCurrentView(2);
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(_loc2_).itemList = [];
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(_loc2_).dataList = [];
   }
   function SET_LABELS(_theHeist, _launchButton, _theTake, _thePlan, _total, _playerCut, _role, _cut, _status, _outfit)
   {
      if(_role != undefined)
      {
         this.CONTENT.boardMC.crewSelection_labels.label_roleTF.htmlText = _role;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.boardMC.crewSelection_labels.label_roleTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
      if(_cut != undefined)
      {
         this.CONTENT.boardMC.crewSelection_labels.label_cutTF.htmlText = _cut;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.boardMC.crewSelection_labels.label_cutTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
      if(_status != undefined)
      {
         this.CONTENT.boardMC.crewSelection_labels.label_statusTF.htmlText = _status;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.boardMC.crewSelection_labels.label_statusTF,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      }
      com.rockstargames.gtav.levelDesign.heists.MPHeistModel(this.model).setLabel(_theHeist,_launchButton,_theTake,_thePlan,_total,_playerCut,_role,_cut,_status,_outfit);
   }
   function ADD_CREW_MEMBER(_playerSlot, _playerName, _rank, _portrait, _role, _roleIcon, _status, _statusIcon, _cutCash, _cutPercentage, _gangIconEnum, _codename, _outfit, _numPlayers)
   {
      if(arguments.length == 1)
      {
         this.SET_DATA_SLOT(0,_playerSlot,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
      }
      else
      {
         this.SET_DATA_SLOT(0,_playerSlot,0,_playerName,_rank,_playerSlot,_role,_roleIcon,_status,_statusIcon,_cutCash,_cutPercentage,_gangIconEnum,_codename,_outfit,_numPlayers);
      }
   }
   function UPDATE_CREW_MEMBER(_playerSlot, _playerName, _rank, _portrait, _role, _roleIcon, _status, _statusIcon, _cutCash, _cutPercentage, _gangIconEnum, _codename, _outfit, _numPlayers, _headsetIcon, _invalidSelection)
   {
      if(this.currentBoard == this.CONTENT.boardMC)
      {
         this.UPDATE_DATA_SLOT(0,_playerSlot,0,_playerName,_rank,_portrait,_role,_roleIcon,_status,_statusIcon,_cutCash,_cutPercentage,_gangIconEnum,_codename,_outfit,_numPlayers,_headsetIcon,_invalidSelection);
         this.repositionLaunchButton();
      }
   }
   function BLANK_CREW_MEMBER(_playerSlot)
   {
      this.UPDATE_DATA_SLOT(0,_playerSlot,0,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
      this.BLANK_PLAYERCARD(_playerSlot);
      this.repositionLaunchButton();
   }
   function SET_PLAYERLIST_ICON(_slotIndex, _headsetIcon)
   {
      if(this.currentBoard == this.CONTENT.boardMC)
      {
         var _loc2_ = this.model.getCurrentView(0);
         var _loc3_ = _slotIndex - _loc2_.index + _loc2_.highlightedItem;
         com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardCrewMember(_loc2_.itemList[_loc3_]).setHeadsetIcon(_headsetIcon);
      }
   }
   function repositionLaunchButton()
   {
      this.numPlayers = 0;
      var _loc2_ = 0;
      while(_loc2_ < 8)
      {
         if(com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[_loc2_]._visible == true)
         {
            this.numPlayers = this.numPlayers + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[8].repositionLaunchButton(this.numPlayers);
      var _loc3_ = 100;
      var _loc7_ = 0;
      var _loc8_ = 0;
      var _loc4_ = 100;
      var _loc5_ = 0;
      var _loc6_ = 0;
      switch(this.numPlayers)
      {
         case 5:
            _loc3_ = 100;
            _loc7_ = 0;
            _loc8_ = 20;
            _loc4_ = 100;
            _loc5_ = 0;
            _loc6_ = 20;
            break;
         case 6:
            _loc3_ = 82;
            _loc7_ = 26;
            _loc8_ = 80;
            _loc4_ = 90;
            _loc5_ = 20;
            _loc6_ = 70;
            break;
         case 7:
            _loc3_ = 82;
            _loc7_ = 26;
            _loc8_ = 80;
            _loc4_ = 73;
            _loc5_ = 50;
            _loc6_ = 110;
            break;
         case 8:
            _loc3_ = 58;
            _loc7_ = 68;
            _loc8_ = 135;
            _loc4_ = 66;
            _loc5_ = 185;
            _loc6_ = 120;
      }
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[12]._x = 586 + _loc7_;
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[12]._y = 420 + _loc8_;
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[12]._xScale = _loc3_;
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[12]._yScale = _loc3_;
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[13]._x = 230 + _loc5_;
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[13]._y = 440 + _loc6_;
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[13]._xScale = _loc4_;
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[13]._yScale = _loc4_;
   }
   function SET_HEIST_NAME(_heistName, _info, _team, _title)
   {
      this.heistDesc = "";
      this.heistName = _heistName;
      this.heistInfo = _info;
      this.heistTeam = _team;
      this.SET_DATA_SLOT(0,9,2,this.heistName,this.heistDesc,"",_title,false);
      this.SET_DATA_SLOT(1,9,2,this.heistName.toUpperCase(),this.heistDesc,"",_title,true,_info,_team);
      this.repositionHeistNameTitle(1);
   }
   function UPDATE_HEIST_NAME(_heistName, _info, _team, _title)
   {
      this.heistDesc = "";
      this.heistName = _heistName;
      this.heistInfo = _info;
      this.heistTeam = _team;
      this.UPDATE_DATA_SLOT(0,9,2,this.heistName,this.heistDesc,"",_title,false);
      this.UPDATE_DATA_SLOT(1,9,2,this.heistName.toUpperCase(),this.heistDesc,"",_title,true,_info,_team);
      this.repositionHeistNameTitle(1);
   }
   function repositionHeistNameTitle(viewIndex)
   {
      var _loc5_ = this.model.getCurrentView(viewIndex).itemList[9];
      var _loc3_ = this.getNumOfPlanningSlots();
      var _loc2_ = 0;
      var _loc4_ = 0;
      if(_loc3_ > 0 && _loc3_ < 3)
      {
         var _loc6_ = this.model.getCurrentView(viewIndex).itemList[14];
         _loc2_ = _loc6_._y;
         _loc4_ = 50;
      }
      _loc5_._y = _loc2_ - _loc4_;
   }
   function ADD_LAUNCH_BUTTON()
   {
      this.SET_DATA_SLOT(0,8,1,false);
      this.LAUNCH_BUTTON_ENABLED(false);
   }
   function LAUNCH_BUTTON_VISIBLE(_vis)
   {
      this.UPDATE_DATA_SLOT(0,8,1,_vis);
   }
   function LAUNCH_BUTTON_ENABLED(_enabled)
   {
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[8].enableLaunchButton(_enabled);
   }
   function LAUNCH_BUTTON_HIGHLIGHTED(_highlighted)
   {
      if(_highlighted == true)
      {
         this.HIGHLIGHT_ITEM(8);
      }
      else
      {
         this.HIGHLIGHT_ITEM(-1);
      }
   }
   function SET_LAUNCH_BUTTON_COLOUR(hudColour)
   {
      com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[8].setColour(hudColour);
   }
   function SET_LEADER_COST(message, value)
   {
      if(message == undefined)
      {
         message = "";
      }
      var _loc2_ = this.model.getCurrentView(0).itemList[9].heistCostTF;
      _loc2_.text = message + " " + this.formatAmount(value);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc2_,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
      var _loc7_ = this.model.getCurrentView(0).itemList[9].heistTitleTF.textWidth;
      var _loc5_ = 0.5 * (750 - _loc7_) - 10;
      var _loc4_ = _loc2_.textWidth;
      if(_loc4_ > _loc5_)
      {
         var _loc3_ = _loc5_ / _loc4_;
         _loc2_._xscale = _loc2_._yscale = 100 * _loc3_;
         _loc2_._x = 750 - _loc2_._width;
         _loc2_._y = 0.5 * (1 - _loc3_) * _loc2_._height;
      }
   }
   function formatAmount(value)
   {
      if(isNaN(value))
      {
         return "";
      }
      var _loc2_ = "$";
      var _loc3_ = value.toString().length;
      var _loc5_ = ",";
      var _loc1_ = 0;
      while(_loc1_ < _loc3_)
      {
         if((_loc3_ - _loc1_) % 3 == 0 && _loc1_ != 0)
         {
            _loc2_ += _loc5_;
         }
         _loc2_ += value.toString().charAt(_loc1_);
         _loc1_ = _loc1_ + 1;
      }
      return _loc2_;
   }
   function ADD_PIECHART(_potentialTake, _player1Percent, _player2Percent, _player3Percent, _player4Percent, _pot)
   {
      this.SET_DATA_SLOT(0,10,3,_potentialTake,_player1Percent,_player2Percent,_player3Percent,_player4Percent,_pot);
   }
   function UPDATE_PIECHART(_potentialTake, _player1Percent, _player2Percent, _player3Percent, _player4Percent, _pot)
   {
      this.UPDATE_DATA_SLOT(0,10,3,_potentialTake,_player1Percent,_player2Percent,_player3Percent,_player4Percent,_pot);
   }
   function ADD_TODO_LIST()
   {
      var _loc3_ = arguments;
      this.SET_DATA_SLOT(0,11,4,_loc3_);
   }
   function UPDATE_TODO_LIST()
   {
      var _loc3_ = arguments;
      this.UPDATE_DATA_SLOT(0,11,4,_loc3_);
   }
   function GET_TODO_ITEM_LINE_COUNT(itemIndex)
   {
      var _loc2_ = this.model.getCurrentView(0).itemList[11].getItemLineCount(itemIndex);
      return _loc2_;
   }
   function ADD_PLAYERCARD(_playerSlot, _playerName, _rank, _role, _portrait, _PlaneBool, _HeliBool, _BoatBool, _CarBool, kdRatio, title, status, stat1, stat2, stat3, stat4, stat5, stat6, stat7)
   {
      if(arguments.length < 2)
      {
         this.SET_DATA_SLOT(0,12,5,_playerSlot,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
      }
      else
      {
         this.SET_DATA_SLOT(0,12,5,_playerSlot,_playerName,_rank,_role,_portrait,_PlaneBool,_HeliBool,_BoatBool,_CarBool,kdRatio,title,status,stat1,stat2,stat3,stat4,stat5,stat6,stat7);
      }
   }
   function UPDATE_PLAYERCARD(_playerSlot, _playerName, _rank, _role, _portrait, _PlaneBool, _HeliBool, _BoatBool, _CarBool, kdRatio, title, status, stat1, stat2, stat3, stat4, stat5, stat6, stat7)
   {
      if(this.currentBoard == this.CONTENT.boardMC)
      {
         this.UPDATE_DATA_SLOT(0,12,5,_playerSlot,_playerName,_rank,_role,_portrait,_PlaneBool,_HeliBool,_BoatBool,_CarBool,kdRatio,title,status,stat1,stat2,stat3,stat4,stat5,stat6,stat7);
      }
   }
   function BLANK_PLAYERCARD(_playerSlot)
   {
      this.UPDATE_DATA_SLOT(0,12,5,_playerSlot,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
   }
   function ADD_PLAYERCARD_MEDALS(_playerSlot, _medal1, _medal2, _medal3, _medal4, _medal5, _medal6)
   {
      if(this.currentBoard == this.CONTENT.boardMC)
      {
         com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(0)).itemList[12].addMedals(_playerSlot,_medal1,_medal2,_medal3,_medal4,_medal5,_medal6);
      }
   }
   function ADD_PREVIEW(_slot, _title1, _txn)
   {
      if(arguments.length == 0)
      {
         this.SET_DATA_SLOT(0,13,6,_slot,undefined,undefined);
      }
      else
      {
         this.SET_DATA_SLOT(0,13,6,_slot,_title1,_txn);
      }
   }
   function UPDATE_PREVIEW(_slot, _title1, _txn)
   {
      this.UPDATE_DATA_SLOT(0,13,6,_slot,_title1,_txn);
   }
   function BLANK_PREVIEW()
   {
      this.UPDATE_DATA_SLOT(0,13,6,0,undefined,undefined);
      this.UPDATE_DATA_SLOT(0,13,6,1,undefined,undefined);
   }
   function ADD_PLANNING_SLOT(_itemSlot, _txd, _title, _txn1, _imageName1, _txn2, _imageName2, _txn3, _imageName3, _completed, _available, _highlight, _fadeInCross)
   {
      if(arguments.length < 2)
      {
         this.SET_DATA_SLOT(1,14 + _itemSlot,7,_itemSlot,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
      }
      else
      {
         this.SET_DATA_SLOT(1,14 + _itemSlot,7,_itemSlot,_txd,_title,_txn1,_imageName1,_txn2,_imageName2,_txn3,_imageName3,_completed,_available,_highlight,_fadeInCross);
      }
   }
   function UPDATE_PLANNING_SLOT(_itemSlot, _txd, _title, _txn1, _imageName1, _txn2, _imageName2, _txn3, _imageName3, _completed, _available, _highlight, _fadeInCross)
   {
      if(this.currentBoard == this.CONTENT.planningMC)
      {
         this.UPDATE_DATA_SLOT(1,14 + _itemSlot,7,_itemSlot,_txd,_title,_txn1,_imageName1,_txn2,_imageName2,_txn3,_imageName3,_completed,_available,_highlight,_fadeInCross);
         var _loc3_ = this.getNumOfPlanningSlots();
         var _loc2_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
         this.model.repositionPlanningSlots(_loc2_,_loc3_);
      }
      this.repositionHeistNameTitle(1);
   }
   function getNumOfPlanningSlots()
   {
      var _loc3_ = 0;
      var _loc2_ = 14;
      while(_loc2_ < 20)
      {
         if(com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1)).dataList[_loc2_][3] != undefined)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function BLANK_PLANNING_SLOT(_itemSlot)
   {
      this.UPDATE_DATA_SLOT(1,14 + _itemSlot,7,_itemSlot,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
   }
   function SET_STRAND_BOARD_TITLE(_title)
   {
      var _loc2_ = this.CONTENT.strandMC;
      if(_loc2_.strandTitle == undefined)
      {
         _loc2_.attachMovie("strandTitle","strandTitle",_loc2_.getNextHighestDepth(),{_y:6});
      }
      var _loc3_ = _loc2_.strandTitle.titleTF;
      _loc3_.htmlText = _title.toUpperCase();
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(_loc3_,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
   }
   function ADD_STRAND_SLOT(_itemSlot, _txd, _title, _description, _txn1, _completed, _available, _cost)
   {
      _completed = -1;
      var _loc5_ = false;
      var _loc6_ = false;
      if(arguments.length < 2)
      {
         this.SET_DATA_SLOT(2,20 + _itemSlot,8,_itemSlot,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
      }
      else
      {
         this.SET_DATA_SLOT(2,20 + _itemSlot,8,_itemSlot,_txd,_title,_txn1,"","","","","",_completed,_available,_loc5_,_loc6_,_cost);
         var _loc4_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(2));
         this.model.updateStrandSlotLeft(_loc4_,_itemSlot,[_description]);
      }
   }
   function UPDATE_STRAND_SLOT(_itemSlot, _txd, _title, _description, _txn1, _completed, _available, _cost)
   {
      if(this.currentBoard == this.CONTENT.strandMC)
      {
         _completed = -1;
         var _loc4_ = false;
         var _loc5_ = false;
         this.UPDATE_DATA_SLOT(2,20 + _itemSlot,8,_itemSlot,_txd,_title,_txn1,"","","","","",_completed,_available,_loc4_,_loc5_,_cost);
         var _loc2_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(2));
         this.model.updateStrandSlotLeft(_loc2_,_itemSlot,[_description]);
         var _loc6_ = this.getNumOfStrandSlots();
         this.model.repositionStrandSlots(_loc2_,_loc6_);
      }
      this.repositionHeistNameTitle(2);
   }
   function getNumOfStrandSlots()
   {
      var _loc3_ = 0;
      var _loc2_ = 20;
      while(_loc2_ < 26)
      {
         if(com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(2)).dataList[_loc2_][3] != undefined)
         {
            _loc3_ = _loc3_ + 1;
         }
         _loc2_ = _loc2_ + 1;
      }
      return _loc3_;
   }
   function BLANK_STRAND_SLOT(_itemSlot)
   {
      this.UPDATE_DATA_SLOT(2,20 + _itemSlot,8,_itemSlot,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined,undefined);
   }
   function HIDE_PLANNING_SLOT(_itemSlot)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
      _loc2_.itemList[_itemSlot + 14]._visible = false;
      this.model.repositionPlanningSlots(_loc2_,_loc2_.itemList.length - 14);
   }
   function SHOW_PLANNING_SLOT(_itemSlot)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
      _loc2_.itemList[_itemSlot + 14]._visible = true;
      this.model.repositionPlanningSlots(_loc2_,_loc2_.itemList.length - 14);
   }
   function UPDATE_PLANNING_SLOT_LEFT(_itemSlot)
   {
      if(this.currentBoard == this.CONTENT.planningMC)
      {
         var _loc3_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
         this.model.updatePlanningSlotLeft(_loc3_,_itemSlot,arguments.slice(1));
      }
   }
   function UPDATE_PLANNING_SLOT_RIGHT(_itemSlot)
   {
      if(this.currentBoard == this.CONTENT.planningMC)
      {
         var _loc5_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
         var _loc4_ = arguments.slice(1);
         this.model.updatePlanningSlotRight(_loc5_,_itemSlot,_loc4_);
         var _loc3_ = 0;
         while(_loc3_ < _loc4_.length)
         {
            if(_loc4_[_loc3_] && _loc4_[_loc3_] != ".")
            {
               com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1)).itemList[9].showTeamTF();
               break;
            }
            _loc3_ = _loc3_ + 1;
         }
      }
   }
   function UPDATE_PLANNING_SLOT_RIGHT_MEDAL(_itemSlot)
   {
      if(this.currentBoard == this.CONTENT.planningMC)
      {
         var _loc3_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
         this.model.updatePlanningSlotRightMedal(_loc3_,_itemSlot,arguments.slice(1));
      }
   }
   function SHOW_PLANNING_IMAGES(bool)
   {
      var _loc4_ = 20;
      var _loc2_ = 14;
      while(_loc2_ < _loc4_)
      {
         var _loc3_ = com.rockstargames.gtav.levelDesign.heists.selectors.MPPlanningBoard(com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1)).itemList[_loc2_]);
         if(_loc3_ != undefined)
         {
            _loc3_.showImages(bool);
         }
         _loc2_ = _loc2_ + 1;
      }
   }
   function INITIALISE_HEISTBOARD()
   {
      if(this.heistboardInitialised != true)
      {
         this.currentBoard = this.CONTENT.boardMC;
         this.DISPLAY_VIEW(0);
         this.DISPLAY_VIEW(1);
         this.DISPLAY_VIEW(2);
         this.FOCUS_VIEW(0);
         this.CONTENT.planningMC._visible = false;
         this.CONTENT.boardMC._visible = true;
         this.CONTENT.strandMC._visible = false;
         this.heistboardInitialised = true;
         this.LAUNCH_BUTTON_ENABLED(false);
      }
   }
   function INITIALISE_PLANNINGBOARD()
   {
      if(this.planningboardInitialised != true)
      {
         this.currentBoard = this.CONTENT.planningMC;
         this.DISPLAY_VIEW(0);
         this.DISPLAY_VIEW(1);
         this.DISPLAY_VIEW(2);
         this.FOCUS_VIEW(1);
         this.CONTENT.planningMC._visible = true;
         this.CONTENT.boardMC._visible = false;
         this.CONTENT.strandMC._visible = false;
         this.planningboardInitialised = true;
      }
   }
   function INITIALISE_STRANDBOARD()
   {
      if(this.strandboardInitialised != true)
      {
         this.currentBoard = this.CONTENT.strandMC;
         this.DISPLAY_VIEW(0);
         this.DISPLAY_VIEW(1);
         this.DISPLAY_VIEW(2);
         this.FOCUS_VIEW(2);
         this.CONTENT.planningMC._visible = false;
         this.CONTENT.boardMC._visible = false;
         this.CONTENT.strandMC._visible = true;
         this.strandboardInitialised = true;
      }
   }
   function SHOW_HEISTBOARD()
   {
      this.currentBoard = this.CONTENT.boardMC;
      this.FOCUS_VIEW(0,1);
      this.CONTENT.boardMC._visible = true;
      this.CONTENT.planningMC._visible = false;
      this.CONTENT.strandMC._visible = false;
   }
   function SHOW_PLANNINGBOARD()
   {
      this.currentBoard = this.CONTENT.planningMC;
      this.FOCUS_VIEW(1,1);
      this.CONTENT.boardMC._visible = false;
      this.CONTENT.planningMC._visible = true;
      this.CONTENT.strandMC._visible = false;
   }
   function SHOW_STRANDBOARD()
   {
      this.currentBoard = this.CONTENT.strandMC;
      this.FOCUS_VIEW(2,1);
      this.CONTENT.boardMC._visible = false;
      this.CONTENT.planningMC._visible = false;
      this.CONTENT.strandMC._visible = true;
   }
   function SHOW_ALL_TEXT()
   {
      var _loc3_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
      var _loc2_ = 14;
      while(_loc2_ < _loc3_.itemList.length)
      {
         _loc3_.itemList[_loc2_].showAllText();
         _loc2_ = _loc2_ + 1;
      }
   }
   function HIDE_ALL_TEXT()
   {
      var _loc3_ = com.rockstargames.gtav.levelDesign.heists.MPHeistView(this.model.getCurrentView(1));
      var _loc2_ = 14;
      while(_loc2_ < _loc3_.itemList.length)
      {
         _loc3_.itemList[_loc2_].hideAllText();
         _loc2_ = _loc2_ + 1;
      }
   }
   function CLEANUP()
   {
   }
}
