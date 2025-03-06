class com.rockstargames.gtav.cellphone.apps.APP_JOB_LIST extends com.rockstargames.gtav.cellphone.apps.APP_ScrollingList
{
   var scrollBar;
   var TIMELINE;
   var CONTENT;
   var dataProviderUI;
   var scrollBarTimeout;
   var gfxFileName;
   var currentStyle;
   var linkageID;
   var row;
   var container;
   var TextWhiteHex;
   var offWhiteRGB;
   var TextBlackHex;
   var defaultRowHeight = 80;
   var numberOfVisibleRows = 3;
   function APP_JOB_LIST()
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
      this.dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
      clearInterval(this.scrollBarTimeout);
      var _loc3_ = this.TIMELINE.bg;
      switch(this.gfxFileName)
      {
         case "CELLPHONE_FACADE":
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,0,0,0,100);
            break;
         case "CELLPHONE_IFRUIT":
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,0,0,0,100);
            break;
         default:
            com.rockstargames.ui.utils.Colour.Colourise(_loc3_,this.currentStyle[4][0],this.currentStyle[4][1],this.currentStyle[4][2],100);
      }
      this.linkageID = "jobList-" + this.gfxFileName.substr(10);
      this.numberOfVisibleRows = 5;
      super.construct(this.CONTENT,this.linkageID,this.dataProviderUI);
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.jobListDataProviderUI;
      this.row = 1;
      if(this.numberOfVisibleRows > 0)
      {
         var _loc3_ = 0;
         while(_loc3_ < this.numberOfVisibleRows)
         {
            var _loc2_ = "listItem" + this.row;
            var _loc4_ = _loc3_ + this.arrayStartPoint;
            var _loc6_ = this.dataProviderUI[_loc4_][0];
            this.parseForGamerName(this.container[_loc2_].jobLabel,_loc6_);
            var _loc7_ = new com.rockstargames.ui.utils.Text();
            if(this.container[_loc2_].blipLayerMC)
            {
               this.container[_loc2_].blipLayerMC.removeMovieClip();
            }
            this.container[_loc2_].createEmptyMovieClip("blipLayerMC",1000);
            var _loc5_ = this.container[_loc2_].jobDescription.textColor;
            _loc7_.setTextWithIcons(this.dataProviderUI[_loc4_][1],this.container[_loc2_].blipLayerMC,this.container[_loc2_].jobDescription,0,16,1,false);
            this.container[_loc2_].jobDescription.textColor = _loc5_;
            this.container[_loc2_].jobLabel.textColor = _loc5_;
            this.row = this.row + 1;
            _loc3_ = _loc3_ + 1;
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
               com.rockstargames.ui.utils.Colour.Colourise(item.background,149,207,152,100);
               item.jobLabel.textColor = 5457729;
               item.jobDescription.textColor = 5457729;
            }
            else
            {
               com.rockstargames.ui.utils.Colour.Colourise(item.background,230,230,230,100);
               item.jobLabel.textColor = 5457729;
               item.jobDescription.textColor = 5457729;
            }
         }
         else if(isActive)
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.currentStyle[1][0],this.currentStyle[1][1],this.currentStyle[1][2],100);
            item.jobLabel.textColor = this.TextWhiteHex;
            item.jobDescription.textColor = this.TextWhiteHex;
         }
         else
         {
            com.rockstargames.ui.utils.Colour.Colourise(item.background,this.offWhiteRGB[0],this.offWhiteRGB[1],this.offWhiteRGB[2],100);
            item.jobLabel.textColor = this.TextBlackHex;
            item.jobDescription.textColor = this.TextBlackHex;
         }
      }
   }
   function parseForGamerName(TF, str)
   {
      var _loc5_ = str.indexOf("<C>");
      var _loc6_ = str.indexOf("</C>");
      var _loc7_ = _loc5_ != -1 && _loc6_ != -1;
      if(_loc7_)
      {
         var _loc10_ = 16;
         var _loc3_ = str.substring(0,_loc5_);
         var _loc1_ = str.substring(_loc5_ + 3,_loc6_);
         var _loc8_ = str.substring(_loc6_ + 4);
         if(_loc1_.length > _loc10_)
         {
            _loc1_ = _loc1_.substring(0,_loc10_) + "...";
         }
         str = _loc3_ + _loc1_ + _loc8_;
         var _loc9_ = new TextFormat("$Font2",18,0);
         var _loc11_ = new TextFormat("$Font2_cond",24,0);
         TF.text = str;
         TF.setTextFormat(0,_loc3_.length,_loc9_);
         TF.setTextFormat(_loc3_.length,_loc3_.length + _loc1_.length,_loc11_);
         TF.setTextFormat(_loc3_.length + _loc1_.length,_loc3_.length + _loc1_.length + _loc8_.length,_loc9_);
         TF._height = 50;
      }
      else
      {
         TF.text = com.rockstargames.ui.utils.FitToTextfield.capText(TF,str);
      }
      return _loc7_;
   }
}
