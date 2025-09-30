class com.rockstargames.gtav.levelDesign.heists.HEIST_JEWELLERY extends com.rockstargames.gtav.levelDesign.heists.HeistControllerBase
{
   var CONTENT;
   var SET_INPUT_EVENT;
   var model;
   var heistAssetList = new Array();
   function HEIST_JEWELLERY()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.model = new com.rockstargames.gtav.levelDesign.heists.HeistModel();
      this.heistAssetList = [];
      this.RegisterHeistAsset(0,this.CONTENT.boardMC.blueprintMC);
      this.RegisterHeistAsset(1,this.CONTENT.boardMC.photoExtMC);
      this.RegisterHeistAsset(2,this.CONTENT.boardMC.jewelsMC);
      this.RegisterHeistAsset(3,this.CONTENT.boardMC.secGuardsMC);
      this.RegisterHeistAsset(4,this.CONTENT.boardMC.ventsMC);
      this.RegisterHeistAsset(5,this.CONTENT.boardMC.tunnelMC);
      this.RegisterHeistAsset(6,this.CONTENT.boardMC.brochureMC);
      this.RegisterHeistAsset(7,this.CONTENT.boardMC.exterminationMC);
      this.RegisterHeistAsset(8,this.CONTENT.boardMC.bikeMC);
      this.RegisterHeistAsset(9,this.CONTENT.boardMC.alarmMC);
      this.RegisterHeistAsset(10,this.CONTENT.boardMC.gasMC);
      this.RegisterHeistAsset(11,this.CONTENT.boardMC.roofVentMC);
   }
   function debug()
   {
      this.CREATE_VIEW(0,0);
      this.CREATE_VIEW(1,0);
      this.CREATE_VIEW(2,0);
      this.CREATE_VIEW(3,0);
      this.CREATE_VIEW(4,1);
      this.CREATE_VIEW(5,2);
      this.SET_LABELS("#SKILL","#ACCURRACY","#CUT","#heist title","#todo","#approach","#crew","#fire","#loor","#bomb","#drive","#Aapproach ","#Bapproach ");
      this.SET_DATA_SLOT(0,0,1,"name here1","skill here1","1st skill",50,"2nd skill",25,"3rd skill",75);
      this.SET_DATA_SLOT(0,1,2,"name here2","skill here2","1st skill",50,"2nd skill",25,"3rd skill",75);
      this.SET_DATA_SLOT(0,2,3,"name here3","skill here3","1st skill",50,"2nd skill",25,"3rd skill",75);
      this.SET_DATA_SLOT(0,3,4,"name here4","skill here4","1st skill",50,"2nd skill",25,"3rd skill",75);
      this.SET_DATA_SLOT(0,4,5,"name here5","skill here5","1st skill",50,"2nd skill",25,"3rd skill",75);
      this.SET_DATA_SLOT(1,0,6,"name here1","skill here1","1st skill",50,"2nd skill",25,"3rd skill",75);
      this.SET_DATA_SLOT(1,1,7);
      this.SET_DATA_SLOT(2,0,8);
      this.SET_DATA_SLOT(2,1,9);
      this.SET_DATA_SLOT(2,2,10);
      this.SET_DATA_SLOT(3,0,1);
      this.SET_DATA_SLOT(3,1,2);
      this.SET_DATA_SLOT(3,2,3);
      this.SET_DATA_SLOT(4,0,2);
      this.SET_DATA_SLOT(4,1,1);
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
      this.FOCUS_VIEW(4);
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
      var _loc2_ = new Object();
      _loc2_.onKeyDown = mx.utils.Delegate.create(this,this.getKeys);
      Key.addListener(_loc2_);
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
      var _loc6_ = [116,248,380,510,650,684];
      var _loc5_ = [420,425,425,430,300,106];
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
            this.model.createView(viewIndex,{id:viewType,x:_loc12_ + 26,y:_loc11_ - 10,rowSpacing:2,columnSpacing:2,container:this.CONTENT.containerMC,visibleItems:1,selectstyle:com.rockstargames.ui.components.GUIView.LOCKED_SELECTSTYLE,linkage:["crewmemberSelection"]});
            break;
         case com.rockstargames.gtav.levelDesign.heists.HeistModel.viewGameplay:
            this.model.createView(viewIndex,{id:viewType,x:_loc12_ + 10,y:_loc11_,rowSpacing:100,columnSpacing:0,container:this.CONTENT.containerMC,visibleItems:1,selectstyle:0,linkage:["gameplaySelection"]});
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
      var _loc12_ = arguments[11];
      var _loc11_ = arguments[12];
      com.rockstargames.gtav.levelDesign.heists.HeistModel(this.model).setLabel(_weaponname,_jobcut,_accuracy,_loc12_,_loc11_);
      var _loc9_ = arguments[3];
      var _loc4_ = arguments[4];
      var _loc5_ = arguments[5];
      var _loc10_ = arguments[6];
      if(_loc9_ != undefined)
      {
         this.CONTENT.boardMC.tape01.headingTF.text = _loc9_;
      }
      if(_loc4_ != undefined)
      {
         this.CONTENT.boardMC.tape04.headingTF.text = _loc4_;
      }
      if(_loc5_ != undefined)
      {
         this.CONTENT.boardMC.tape02.headingTF.text = _loc5_;
      }
      if(_loc10_ != undefined)
      {
         this.CONTENT.boardMC.tape03.headingTF.text = _loc10_;
      }
      var _loc6_ = arguments[7];
      var _loc8_ = arguments[8];
      var _loc7_ = arguments[9];
      var _loc3_ = arguments[10];
      if(_loc6_ != undefined)
      {
         this.CONTENT.boardMC.secGuardsMC.noteCCTVMC.labelTF.text = _loc6_;
      }
      if(_loc8_ != undefined)
      {
         this.CONTENT.boardMC.ventsMC.noteVentMC.labelTF.text = _loc8_;
      }
      if(_loc7_ != undefined)
      {
         this.CONTENT.boardMC.alarmMC.noteAlarmMC.labelTF.text = _loc7_;
      }
      if(_loc3_ != undefined)
      {
         this.CONTENT.boardMC.tunnelMC.noteTunnalMC.labelTF.text = _loc3_;
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
