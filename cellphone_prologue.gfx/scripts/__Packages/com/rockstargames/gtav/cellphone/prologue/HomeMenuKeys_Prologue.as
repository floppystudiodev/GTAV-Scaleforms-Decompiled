class com.rockstargames.gtav.cellphone.prologue.HomeMenuKeys_Prologue extends com.rockstargames.ui.core.PhoneUIComponent
{
   var TextBlackHex;
   var container;
   var currentID;
   var currentKey;
   var dataProviderUI;
   var menuTitleBar;
   var needsScrollbars;
   var offsetY;
   var previousKey;
   var scrollBar;
   var menuTitle = "";
   var numberOfRows = 0;
   function HomeMenuKeys_Prologue()
   {
      super();
   }
   function constructAndPopulateContent()
   {
      var _loc8_ = 250;
      var _loc5_ = 120;
      this.scrollBar.construct(this.container,"scrubber","gutter",_loc8_,this.offsetY,_loc5_);
      this.scrollBar.scrollBarContainer.scrubber._height = _loc5_ / this.dataProviderUI.length;
      this.scrollBar.scrollBarContainer.scrubber._y = this.scrollBar.scrollBarContainer.gutter._y + this.scrollBar.scrollBarContainer.scrubber._height * Math.floor(this.dataProviderUI.length / 2);
      this.setScrollBarVisibility(true);
      var _loc6_;
      var _loc3_;
      var _loc7_ = 0;
      this.needsScrollbars = false;
      if(this.currentID == undefined)
      {
         this.currentID = 4;
      }
      this.menuTitleBar = this.container.menuTitleBar;
      this.menuTitleBar.menuTitle.textColor = this.TextBlackHex;
      var _loc10_ = 1;
      var _loc9_ = 1;
      var _loc2_ = "1_1";
      var _loc4_ = "c1_1";
      if(this.container[_loc4_])
      {
         this.container[_loc4_]._name = _loc2_;
      }
      _loc6_ = this.dataProviderUI[this.currentID][0];
      _loc7_ = this.dataProviderUI[this.currentID][1];
      _loc3_ = this.dataProviderUI[this.currentID][2];
      this.container[_loc2_]._id = this.currentID;
      this.currentKey = this.container[_loc2_];
      this.setState(this.currentKey,true);
      this.currentSelection = this.currentKey._id;
      this.previousKey = this.container[_loc2_];
      if(_loc3_ != undefined)
      {
         this.container[_loc2_].menuIconTitle.text = _loc3_;
      }
      if(_loc6_ != undefined)
      {
         this.setIcon(this.container[_loc2_],_loc6_);
      }
      this.numberOfRows = 1;
   }
   function navigate(direction)
   {
      super.navigate(direction);
      this.scrollBar.scrollBarContainer.scrubber._y = this.scrollBar.scrollBarContainer.gutter._y + this.scrollBar.scrollBarContainer.scrubber._height * this.currentSelection;
   }
   function setIcon(target, menuIconFrameEnum)
   {
      target.homeMenuIcons.gotoAndStop("CALL");
   }
   function setScrollBarVisibility(isVisible)
   {
      this.scrollBar.scrollBarContainer._visible = isVisible;
   }
   function setState(item, isActive)
   {
      item._visible = isActive;
   }
}
