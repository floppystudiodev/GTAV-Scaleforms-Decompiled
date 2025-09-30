class com.rockstargames.gtav.levelDesign.heists.HEIST_ENDSCREEN extends com.rockstargames.ui.core.BaseScriptUI
{
   var CONTENT;
   var percent1;
   var percent2;
   var percent3;
   var percent4;
   var percent5;
   var percent6;
   var percent7;
   var percent8;
   var percent9;
   var pieChart;
   var pieColours;
   var showNumbers = false;
   function HEIST_ENDSCREEN()
   {
      super();
      _global.gfxExtensions = true;
      this.pieColours = new Array();
      this.pieColours.push(new Array(250,0,0));
      this.pieColours.push(new Array(220,0,0));
      this.pieColours.push(new Array(190,0,0));
      this.pieColours.push(new Array(160,0,0));
      this.pieColours.push(new Array(130,0,0));
      this.pieColours.push(new Array(100,0,0));
      this.pieColours.push(new Array(70,0,0));
      this.pieColours.push(new Array(40,0,0));
      this.pieColours.push(new Array(10,0,0));
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.pieChart = this.CONTENT.pieChart;
   }
   function SHOW_PIECHART_NUMBERS(vis)
   {
   }
   function SET_PIECHART_COLOURS(playerNum, R1, G1, B1)
   {
      var _loc2_ = playerNum - 1;
      this.pieColours[_loc2_] = [R1,G1,B1];
   }
   function SET_PIE_CHART()
   {
      var _loc3_ = new Array();
      _loc3_ = arguments;
      var _loc10_;
      var _loc6_ = this.pieChart.playerCutTF.getNewTextFormat();
      if(typeof _loc3_[0] == "number")
      {
         _loc3_.unshift("");
         this.pieChart.playerCutTF._y = -20.55;
         _loc6_.size = 36;
         _loc10_ = true;
      }
      else
      {
         this.pieChart.playerCutTF._y = -3.55;
         _loc6_.size = 26;
         _loc10_ = false;
      }
      this.pieChart.playerCutTF.setNewTextFormat(_loc6_);
      if(_loc3_[0] != undefined)
      {
         this.pieChart.cashTF.textColor = 16777215;
         this.pieChart.cashTF.textAutoSize = "shrink";
         this.pieChart.cashTF.text = _loc3_[0];
      }
      var _loc4_;
      var _loc12_;
      var _loc8_;
      var _loc5_;
      var _loc11_;
      var _loc9_;
      if(_loc3_[1] != undefined)
      {
         this.pieChart.playerCutTF.textColor = 16777215;
         this.pieChart.playerCutTF.textAutoSize = "shrink";
         _loc4_ = _loc3_[1].toString();
         if(_loc10_ == true)
         {
            this.pieChart.playerCutTF.text = _loc4_ + "%";
         }
         else
         {
            if(_loc4_.length > 3)
            {
               _loc12_ = _loc4_.length;
               _loc8_ = "";
               _loc5_ = _loc4_.slice(0,-3);
               _loc11_ = "," + _loc4_.slice(-3);
               if(_loc5_.length > 3)
               {
                  _loc8_ = _loc5_.slice(0,-3) + ",";
                  _loc5_ = _loc5_.slice(-3);
               }
               _loc9_ = _loc8_ + _loc5_ + _loc11_;
            }
            else
            {
               _loc9_ = _loc4_;
            }
            this.pieChart.playerCutTF.text = "$" + _loc9_;
         }
      }
      if(_loc3_[2] != undefined)
      {
         this.percent1 = Math.round(_loc3_[2]);
      }
      else
      {
         this.percent1 = 0;
      }
      if(_loc3_[3] != undefined)
      {
         this.percent2 = Math.round(_loc3_[3]);
      }
      else
      {
         this.percent2 = 0;
      }
      if(_loc3_[4] != undefined)
      {
         this.percent3 = Math.round(_loc3_[4]);
      }
      else
      {
         this.percent3 = 0;
      }
      if(_loc3_[5] != undefined)
      {
         this.percent4 = Math.round(_loc3_[5]);
      }
      else
      {
         this.percent4 = 0;
      }
      if(_loc3_[6] != undefined)
      {
         this.percent5 = Math.round(_loc3_[6]);
      }
      else
      {
         this.percent5 = 0;
      }
      if(_loc3_[7] != undefined)
      {
         this.percent6 = Math.round(_loc3_[7]);
      }
      else
      {
         this.percent6 = 0;
      }
      if(_loc3_[8] != undefined)
      {
         this.percent7 = Math.round(_loc3_[8]);
      }
      else
      {
         this.percent7 = 0;
      }
      if(_loc3_[9] != undefined)
      {
         this.percent8 = Math.round(_loc3_[9]);
      }
      else
      {
         this.percent8 = 0;
      }
      if(_loc3_[10] != undefined)
      {
         this.percent9 = Math.round(_loc3_[10]);
      }
      else
      {
         this.percent9 = 0;
      }
      this.drawArc(this.pieChart.pie1,0,this.percent1,1,this.pieColours[0][0],this.pieColours[0][1],this.pieColours[0][2]);
      this.drawArc(this.pieChart.pie2,this.percent1,this.percent2,2,this.pieColours[1][0],this.pieColours[1][1],this.pieColours[1][2]);
      this.drawArc(this.pieChart.pie3,this.percent1 + this.percent2,this.percent3,3,this.pieColours[2][0],this.pieColours[2][1],this.pieColours[2][2]);
      this.drawArc(this.pieChart.pie4,this.percent1 + this.percent2 + this.percent3,this.percent4,4,this.pieColours[3][0],this.pieColours[3][1],this.pieColours[3][2]);
      this.drawArc(this.pieChart.pie5,this.percent1 + this.percent2 + this.percent3 + this.percent4,this.percent5,5,this.pieColours[4][0],this.pieColours[4][1],this.pieColours[4][2]);
      this.drawArc(this.pieChart.pie6,this.percent1 + this.percent2 + this.percent3 + this.percent4 + this.percent5,this.percent6,6,this.pieColours[5][0],this.pieColours[5][1],this.pieColours[5][2]);
      this.drawArc(this.pieChart.pie7,this.percent1 + this.percent2 + this.percent3 + this.percent4 + this.percent5 + this.percent6,this.percent7,7,this.pieColours[6][0],this.pieColours[6][1],this.pieColours[6][2]);
      this.drawArc(this.pieChart.pie8,this.percent1 + this.percent2 + this.percent3 + this.percent4 + this.percent5 + this.percent6 + this.percent7,this.percent8,8,this.pieColours[7][0],this.pieColours[7][1],this.pieColours[7][2]);
      this.drawArc(this.pieChart.pie9,this.percent1 + this.percent2 + this.percent3 + this.percent4 + this.percent5 + this.percent6 + this.percent7 + this.percent8,this.percent9,9,this.pieColours[8][0],this.pieColours[8][1],this.pieColours[8][2]);
      var _loc7_ = this.percent1 + this.percent2 + this.percent3 + this.percent4 + this.percent5 + this.percent6 + this.percent7 + this.percent8 + this.percent9;
      if(_loc7_ > 100)
      {
         trace("HEIST_ENDSCREEN.gfx ERROR! Script has passed percentage values for piechart that when added up exceed 100%. Current values add up to:" + _loc7_);
         trace("HEIST_ENDSCREEN.gfx percent1:" + this.percent1);
         trace("HEIST_ENDSCREEN.gfx percent2:" + this.percent2);
         trace("HEIST_ENDSCREEN.gfx percent3:" + this.percent3);
         trace("HEIST_ENDSCREEN.gfx percent4:" + this.percent4);
         trace("HEIST_ENDSCREEN.gfx percent5:" + this.percent5);
         trace("HEIST_ENDSCREEN.gfx percent6:" + this.percent6);
         trace("HEIST_ENDSCREEN.gfx percent7:" + this.percent7);
         trace("HEIST_ENDSCREEN.gfx percent8:" + this.percent8);
         trace("HEIST_ENDSCREEN.gfx percent9:" + this.percent9);
      }
   }
   function drawArc(pieMC, rotation, percent, pieNumber, _r, _g, _b)
   {
      if(percent != undefined && percent > 0)
      {
         pieMC.pieSlices._rotation = rotation * 3.6;
         pieMC.pieSlices.gotoAndStop(percent);
         com.rockstargames.ui.utils.Colour.Colourise(pieMC.pieSlices,_r,_g,_b,100);
      }
      else
      {
         pieMC.pieSlices._alpha = 0;
      }
   }
}
