class com.rockstargames.gtav.cellphone.apps.XYZ extends MovieClip
{
   var CONTENT;
   var dataProviderUI;
   var currentSelection = -1;
   function XYZ()
   {
      super();
      _global.gfxExtensions = true;
      this.CONTENT = this;
   }
   function construct()
   {
      this.dataProviderUI = _level0.TIMELINE.xyzDataProvider;
      _level0.TIMELINE.SET_HEADER();
      this.renderContainers();
   }
   function renderContainers()
   {
      this.populateContent();
   }
   function populateContent()
   {
      this.dataProviderUI = _level0.TIMELINE.xyzDataProvider;
      var _loc2_ = this.dataProviderUI[0][0];
      this.CONTENT.gotoAndStop(_loc2_ + 1);
      var _loc13_ = this.dataProviderUI[0][1];
      var _loc11_ = this.dataProviderUI[0][2];
      var _loc16_ = this.dataProviderUI[0][3];
      var _loc9_ = this.dataProviderUI[0][4];
      var _loc15_ = this.dataProviderUI[0][5];
      var _loc7_ = this.dataProviderUI[0][6];
      var _loc14_ = this.dataProviderUI[0][7];
      this.CONTENT.YouHeader_TF.text = _loc13_;
      this.CONTENT.You_X_TF.text = _loc16_;
      this.CONTENT.You_Y_TF.text = _loc15_;
      this.CONTENT.You_Z_TF.text = _loc14_;
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.You_X_TF,_loc11_);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.You_Y_TF,_loc9_);
      com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.You_Z_TF,_loc7_);
      if(!_loc2_)
      {
         var _loc6_ = this.dataProviderUI[0][8];
         var _loc4_ = this.dataProviderUI[0][9];
         var _loc10_ = this.dataProviderUI[0][10];
         var _loc5_ = this.dataProviderUI[0][11];
         var _loc8_ = this.dataProviderUI[0][12];
         var _loc3_ = this.dataProviderUI[0][13];
         var _loc12_ = this.dataProviderUI[0][14];
         this.CONTENT.TargetHeader_TF.text = _loc6_;
         this.CONTENT.Target_X_TF.text = _loc10_;
         this.CONTENT.Target_Y_TF.text = _loc8_;
         this.CONTENT.Target_Z_TF.text = _loc12_;
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.Target_X_TF,_loc4_);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.Target_Y_TF,_loc5_);
         com.rockstargames.ui.utils.Colour.ApplyHudColourToTF(this.CONTENT.Target_Z_TF,_loc3_);
      }
   }
   function CLOSE_APP()
   {
      this.dataProviderUI = [];
   }
}
