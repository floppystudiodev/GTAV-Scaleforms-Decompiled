class com.rockstargames.gtav.cellphone.apps.APP_TODO_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var CONTENT;
   var TIMELINE;
   var TextBlackHex;
   var TextWhiteHex;
   var arrayStartPoint;
   var container;
   var currentStyle;
   var dataProviderUI;
   var gfxFileName;
   var linkageID;
   var offWhiteRGB;
   var row;
   var scrollBar;
   var scrollBarTimeout;
   var defaultRowHeight = 48;
   var numberOfVisibleRows = 5;
   function APP_TODO_LIST()
   {
      super();
      this.scrollBar = new com.rockstargames.ui.controls.ScrollBar();
   }
   function INITIALISE(mc)
   {
      this.TIMELINE = mc;
      this.CONTENT = this.TIMELINE;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.toDoListDataProviderUI;
      clearInterval(this.scrollBarTimeout);
      var _loc3_ = this.TIMELINE.bg;
      switch(this.gfxFileName)
      {
         case "CELLPHONE_FACADE":
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,0,0,0,100);
            break;
         case "CELLPHONE_IFRUIT":
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,238,233,176,100);
            com.rockstargames.ui.utils.Colour.Colourise(_level0.TIMELINE.infoBar.headerBackground,136,118,104,100);
            break;
         default:
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      }
      this.linkageID = "toDoList-" + this.gfxFileName.substr(10);
      this.numberOfVisibleRows = 5;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.toDoListDataProviderUI;
      this.row = 1;
      var _loc4_;
      var _loc2_;
      var _loc3_;
      if(this.numberOfVisibleRows > 0)
      {
         _loc4_ = 0;
         while(_loc4_ < this.numberOfVisibleRows)
         {
            _loc2_ = "listItem" + this.row;
            _loc3_ = _loc4_ + this.arrayStartPoint;
            this.container[_loc2_].todoLabel.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.container[_loc2_].todoLabel,this.dataProviderUI[_loc3_][1]);
            this.container[_loc2_].todoDescription.text = com.rockstargames.ui.utils.FitToTextfield.capText(this.container[_loc2_].todoDescription,this.dataProviderUI[_loc3_][2]);
            if(this.dataProviderUI[_loc3_][0])
            {
               this.container[_loc2_].todoPercent.text = this.dataProviderUI[_loc3_][0] + "%";
            }
            this.row = this.row + 1;
            _loc4_ = _loc4_ + 1;
         }
      }
   }
   function setState(item, isActive)
   {
      if(this.numberOfVisibleRows > 0)
      {
         if(this.gfxFileName == "CELLPHONE_IFRUIT")
         {
            if(isActive)
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,136,118,104,100);
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
               item.todoLabel.textColor = this.TextWhiteHex;
               item.todoDescription.textColor = this.TextWhiteHex;
               item.todoPercent.textColor = this.TextWhiteHex;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,238,233,176,100);
               com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2]);
               item.todoLabel.textColor = 5457729;
               item.todoDescription.textColor = 5457729;
               item.todoPercent.textColor = 5457729;
            }
         }
         else if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            item.todoLabel.textColor = this.TextWhiteHex;
            item.todoDescription.textColor = this.TextWhiteHex;
            item.todoPercent.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[3][0],this.currentStyle[3][1],this.currentStyle[3][2]);
            com.rockstargames.ui.utils.Colour.Colourise(item.icon,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2]);
            item.todoLabel.textColor = this.TextBlackHex;
            item.todoDescription.textColor = this.TextBlackHex;
            item.todoPercent.textColor = this.TextBlackHex;
         }
      }
   }
}
