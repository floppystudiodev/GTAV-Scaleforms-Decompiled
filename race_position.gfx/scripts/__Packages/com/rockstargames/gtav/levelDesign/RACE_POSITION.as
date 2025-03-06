class com.rockstargames.gtav.levelDesign.RACE_POSITION extends com.rockstargames.ui.core.ScreenLayoutUI
{
   var racePositionMC;
   var CONTENT;
   var screenManager;
   var raceTimeMC;
   var bestTimeMC;
   var gateCounterMC;
   var raceScoreBoardMC;
   var position = 1;
   var racers = 6;
   var gateposition = 0;
   var gates = 20;
   var raceResultData = new Array();
   var raceResultSlots = new Array();
   var raceResultModules = new Array();
   var raceResultVisible = false;
   function RACE_POSITION()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.raceResultData = [];
      this.raceResultSlots = [];
      this.SET_SAFE(com.rockstargames.ui.core.ScreenLayoutManager.SAFE_ZONE_A[0]);
      this.SET_RATIO(com.rockstargames.ui.core.ScreenLayoutManager.SCREEN_FORMAT_WIDE);
      this.racePositionMC = this.screenManager.addToScreen("raceposition","racePositionMC",this.CONTENT,"RB");
      this.raceTimeMC = this.screenManager.addToScreen("racetime","raceTimeMC",this.CONTENT,"RT");
      this.bestTimeMC = this.screenManager.addToScreen("besttime","bestTimeMC",this.CONTENT,"RT");
      this.gateCounterMC = this.screenManager.addToScreen("gatecounter","gateCounterMC",this.CONTENT,"LT");
      this.raceScoreBoardMC = this.screenManager.addToScreen("raceresult","raceScoreBoardMC",this.CONTENT,"CC");
      this.raceResultModules = [this.racePositionMC,this.raceTimeMC,this.bestTimeMC,this.gateCounterMC,this.raceScoreBoardMC];
      this.SET_RACE_LABELS("","","","","");
      this.SHOW_RACE_RESULTS(0);
   }
   function getKeys()
   {
      if(Key.isDown(38))
      {
         this.SET_RACE_POSITION(Math.ceil(Math.random() * 8));
         this.SET_GATES_POSITION(Math.ceil(Math.random() * 20));
         var _loc3_ = Math.ceil(Math.random() * 999);
         var _loc2_ = Math.ceil(Math.random() * 60);
         var _loc4_ = Math.ceil(Math.random() * 1);
         this.SET_RACE_TIME(_loc4_ + "\'" + _loc2_ + "\"" + _loc3_);
      }
      else if(!Key.isDown(39))
      {
         if(!Key.isDown(40))
         {
            if(!Key.isDown(37))
            {
               if(!Key.isDown(8))
               {
                  if(Key.isDown(32))
                  {
                     !this.raceResultVisible ? this.SHOW_RACE_RESULTS(1) : this.SHOW_RACE_RESULTS(0);
                  }
               }
            }
         }
      }
   }
   function debug()
   {
      this.SET_RACE_LABELS("POSITION","TIME","BEST TIME"," GATES","RACE RESULTS");
      this.SET_RACE_POSITION(4,10);
      this.SET_GATES_POSITION(3,20);
      this.SET_RACE_TIME("1\'34\"567");
      this.SET_BEST_TIME("9\'99\"999");
      this.SET_RACE_RESULTS("0","1","Michael","0.01.118");
      this.SET_RACE_RESULTS("1","2","Trevor","0.01.456");
      this.SET_RACE_RESULTS("2","3","Franklin","0.01.987");
      this.SET_RACE_RESULTS("3","4","Barry","0.02.246");
      this.SET_RACE_RESULTS("4","5","Ken","0.01.987");
      this.SET_RACE_RESULTS("5","6","Sue","0.02.246");
      this.SET_RACE_RESULTS("6","7","Lewis","0.02.246");
      this.SET_RACE_RESULTS("7","8","Mark","0.02.246");
      this.SHOW_RACE_RESULTS(1);
      var _loc2_ = new Object();
      _loc2_.onKeyDown = mx.utils.Delegate.create(this,this.getKeys);
      Key.addListener(_loc2_);
   }
   function setText(tf, txt, alignLeft)
   {
      tf.htmlText = txt;
      tf.html = true;
      var _loc2_ = "left";
      if(alignLeft == false)
      {
         _loc2_ = "right";
      }
      tf.autoSize = _loc2_;
      tf.multiline = false;
      tf.wordWrap = false;
   }
   function setResults()
   {
      var _loc2_ = 0;
      while(_loc2_ < this.racers)
      {
         var _loc3_ = this.raceResultSlots[_loc2_];
         var _loc4_ = this.raceResultData[_loc2_];
         this.setText(_loc3_.positionTF,_loc4_[0]);
         this.setText(_loc3_.racerTF,_loc4_[1]);
         this.setText(_loc3_.timeTF,_loc4_[2]);
         _loc2_ = _loc2_ + 1;
      }
   }
   function createResults()
   {
      this.raceResultData = [];
      this.raceResultSlots = [];
      var _loc4_ = 50;
      var _loc3_ = 0;
      while(_loc3_ < this.racers)
      {
         var _loc2_ = this.raceScoreBoardMC.innerMC.attachMovie("raceresultslot","result" + _loc3_ + "MC",_loc3_);
         _loc2_._x = (- _loc2_._width) * 0.5;
         _loc2_._y = _loc4_ + (_loc2_._height + 2) * _loc3_;
         this.raceResultSlots.push(_loc2_);
         this.raceResultData.push([]);
         _loc3_ = _loc3_ + 1;
      }
      this.raceScoreBoardMC.innerMC.bgMC._height = _loc2_._y + _loc4_;
      this.screenManager.positionToScreen(this.raceScoreBoardMC,"CC");
   }
   function SET_RACE_LABELS(racePosLabel, raceTimeLabel, bestTimeLabel, gateCounterLabel, raceResultsLabel)
   {
      var _loc2_ = 1044;
      this.setText(this.racePositionMC.labelTF,racePosLabel.toUpperCase(),false);
      this.racePositionMC._x = _loc2_;
      this.racePositionMC._y = 410;
      this.setText(this.gateCounterMC.labelTF,gateCounterLabel.toUpperCase(),false);
      this.gateCounterMC._x = _loc2_;
      this.gateCounterMC._y = 474;
      this.setText(this.raceTimeMC.labelTF,raceTimeLabel.toUpperCase(),false);
      this.raceTimeMC._x = _loc2_;
      this.raceTimeMC._y = 538;
      this.setText(this.bestTimeMC.labelTF,bestTimeLabel.toUpperCase(),false);
      this.bestTimeMC._x = _loc2_;
      this.bestTimeMC._y = 602;
      this.setText(this.raceScoreBoardMC.innerMC.resultslabelTF,raceResultsLabel.toUpperCase());
      this.raceScoreBoardMC.innerMC.resultslabelTF._x = (- this.raceScoreBoardMC.innerMC.resultslabelTF._width) * 0.5;
   }
   function SHOW_RACE_MODULE(enum, show)
   {
      var _loc2_ = this.raceResultModules[enum];
      _loc2_._visible = Boolean(show);
   }
   function SET_RACE_POSITION(_position, _racers)
   {
      var _loc2_ = this.racePositionMC.innerMC;
      if(_racers != undefined)
      {
         this.racers = _racers;
         this.createResults();
         _loc2_.maxTF.text = this.racers;
         _loc2_.maxTF.autoSize = "left";
         _loc2_.maxTF.multiline = false;
         _loc2_.maxTF.wordWrap = false;
         _loc2_._x = 140 - _loc2_._width;
      }
      this.position = Math.max(Math.min(this.racers,_position),1);
      _loc2_.currTF.text = this.position;
   }
   function SET_GATES_POSITION(_gateposition, _gates)
   {
      var _loc2_ = this.gateCounterMC.innerMC;
      if(_gates != undefined)
      {
         this.gates = _gates;
         _loc2_.maxTF.text = this.gates;
         _loc2_.maxTF.autoSize = "left";
         _loc2_.maxTF.multiline = false;
         _loc2_.maxTF.wordWrap = false;
         _loc2_._x = 140 - _loc2_._width;
      }
      this.gateposition = Math.max(Math.min(this.gates,_gateposition),1);
      _loc2_.currTF.text = this.gateposition;
   }
   function SET_RACE_TIME(_time)
   {
      var _loc2_ = this.raceTimeMC.innerMC;
      _loc2_.timeTF.text = _time;
      _loc2_.timeTF.autoSize = "left";
      _loc2_.timeTF.multiline = false;
      _loc2_.timeTF.wordWrap = false;
      _loc2_._x = 140 - _loc2_._width;
   }
   function SET_BEST_TIME(_time)
   {
      var _loc2_ = this.bestTimeMC.innerMC;
      _loc2_.timeTF.text = _time;
      _loc2_.timeTF.text = _time;
      _loc2_.timeTF.autoSize = "left";
      _loc2_.timeTF.multiline = false;
      _loc2_.timeTF.wordWrap = false;
      _loc2_._x = 140 - _loc2_._width;
   }
   function SET_RACE_RESULTS(_index, _position, _racer, _time)
   {
      this.raceResultData[_index][0] = _position;
      this.raceResultData[_index][1] = _racer;
      this.raceResultData[_index][2] = _time;
   }
   function SHOW_RACE_RESULTS(vis)
   {
      this.raceResultVisible = Boolean(vis);
      this.raceScoreBoardMC._alpha = !this.raceResultVisible ? 0 : 100;
      this.setResults();
   }
}
