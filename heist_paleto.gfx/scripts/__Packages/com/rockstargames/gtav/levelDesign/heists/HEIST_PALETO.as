class com.rockstargames.gtav.levelDesign.heists.HEIST_PALETO extends com.rockstargames.gtav.levelDesign.heists.HeistControllerBase
{
   var model;
   var CONTENT;
   var heistAssetList = new Array();
   function HEIST_PALETO()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.model = new com.rockstargames.gtav.levelDesign.heists.HeistModel();
      this.heistAssetList = [];
      this.RegisterHeistAsset(0,this.CONTENT.boardMC.weaponsAmmoMC);
      this.RegisterHeistAsset(1,this.CONTENT.boardMC.escapeMapMC);
      this.RegisterHeistAsset(2,this.CONTENT.boardMC.speedBoatMC);
      this.RegisterHeistAsset(3,this.CONTENT.boardMC.noteCopsMC);
      this.RegisterHeistAsset(4,this.CONTENT.boardMC.noteCopCarsMC);
      this.RegisterHeistAsset(5,this.CONTENT.boardMC.noteTimeMC);
      this.RegisterHeistAsset(6,this.CONTENT.boardMC.notePlanAMC);
      this.RegisterHeistAsset(7,this.CONTENT.boardMC.notePlanBMC);
      this.RegisterHeistAsset(8,this.CONTENT.boardMC.vanMC);
      this.RegisterHeistAsset(9,this.CONTENT.boardMC.bankAlarmMC);
      this.RegisterHeistAsset(10,this.CONTENT.boardMC.bankMC);
      this.RegisterHeistAsset(11,this.CONTENT.boardMC.lifeinvaderMC);
      this.RegisterHeistAsset(12,this.CONTENT.boardMC.cityMapMC);
      this.RegisterHeistAsset(13,this.CONTENT.boardMC.noteLifeinvaderMC);
      this.RegisterHeistAsset(14,this.CONTENT.boardMC.dollarMC);
      this.RegisterHeistAsset(15,this.CONTENT.boardMC.hardwareMC);
      this.RegisterHeistAsset(16,this.CONTENT.boardMC.hoursMC);
   }
   function debug()
   {
      this.CREATE_VIEW(0,0);
      this.CREATE_VIEW(1,1);
      this.CREATE_VIEW(2,2);
      this.SET_LABELS("SKILL","ACCURRACY","CUT","*heist title","*crew","*todo","*planAText","*planBText","*timeText","*cops","*copCars","*bankw","*dollar","*notes","*smash","*mil","*hours23","bateu");
      this.SET_DATA_SLOT(0,0,1,"name here1","skill here1","Skilled1","750","250");
      this.SET_DATA_SLOT(0,1,2,"name here2","skill here2","Skilled2","75","25");
      this.SET_DATA_SLOT(0,2,3,"name here3","skill here3","Skilled2","75","25");
      this.SET_DATA_SLOT(0,3,4,"name here4","skill here4","Skilled2","75","25");
      this.SET_DATA_SLOT(0,4,5,"name here5","skill here5","Skilled2","75","25");
      this.SET_DATA_SLOT(1,0,8);
      this.SET_DATA_SLOT(1,1,9);
      this.SET_DATA_SLOT(2,0,1,"Crew");
      this.SET_DATA_SLOT(2,1,0,"Van Route");
      this.SET_DATA_SLOT(2,2,1,"Armour & weapons");
      this.SET_DATA_SLOT(2,3,1,"Bank scouted");
      this.SET_DATA_SLOT(2,4,1,"Safe schematics");
      this.DISPLAY_VIEW(0);
      this.DISPLAY_VIEW(1);
      this.DISPLAY_VIEW(2);
      this.FOCUS_VIEW(1);
      this.SHOW_HEIST_ASSET(0,1);
      this.SHOW_HEIST_ASSET(1,1);
      this.SHOW_HEIST_ASSET(2,1);
      this.SHOW_HEIST_ASSET(3,1);
      this.SHOW_HEIST_ASSET(4,1);
      this.SHOW_HEIST_ASSET(5,1);
      this.SHOW_HEIST_ASSET(6,1);
      this.SHOW_HEIST_ASSET(7,1);
      this.SHOW_HEIST_ASSET(8,1);
      this.SHOW_HEIST_ASSET(9,1);
      this.SHOW_HEIST_ASSET(10,1);
      this.SHOW_HEIST_ASSET(11,1);
      this.SHOW_HEIST_ASSET(12,1);
      this.SHOW_HEIST_ASSET(13,1);
      this.SHOW_HEIST_ASSET(14,1);
      this.SHOW_HEIST_ASSET(15,1);
      this.SHOW_HEIST_ASSET(16,1);
      var _loc3_ = new Object();
      _loc3_.onKeyDown = mx.utils.Delegate.create(this,this.getKeys);
      Key.addListener(_loc3_);
      for(var _loc2_ in this.CONTENT.boardMC)
      {
         trace(_loc2_ + " " + this.CONTENT.boardMC[_loc2_]);
      }
   }
   function getKeys()
   {
      if(Key.isDown(38))
      {
         this.SET_INPUT_EVENT(8);
      }
      else if(Key.isDown(39))
      {
         this.SET_INPUT_EVENT(11);
      }
      else if(Key.isDown(40))
      {
         this.SET_INPUT_EVENT(9);
      }
      else if(Key.isDown(37))
      {
         this.SET_INPUT_EVENT(10);
      }
      else if(Key.isDown(32))
      {
         this.FOCUS_VIEW(99);
      }
      else if(Key.isDown(16))
      {
         this.SET_DATA_SLOT_EMPTY(0);
         this.CREATE_VIEW(0,0);
         this.SET_DATA_SLOT(0,0,1);
         this.SET_DATA_SLOT(0,1,2);
         this.SET_DATA_SLOT(0,2,3);
         this.DISPLAY_VIEW(0);
      }
   }
   function CREATE_VIEW(viewIndex, viewType, xp, yp)
   {
      var _loc6_ = [116,660,665];
      var _loc5_ = [420,284,140];
      var _loc12_ = arguments[2];
      var _loc11_ = arguments[3];
      if(_loc12_ == undefined)
      {
         _loc12_ = _loc6_[viewIndex];
      }
      if(_loc11_ == undefined)
      {
         _loc11_ = _loc5_[viewIndex];
      }
      switch(viewType)
      {
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewCrewMember:
            this.model.createView(viewIndex,{id:viewType,x:_loc12_,y:_loc11_,rowSpacing:2,columnSpacing:2,container:this.CONTENT.containerMC,visibleItems:1,selectstyle:com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE,linkage:["crewmemberSelection"]});
            break;
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            this.model.createView(viewIndex,{id:viewType,x:_loc12_,y:_loc11_,rowSpacing:100,columnSpacing:0,container:this.CONTENT.containerMC,visibleItems:1,selectstyle:0,linkage:["gameplaySelection"]});
            break;
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewTodo:
            this.model.createView(viewIndex,{id:viewType,x:_loc12_,y:_loc11_,rowSpacing:10,columnSpacing:10,container:this.CONTENT.containerMC,visibleItems:1,selectstyle:0,linkage:["todolistSelection"]});
      }
   }
   function REPOSITION_VIEW(viewIndex, xp, yp)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.heists.HeistModel(this.model).getCurrentView(viewIndex);
      if(xp != undefined)
      {
         _loc2_.viewContainer._x = _loc2_.viewContainerX = xp;
      }
      if(yp != undefined)
      {
         _loc2_.viewContainer._y = _loc2_.viewContainerY = yp;
      }
   }
   function SET_LABELS(_weaponname, _jobcut, _accuracy)
   {
      com.rockstargames.gtav.levelDesign.heists.HeistModel(this.model).setLabel(_weaponname,_jobcut,_accuracy);
      var _loc16_ = arguments[3];
      var _loc7_ = arguments[4];
      var _loc10_ = arguments[5];
      var _loc3_ = this.CONTENT.boardMC;
      if(_loc16_ != undefined)
      {
         _loc3_.tape01.headingTF.text = _loc16_;
      }
      if(_loc7_ != undefined)
      {
         _loc3_.tape04.headingTF.text = _loc7_;
      }
      if(_loc10_ != undefined)
      {
         _loc3_.tape02.headingTF.text = _loc10_;
      }
      var _loc17_ = arguments[6];
      var _loc14_ = arguments[7];
      var _loc13_ = arguments[8];
      var _loc15_ = arguments[9];
      var _loc8_ = arguments[10];
      var _loc9_ = arguments[11];
      var _loc11_ = arguments[12];
      var _loc4_ = arguments[13];
      var _loc5_ = arguments[14];
      var _loc6_ = arguments[15];
      var _loc18_ = arguments[16];
      var _loc12_ = arguments[17];
      if(_loc17_ != undefined)
      {
         _loc3_.notePlanAMC.labelTF.text = _loc17_;
      }
      if(_loc14_ != undefined)
      {
         _loc3_.notePlanBMC.labelTF.text = _loc14_;
      }
      if(_loc13_ != undefined)
      {
         _loc3_.noteTimeMC.labelTF.text = _loc13_;
      }
      if(_loc15_ != undefined)
      {
         _loc3_.noteCopsMC.labelTF.text = _loc15_;
      }
      if(_loc8_ != undefined)
      {
         _loc3_.noteCopCarsMC.labelTF.text = _loc8_;
      }
      if(_loc9_ != undefined)
      {
         _loc3_.noteLifeinvaderMC.labelTF.text = _loc9_;
      }
      if(_loc11_ != undefined)
      {
         _loc3_.dollarMC.labelTF.text = _loc11_;
      }
      if(_loc4_ != undefined)
      {
         _loc3_.weaponsAmmoMC.labelTF.text = _loc4_;
      }
      if(_loc5_ != undefined)
      {
         _loc3_.lifeinvaderMC.labelTF.text = _loc5_;
      }
      if(_loc6_ != undefined)
      {
         _loc3_.hardwareMC.labelTF.text = _loc6_;
      }
      if(_loc18_ != undefined)
      {
         _loc3_.hoursMC.labelTF.text = _loc18_;
      }
      if(_loc12_ != undefined)
      {
         _loc3_.escapeMapMC.labelTF.text = _loc12_;
      }
   }
   function SHOW_VIEW(_viewIndex, _show)
   {
      var _loc2_ = this.model.getCurrentView(_viewIndex);
      com.rockstargames.gtav.levelDesign.heists.HeistView(_loc2_).show(Boolean(_show));
   }
   function SET_TODO(_viewIndex, _itemIndex, _checked)
   {
      var _loc2_ = com.rockstargames.gtav.levelDesign.heists.HeistModel(this.model).getCurrentView(_viewIndex).dataList[_itemIndex];
      _loc2_[0] = _checked;
      var _loc3_ = com.rockstargames.gtav.levelDesign.heists.HeistModel(this.model).getCurrentView(_viewIndex);
      _loc3_.addItem(_itemIndex,_loc2_);
      _loc3_.itemList[_itemIndex].data = _loc2_;
   }
   function RegisterHeistAsset(enum, mc)
   {
      this.heistAssetList["hi" + enum] = mc;
      mc._visible = false;
   }
   function SHOW_HEIST_ASSET(enum, visible, frame, x, y)
   {
      var _loc2_ = this.heistAssetList["hi" + enum];
      if(_loc2_ != undefined)
      {
         _loc2_._visible = Boolean(visible);
         if(frame != undefined)
         {
            _loc2_.gotoAndStop(frame);
         }
         if(x != undefined)
         {
            _loc2_._x = x;
         }
         if(y != undefined)
         {
            _loc2_._y = y;
         }
      }
   }
}
