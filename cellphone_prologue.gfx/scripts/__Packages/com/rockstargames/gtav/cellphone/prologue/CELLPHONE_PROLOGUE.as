class com.rockstargames.gtav.cellphone.prologue.CELLPHONE_PROLOGUE extends MovieClip
{
   var TIMELINE;
   var CONTENT;
   var currentInterface;
   var previousInterface;
   var layerOne;
   var layerTwo;
   var layerThree;
   var layerFour;
   var keyboardlayer;
   var cellphoneButtons;
   var viewMethod;
   var componentArray;
   var homeMenuKeys;
   var contactsList;
   var callScreen;
   var phoneWidth = 256;
   var phoneHeight = 344;
   var offSCreenLeftX = -256;
   var offSCreenRightX = 256;
   var onSCreenX = 0;
   var currentDay = "";
   var currentStyle = new Array();
   var prologueTransitionTime = 0;
   function CELLPHONE_PROLOGUE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE.CONTENT;
      this.currentInterface.levelDepth = -1;
      this.previousInterface = new com.rockstargames.ui.core.PhoneUIComponent();
      this.layerOne = this.CONTENT.layerOne;
      this.layerTwo = this.CONTENT.layerTwo;
      this.layerThree = this.CONTENT.layerThree;
      this.layerFour = this.CONTENT.layerFour;
      this.keyboardlayer = this.CONTENT.keyboardlayer;
      this.cellphoneButtons = this.CONTENT.cellphoneButtons;
      this.viewMethod = {};
      this.viewMethod[0] = ["SHUTDOWN_MOVIE"];
      this.viewMethod[1] = ["HOME_MENU"];
      this.viewMethod[2] = ["CONTACT_LIST"];
      this.viewMethod[4] = ["CALL_SCREEN"];
      var _loc2_ = new flash.geom.Transform(this.CONTENT);
      var _loc3_ = new flash.geom.ColorTransform(1,1,1,1,-45,-45,-45,0);
      _loc2_.colorTransform = _loc3_;
      this.componentArray = ["","homeMenuKeys","contactsList","","callScreen"];
      this.currentStyle = com.rockstargames.gtav.cellphone.CellphoneStyles.Prologue;
   }
   function GET_CURRENT_SELECTION()
   {
      if(isNaN(this.currentInterface.GET_CURRENT_SELECTION()))
      {
         return -1;
      }
      return this.currentInterface.GET_CURRENT_SELECTION();
   }
   function SET_TITLEBAR_TIME(newHour, newMinute, newDay)
   {
   }
   function SET_SLEEP_MODE(isSleepModeActive)
   {
   }
   function SET_HEADER(newHeader)
   {
      var _loc2_ = undefined;
      this.currentInterface.header.headerText.text = newHeader;
      _loc2_ = 114 - this.currentInterface.header.headerText.textWidth / 2;
      this.currentInterface.header.headerLineLeft._width = _loc2_;
      this.currentInterface.header.headerLineLeftShadow._width = _loc2_;
      this.currentInterface.header.headerLineRight._width = _loc2_ - 10;
      this.currentInterface.header.headerLineRightShadow._width = _loc2_ - 10;
      this.currentInterface.header.depthText.text = this.currentInterface.levelDepth;
   }
   function SET_SOFT_KEYS_COLOUR(buttonID, ired, igreen, iblue, ialpha)
   {
      var _loc2_ = undefined;
      switch(buttonID)
      {
         case 1:
            _loc2_ = this.cellphoneButtons.textLabelPositiveMC;
            break;
         case 2:
            _loc2_ = this.cellphoneButtons.textLabelOtherMC;
            break;
         case 3:
            _loc2_ = this.cellphoneButtons.textLabelNegativeMC;
      }
      com.rockstargames.ui.utils.Colour.Colourise(_loc2_,ired,igreen,iblue,ialpha);
   }
   function SET_SOFT_KEYS(buttonID, isVisible, iconEnum, textLabel)
   {
      var _loc3_ = undefined;
      if(textLabel == undefined)
      {
         textLabel = "";
      }
      switch(buttonID)
      {
         case 1:
            _loc3_ = this.cellphoneButtons.textLabelPositiveMC;
            this.cellphoneButtons.textLabelPositiveMC.textLabelPositive.text = textLabel;
            break;
         case 2:
            _loc3_ = this.cellphoneButtons.textLabelOtherMC;
            this.cellphoneButtons.textLabelOtherMC.textLabelOther.text = textLabel;
            break;
         case 3:
            _loc3_ = this.cellphoneButtons.textLabelNegativeMC;
            this.cellphoneButtons.textLabelNegativeMC.textLabelNegative.text = textLabel;
      }
      _loc3_._visible = isVisible;
   }
   function updateSoftKeys(currentClip)
   {
   }
   function updateInfoBar(currentClip)
   {
   }
   function SET_UI_COLOUR(id, r, g, b)
   {
   }
   function COLOUR_INFOBAR()
   {
   }
   function SET_BACKGROUND_IMAGE(image_enum)
   {
   }
   function SET_PROVIDER_ICON(icon_enum)
   {
   }
   function SET_THEME(themeID)
   {
   }
   function checkClassExists(viewID)
   {
      switch(viewID)
      {
         case 1:
            this.homeMenuKeys = new com.rockstargames.gtav.cellphone.prologue.HomeMenuKeys_Prologue();
            break;
         case 2:
            this.contactsList = new com.rockstargames.gtav.cellphone.prologue.ContactList_Prologue();
            break;
         case 4:
            this.callScreen = new com.rockstargames.gtav.cellphone.prologue.CallScreen_Prologue();
      }
   }
   function SET_DATA_SLOT_EMPTY(viewID)
   {
      if(this[this.componentArray[viewID]] == undefined)
      {
         this.checkClassExists(viewID);
      }
      this[this.componentArray[viewID]].dataProviderUI = new Array();
   }
   function SET_DATA_SLOT(viewID, slotID)
   {
      var _loc4_ = arguments.slice(2);
      if(this[this.componentArray[viewID]] == undefined)
      {
         this.checkClassExists(viewID);
      }
      this[this.componentArray[viewID]].dataProviderUI[slotID] = _loc4_;
   }
   function GET_DATA(viewID)
   {
      var _loc3_ = "";
      var _loc2_ = undefined;
      _loc2_ = this[this.componentArray[viewID]].dataProviderUI;
      for(var _loc4_ in _loc2_)
      {
         _loc3_ += _loc2_[_loc4_];
      }
      return _loc3_;
   }
   function DISPLAY_VIEW(viewID, currentID)
   {
      this[this.viewMethod[viewID]](currentID);
   }
   function HOME_MENU(_currentID)
   {
      this.homeMenuKeys._name = "HOME_MENU";
      this.homeMenuKeys.numberOfColumns = 1;
      this.homeMenuKeys.numberOfVisibleRows = 1;
      this.homeMenuKeys.levelDepth = 1;
      this.homeMenuKeys.currentStyle = this.currentStyle;
      this.homeMenuKeys.TextWhiteHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextWhiteHex;
      this.homeMenuKeys.TextBlackHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextBlackHex;
      this.homeMenuKeys.currentID = _currentID;
      this.homeMenuKeys.container = this.layerOne;
      this.homeMenuKeys.constructAndPopulateContent();
      this.createPrologueTransition(this.currentInterface,this.homeMenuKeys);
      this.currentInterface = this.homeMenuKeys;
      this.toggleCellphoneButtonsVisible(true);
   }
   function CONTACT_LIST(_currentID)
   {
      this.contactsList._name = "CONTACT_LIST";
      this.contactsList.numberOfVisibleRows = 3;
      this.contactsList.levelDepth = 2;
      this.contactsList.rowSpace = 0;
      this.contactsList.offsetX = 0;
      this.contactsList.offsetY = 40;
      this.contactsList.currentID = _currentID;
      this.contactsList.currentStyle = this.currentStyle;
      this.contactsList.TextWhiteHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextWhiteHex;
      this.contactsList.TextBlackHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextBlackHex;
      this.contactsList.construct(this.layerTwo,"listItemMC");
      if(this.currentInterface != this.contactsList)
      {
         this.createPrologueTransition(this.currentInterface,this.contactsList);
         this.currentInterface = this.contactsList;
         return true;
      }
   }
   function CALL_SCREEN(state)
   {
      this.callScreen._name = "CALL_SCREEN";
      this.callScreen.callState = state;
      this.callScreen.levelDepth = 3;
      this.callScreen.offsetX = 0;
      this.callScreen.offsetY = 0;
      this.callScreen.currentStyle = this.currentStyle;
      this.callScreen.TextBlackHex = com.rockstargames.gtav.cellphone.CellphoneStyles.TextBlackHex;
      this.callScreen.construct(this.layerFour,"currentContact");
      if(this.currentInterface != this.callScreen)
      {
         this.createPrologueTransition(this.currentInterface,this.callScreen);
         this.currentInterface = this.callScreen;
         return true;
      }
   }
   function SHUTDOWN_MOVIE()
   {
   }
   function SET_INPUT_EVENT(direction)
   {
      switch(direction)
      {
         case 1:
            this.currentInterface.navigate("UP");
            break;
         case 2:
            this.currentInterface.navigate("RIGHT");
            break;
         case 3:
            this.currentInterface.navigate("DOWN");
            break;
         case 4:
            this.currentInterface.navigate("LEFT");
      }
   }
   function createPrologueTransition(previousClip, currentClip)
   {
      this.updateSoftKeys(currentClip);
      currentClip.container._x = 0;
      currentClip.container._y = 0;
      currentClip.SHOW();
      if(previousClip.container != undefined)
      {
         previousClip.HIDE();
      }
   }
   function toggleCellphoneButtonsVisible(isVisible)
   {
      this.CONTENT.cellphoneButtons._visible = isVisible;
   }
}
