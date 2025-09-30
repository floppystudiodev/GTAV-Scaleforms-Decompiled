class com.rockstargames.gtav.levelDesign.heists.HEIST_FINALE extends com.rockstargames.gtav.levelDesign.heists.HeistControllerBase
{
   var CONTENT;
   var SET_INPUT_EVENT;
   var model;
   var heistAssetList = new Array();
   function HEIST_FINALE()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.model = new com.rockstargames.gtav.levelDesign.heists.HeistModel();
      this.heistAssetList = [];
      this.RegisterHeistAsset(0,this.CONTENT.boardMC.notegetawayMC);
      this.RegisterHeistAsset(1,this.CONTENT.boardMC.securityNoteMC);
      this.RegisterHeistAsset(2,this.CONTENT.boardMC.securityMC);
      this.RegisterHeistAsset(3,this.CONTENT.boardMC.tunnelMC);
      this.RegisterHeistAsset(4,this.CONTENT.boardMC.vanMC);
      this.RegisterHeistAsset(5,this.CONTENT.boardMC.carsMC);
      this.RegisterHeistAsset(6,this.CONTENT.boardMC.truckMC);
      this.RegisterHeistAsset(7,this.CONTENT.boardMC.mapRouteMC);
      this.RegisterHeistAsset(8,this.CONTENT.boardMC.bankletterMC);
      this.RegisterHeistAsset(9,this.CONTENT.boardMC.banklobbyMC);
      this.RegisterHeistAsset(10,this.CONTENT.boardMC.noteDropOffMC);
      this.RegisterHeistAsset(11,this.CONTENT.boardMC.noteHoleMC);
      this.RegisterHeistAsset(12,this.CONTENT.boardMC.DrillingMachineMC);
      this.RegisterHeistAsset(13,this.CONTENT.boardMC.paperworkMC);
      this.RegisterHeistAsset(14,this.CONTENT.boardMC.HeliMC);
      this.RegisterHeistAsset(15,this.CONTENT.boardMC.freightMC);
      this.RegisterHeistAsset(16,this.CONTENT.boardMC.HoleMC);
      this.RegisterHeistAsset(17,this.CONTENT.boardMC.mapSat2MC);
      this.RegisterHeistAsset(18,this.CONTENT.boardMC.mapBMC);
      this.RegisterHeistAsset(19,this.CONTENT.boardMC.clippingGoldReservesMC);
   }
   function debug()
   {
      this.CREATE_VIEW(0,0);
      this.CREATE_VIEW(1,0);
      this.CREATE_VIEW(2,0);
      this.CREATE_VIEW(3,0);
      this.CREATE_VIEW(4,1);
      this.CREATE_VIEW(5,2);
      this.SET_LABELS("SKILL","ACCURRACY","CUT","#heist titleA","heist titleB","#crew","#todo","#approach","#drop","#hole","#security","#tunnel","#getaway","#Aapproach","#Bapproach");
      this.SET_DATA_SLOT(0,0,1,"firstname lastname","skill str here","1st skill",50,"2nd skill",25,"3rd skill",75);
      this.SET_DATA_SLOT(0,1,2,"firstname lastname","skill str here","1st skill","750","2nd skill","250");
      this.SET_DATA_SLOT(0,2,3,"name here3","skill here3","1st skill","750","2nd skill","250");
      this.SET_DATA_SLOT(0,3,4,"name here4","skill here4","1st skill","750","2nd skill","250");
      this.SET_DATA_SLOT(0,4,5,"name here5","skill here5","1st skill","750","2nd skill","250");
      this.SET_DATA_SLOT(1,0,6,"stuff here","stuff here");
      this.SET_DATA_SLOT(1,1,7);
      this.SET_DATA_SLOT(2,0,8);
      this.SET_DATA_SLOT(2,1,9);
      this.SET_DATA_SLOT(2,2,10);
      this.SET_DATA_SLOT(3,0,1);
      this.SET_DATA_SLOT(3,1,2);
      this.SET_DATA_SLOT(3,2,3);
      this.SET_DATA_SLOT(4,0,8);
      this.SET_DATA_SLOT(4,1,9);
      this.SET_DATA_SLOT(5,0,1,"Crew");
      this.SET_DATA_SLOT(5,1,0,"Van Route");
      this.SET_DATA_SLOT(5,2,1,"Armour & weapons");
      this.SET_DATA_SLOT(5,3,1,"Bank scouted");
      this.SET_DATA_SLOT(5,4,1,"Safe schematics");
      this.DISPLAY_VIEW(0);
      this.DISPLAY_VIEW(1);
      this.DISPLAY_VIEW(2);
      this.DISPLAY_VIEW(3);
      this.DISPLAY_VIEW(4);
      this.DISPLAY_VIEW(5);
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
      this.SHOW_HEIST_ASSET(17,1);
      this.SHOW_HEIST_ASSET(18,1);
      this.SHOW_HEIST_ASSET(19,1);
      var _loc3_ = new Object();
      _loc3_.onKeyDown = mx.utils.Delegate.create(this,this.getKeys);
      Key.addListener(_loc3_);
      for(var _loc2_ in this.CONTENT.boardMC)
      {
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
      var _loc6_ = [116,248,380,510,680,900];
      var _loc5_ = [420,425,425,430,374,414];
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
         default:
            return;
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
      var _loc14_ = arguments[13];
      var _loc13_ = arguments[14];
      com.rockstargames.gtav.levelDesign.heists.HeistModel(this.model).setLabel(_weaponname,_jobcut,_accuracy,_loc14_,_loc13_);
      var _loc11_ = arguments[3];
      var _loc10_ = arguments[4];
      var _loc6_ = arguments[5];
      var _loc7_ = arguments[6];
      var _loc12_ = arguments[7];
      if(_loc11_ != undefined)
      {
         this.CONTENT.boardMC.tape01.headingTF.text = _loc11_;
      }
      if(_loc10_ != undefined)
      {
         this.CONTENT.boardMC.tape05.headingTF.text = _loc10_;
      }
      if(_loc6_ != undefined)
      {
         this.CONTENT.boardMC.tape04.headingTF.text = _loc6_;
      }
      if(_loc7_ != undefined)
      {
         this.CONTENT.boardMC.tape02.headingTF.text = _loc7_;
      }
      if(_loc12_ != undefined)
      {
         this.CONTENT.boardMC.tape03.headingTF.text = _loc12_;
      }
      var _loc3_ = arguments[8];
      var _loc4_ = arguments[9];
      var _loc8_ = arguments[10];
      var _loc5_ = arguments[11];
      var _loc9_ = arguments[12];
      if(_loc3_ != undefined)
      {
         this.CONTENT.boardMC.noteDropOffMC.labelTF.text = _loc3_;
      }
      if(_loc4_ != undefined)
      {
         this.CONTENT.boardMC.noteHoleMC.labelTF.text = _loc4_;
      }
      if(_loc8_ != undefined)
      {
         this.CONTENT.boardMC.securityNoteMC.labelTF.text = _loc8_;
      }
      if(_loc5_ != undefined)
      {
         this.CONTENT.boardMC.notegetawayMC.labelTF.text = _loc5_;
      }
      if(_loc9_ != undefined)
      {
         this.CONTENT.boardMC.mapRouteMC.noteTunnelMC.labelTF.text = _loc9_;
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
