class com.rockstargames.gtav.minigames.horseracingconsole.RaceProgress
{
   var view;
   var cards;
   var cardPositions;
   var currLeader;
   function RaceProgress(view, horses, selectedHorseIndex)
   {
      this.view = view;
      this.init(horses,selectedHorseIndex);
   }
   function init(horses, selectedHorseIndex)
   {
      this.cards = [];
      this.cardPositions = [];
      var _loc4_ = 0;
      while(_loc4_ < horses.length)
      {
         var _loc3_ = horses[_loc4_];
         var _loc2_ = this.view["card" + _loc3_.number];
         _loc2_.num.text = _loc3_.number;
         _loc2_.odds.text = _loc3_.odds;
         _loc2_.star._visible = _loc4_ == selectedHorseIndex;
         this.cards[_loc3_.number] = _loc2_;
         this.cardPositions[_loc3_.number - 1] = _loc2_._x;
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.diamond,_loc3_.primaryColour);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.ring,_loc3_.primaryColour);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.horse.body,_loc3_.primaryColour);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.horse.arms,_loc3_.secondaryColour);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.horse.horse,_loc3_.horseColour);
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.colourise(_loc2_.horse.mane,_loc3_.maneColour);
         _loc4_ = _loc4_ + 1;
      }
      this.view.leader.label.autoSize = "left";
      this.currLeader = -1;
   }
   function update(normProgress, horses)
   {
      this.view.meter.bar._xscale = Math.min(100,100 * normProgress);
      this.view.meter.marker._x = this.view.meter.bar._width;
      var _loc4_ = [].concat(horses).sortOn("x",Array.NUMERIC | Array.DESCENDING);
      var _loc2_ = 0;
      while(_loc2_ < _loc4_.length)
      {
         var _loc3_ = _loc4_[_loc2_].number;
         this.cards[_loc3_]._x = this.cardPositions[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
      if(this.currLeader != _loc4_[0].number)
      {
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.leader.label,"#1 " + _loc4_[0].name,1.5,true,true);
         this.view.leader.centre._xscale = this.view.leader.label._width;
         this.view.leader.right._x = 2 * this.view.leader.centre._x + this.view.leader.centre._xscale;
         this.view.leader._x = 0.5 * (this.view._width - this.view.leader.right._x);
         this.currLeader = _loc4_[0].number;
      }
   }
   function dispose()
   {
      this.cards = null;
      this.cardPositions = null;
      this.view = null;
   }
}
