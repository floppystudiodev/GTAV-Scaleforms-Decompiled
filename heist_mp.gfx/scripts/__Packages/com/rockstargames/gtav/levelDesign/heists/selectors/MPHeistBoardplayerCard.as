class com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardplayerCard extends com.rockstargames.ui.components.GUIMenuItem
{
   var statStrings;
   var statLabels;
   var cardPos;
   var playerSlot;
   var card;
   var numItems = 0;
   var vehString = "";
   var rankString = "";
   var KdRatioString = "";
   function MPHeistBoardplayerCard()
   {
      super();
      _global.gfxExtensions = true;
      this.statStrings = new Array("","","","","","","");
      this.statLabels = new Array("PCARD_STAMINA","PCARD_SHOOTING","PCARD_STEALTH","PCARD_FLYING","PCARD_DRIVING","PCARD_MENTAL_STATE","PCARD_STRENGTH");
      this.cardPos = new Array([0,-2,0],[-4,2,1],[-6,5,0],[6,9,2],[1,12,-1],[-3,15,0],[-2,17,-3],[-4,19,2]);
   }
   function set data(_d)
   {
      this._data = _d.slice(2);
      this.playerSlot = this._data[0];
      var _loc10_ = "card" + this.playerSlot;
      this.card = this[_loc10_];
      if(this._data[1] == undefined)
      {
         if(this.card != undefined)
         {
            this.card.removePedHeadRef();
            this.card.removeMovieClip();
         }
      }
      else
      {
         if(this.card == undefined)
         {
            this.card = this.attachMovie("playerCardMC",_loc10_,100 - this.playerSlot,{_x:this.cardPos[this.playerSlot][0],_y:this.cardPos[this.playerSlot][1],_rotation:this.cardPos[this.playerSlot][2]});
         }
         this.card.tapeMC._rotation = -2 + Math.ceil(Math.random() * 4);
         this.card.details.nameTF.htmlText = this._data[1];
         this.card.details.nameTF.textAutoSize = "shrink";
         this.card.details.rankTF.text = "";
         if(this.rankString == "")
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.card.details.rankTF,"HEIST_MP_RANK",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
            this.rankString = this.card.details.rankTF.htmlText;
         }
         this.card.details.rankTF.htmlText = this.rankString + " " + this._data[2];
         this.card.details.rankTF.textAutoSize = "shrink";
         this.card.details.roleTF.htmlText = this._data[3];
         this.card.details.roleTF.textAutoSize = "shrink";
         var _loc6_ = this._data[4];
         if(typeof _loc6_ != "string")
         {
            _loc6_ = undefined;
         }
         if(_loc6_ != undefined && _loc6_ != "" && _loc6_ != null)
         {
            this.card.updatePedHead(_loc6_);
         }
         this.card.details.vMC.vehicleMC1._alpha = !this._data[5] ? 30 : 100;
         this.card.details.vMC.vehicleMC2._alpha = !this._data[6] ? 30 : 100;
         this.card.details.vMC.vehicleMC3._alpha = !this._data[7] ? 30 : 100;
         this.card.details.vMC.vehicleMC4._alpha = !this._data[8] ? 30 : 100;
         if(this.vehString == "")
         {
            com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.card.details.vehiclesTF,"VEH_ACCESS",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
            this.vehString = this.card.details.vehiclesTF.htmlText;
         }
         this.card.details.vehiclesTF.htmlText = this.vehString;
         this.card.details.vehiclesTF.textAutoSize = "shrink";
         var _loc9_ = this._data[9];
         if(_loc9_ != undefined)
         {
            var _loc7_ = com.rockstargames.gtav.utils.ROUND_DECIMAL_PLACES.roundDecimals(_loc9_,2).toString();
            if(_loc7_.length == 1)
            {
               _loc7_ += ".00";
            }
            if(this.KdRatioString == "")
            {
               com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.card.details.kdratioTF,"PM_KD_RATIO",com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
               this.KdRatioString = this.card.details.kdratioTF.htmlText;
            }
            this.card.details.kdratioTF.htmlText = _loc7_ + " " + this.KdRatioString;
            this.card.details.kdratioTF.textAutoSize = "shrink";
         }
         else
         {
            this.card.details.kdratioTF.text = "";
         }
         var _loc8_ = this._data[10];
         if(_loc8_ != undefined)
         {
            this.card.details.titleTF.htmlText = _loc8_;
            this.card.details.titleTF.textAutoSize = "shrink";
         }
         var _loc11_ = this._data[11];
         if(_loc11_ != undefined)
         {
            this.card.details.statusTF.htmlText = _loc11_;
            this.card.details.statusTF.textAutoSize = "shrink";
         }
         var _loc2_ = 0;
         while(_loc2_ < 7)
         {
            var _loc5_ = _loc2_ + 12;
            var _loc4_ = this._data[_loc5_];
            if(_loc4_ != undefined)
            {
               var _loc3_ = "stat" + _loc2_;
               if(this.statStrings[_loc2_] == "")
               {
                  com.rockstargames.ui.utils.Localisation.setTextWithTranslation(this.card.details[_loc3_].statTF,this.statLabels[_loc2_],com.rockstargames.ui.game.GameInterface.GENERIC_TYPE,true);
                  this.statStrings[_loc2_] = this.card.details[_loc3_].statTF.htmlText;
               }
               this.card.details[_loc3_].statTF.htmlText = this.statStrings[_loc2_];
               this.card.details[_loc3_].statTF.textAutoSize = "shrink";
               this.card.details[_loc3_].barMC._xscale = com.rockstargames.gtav.levelDesign.heists.selectors.MPHeistBoardplayerCard.getAdjustedSegmentPct(_loc4_,12,2,5);
               this.card.details[_loc3_]._visible = true;
            }
            else
            {
               this.card.details[_loc3_]._visible = false;
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   function addMedals(_playerSlot, _medal1, _medal2, _medal3)
   {
      var _loc5_ = new Array([166,221,190,100],[214,181,99,100],[150,153,161,100],[180,130,97,100],[0,0,0,0],[0,0,0,0]);
      var _loc14_ = new Array(0,0,0,0,100);
      _playerSlot = arguments[0];
      var _loc11_ = arguments.slice(1,arguments.length);
      var _loc18_ = "card" + _playerSlot;
      var _loc15_ = this[_loc18_];
      if(_loc15_ != undefined)
      {
         var _loc10_ = _loc15_.details.medalsWrapperMC;
         var _loc13_ = 0;
         var _loc12_ = 1;
         var _loc8_ = 0;
         while(_loc8_ < _loc11_.length)
         {
            var _loc3_ = _loc11_[_loc8_];
            var _loc7_ = _loc12_;
            var _loc4_ = _loc10_["medalOutline" + _loc7_];
            var _loc6_ = _loc10_["medal" + _loc7_];
            var _loc9_ = _loc10_["noMedal" + _loc7_];
            if(_loc6_ != undefined)
            {
               if(_loc3_ != undefined && _loc3_ != -1)
               {
                  _loc4_._alpha = 100;
                  _loc4_._visible = true;
                  if(_loc3_ < _loc5_.length)
                  {
                     com.rockstargames.ui.utils.Colour.Colourise(_loc6_,_loc5_[_loc3_][0],_loc5_[_loc3_][1],_loc5_[_loc3_][2],_loc5_[_loc3_][3]);
                  }
                  else
                  {
                     com.rockstargames.ui.utils.Colour.ApplyHudColour(_loc6_,com.rockstargames.gtav.levelDesign.heists.HeistColours.BLUE);
                  }
                  _loc9_._alpha = _loc14_[_loc3_];
                  _loc13_ = _loc13_ + 1;
                  _loc12_ = _loc12_ + 1;
               }
               else
               {
                  _loc4_._alpha = 0;
                  _loc4_._visible = false;
                  _loc9_._alpha = 0;
               }
            }
            _loc8_ = _loc8_ + 1;
         }
         var _loc16_ = _loc10_._width;
         var _loc20_ = 24.6;
         var _loc19_ = 11;
         _loc16_ = (_loc13_ - 1) * 24.6 + _loc19_;
         _loc10_._x = 70 - _loc16_ / 2;
      }
   }
   function showPlayerCard(_playerSlot)
   {
      if(this["card" + _playerSlot] != undefined)
      {
         var _loc2_ = 0;
         while(_loc2_ < 8)
         {
            var _loc3_ = "card" + _loc2_;
            if(this[_loc3_] != undefined)
            {
               if(_loc2_ == _playerSlot)
               {
                  this[_loc3_].swapDepths(200 - _loc2_);
                  this[_loc3_].details._visible = true;
               }
               else
               {
                  this[_loc3_].swapDepths(100 - _loc2_);
                  this[_loc3_].details._visible = false;
               }
            }
            _loc2_ = _loc2_ + 1;
         }
      }
   }
   static function getAdjustedSegmentPct(pct, segmentW, gapW, numSegments)
   {
      if(pct > 100)
      {
         pct = 100;
      }
      var _loc2_ = segmentW * numSegments;
      var _loc3_ = _loc2_ + gapW * (numSegments - 1);
      var _loc6_ = 100 / numSegments;
      var _loc5_ = pct / 100;
      var _loc7_ = (Math.floor(pct / _loc6_) * gapW + _loc5_ * _loc2_) / _loc3_ * 100;
      return _loc7_;
   }
   function subHighlight(_subItemIndex, leftArrowVis, rightArrowVis)
   {
   }
   function set highlighted(_h)
   {
   }
}
