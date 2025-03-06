class com.rockstargames.gtav.ng.Replay.COL_TYPE_LOAD_PROJ_INFO extends com.rockstargames.gtav.ng.Replay.ReplayBaseItemIMG
{
   var myHeight;
   var bgMC;
   var hudColourBlack;
   var bgMCLower;
   var labelMC;
   var _helptextItem;
   var APP_DATA;
   var _hudColourGreen;
   var _hudColourOrange;
   var _hudColourRed;
   var MAX_CHARS_OPTIONS = 14;
   function COL_TYPE_LOAD_PROJ_INFO()
   {
      super();
      this.myHeight = 241;
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMCLower,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.uploadStatus.bgMC,this.hudColourBlack.r,this.hudColourBlack.g,this.hudColourBlack.b,this.BLACK_ALPHA);
      this.showUploadProgress(false);
      this._helptextItem = com.rockstargames.gtav.ng.Replay.COL_TYPE_LIST_HELP(this.attachMovie("COL_TYPE_LIST_HELP","helpTextItemProjDetails",this.getNextHighestDepth(),{_x:this.bgMCLower._x,_y:this.bgMCLower._y}));
      this._helptextItem._visible = false;
   }
   function set data(_d)
   {
      super.data = _d;
      this.APP_DATA = _d[0];
      this.loadComponent(_d[1],_d[2]);
      this.clearIfUndefinied(this.labelMC.row_1_col_1_TF,_d[3]);
      this.shortenAndSetStr(_d[4],this.labelMC.row_1_col_2_TF,this.MAX_CHARS_OPTIONS);
      this.clearIfUndefinied(this.labelMC.row_2_col_1_TF,_d[5]);
      this.clearIfUndefinied(this.labelMC.row_2_col_2_TF,_d[6]);
      this.clearIfUndefinied(this.labelMC.row_3_col_1_TF,_d[7]);
      this.clearIfUndefinied(this.labelMC.row_3_col_2_TF,_d[8]);
      this.clearIfUndefinied(this.labelMC.row_4_col_1_TF,_d[9]);
      this.clearIfUndefinied(this.labelMC.row_4_col_2_TF,_d[10]);
      if(_d[12] != undefined && _d[13] != undefined)
      {
         this.clearIfUndefinied(this.labelMC.row_5_col_1_TF,_d[11]);
         this.updateUploadProgress(_d[12]);
         this.setUploadStatusState(_d[13]);
         this.showUploadProgress(true);
      }
      else
      {
         this.showUploadProgress(false);
         if(_d[11] != undefined)
         {
            var _loc4_ = this.bgMCLower._y + this.bgMCLower._height + 4;
            this._helptextItem._y = _loc4_;
            this._helptextItem.data = _d[11];
            this._helptextItem._visible = true;
         }
      }
   }
   function updateUploadProgress(label)
   {
      this.labelMC.uploadStatus.itemTF.text = label;
      this.labelMC.uploadStatus.bgMC._width = this.labelMC.uploadStatus.itemTF.textWidth + 10;
      this.labelMC.uploadStatus.bgMC._x = 145 - this.labelMC.uploadStatus.bgMC._width;
   }
   function setUploadStatusState(stateId)
   {
      var _loc2_ = undefined;
      switch(stateId)
      {
         case 0:
            _loc2_ = this._hudColourGreen;
            break;
         case 1:
            _loc2_ = this._hudColourOrange;
            break;
         case 2:
            _loc2_ = this._hudColourRed;
      }
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.uploadStatus.bgMC,_loc2_.r,_loc2_.g,_loc2_.b,100);
   }
   function set highlighted(_h)
   {
   }
   function initColors(receivedColours)
   {
      this._hudColourGreen = new com.rockstargames.ui.utils.HudColourLite();
      this._hudColourGreen.r = receivedColours[2][0];
      this._hudColourGreen.g = receivedColours[2][1];
      this._hudColourGreen.b = receivedColours[2][2];
      this._hudColourOrange = new com.rockstargames.ui.utils.HudColourLite();
      this._hudColourOrange.r = receivedColours[3][0];
      this._hudColourOrange.g = receivedColours[3][1];
      this._hudColourOrange.b = receivedColours[3][2];
      this._hudColourRed = new com.rockstargames.ui.utils.HudColourLite();
      this._hudColourRed.r = receivedColours[4][0];
      this._hudColourRed.g = receivedColours[4][1];
      this._hudColourRed.b = receivedColours[4][2];
      com.rockstargames.ui.utils.Colour.Colourise(this.bgMC,receivedColours[0][0],receivedColours[0][1],receivedColours[0][2],70);
      com.rockstargames.ui.utils.Colour.Colourise(this.labelMC.uploadStatus.bgMC,this._hudColourRed.r,this._hudColourRed.g,this._hudColourRed.b,100);
      this._helptextItem.initColours(receivedColours);
   }
   function showUploadProgress(isVisible)
   {
      if(isVisible)
      {
         this.bgMCLower._height = 133;
      }
      else
      {
         this.bgMCLower._height = 106;
      }
      this.labelMC.row_5_col_1_TF._visible = isVisible;
      this.labelMC.uploadStatus._visible = isVisible;
   }
   function shortenAndSetStr(str, tf, maxChars)
   {
      if(str == undefined)
      {
         return undefined;
      }
      var _loc1_ = "";
      if(str.length > maxChars)
      {
         _loc1_ = str.substring(0,maxChars) + "...";
      }
      else
      {
         _loc1_ = str;
      }
      tf.htmlText = _loc1_;
   }
}
