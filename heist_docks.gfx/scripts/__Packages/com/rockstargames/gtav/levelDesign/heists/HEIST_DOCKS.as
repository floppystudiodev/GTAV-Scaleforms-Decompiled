class com.rockstargames.gtav.levelDesign.heists.HEIST_DOCKS extends com.rockstargames.gtav.levelDesign.heists.HeistControllerBase
{
   var CONTENT;
   var SET_INPUT_EVENT;
   var model;
   var heistAssetList = new Array();
   function HEIST_DOCKS()
   {
      super();
   }
   function INITIALISE(mc)
   {
      super.INITIALISE(mc);
      this.model = new com.rockstargames.gtav.levelDesign.heists.HeistModel();
      this.heistAssetList = [];
      this.RegisterHeistAsset(0,this.CONTENT.boardMC.mapMC);
      this.RegisterHeistAsset(1,this.CONTENT.boardMC.bowMC);
      this.RegisterHeistAsset(2,this.CONTENT.boardMC.sternMC);
      this.RegisterHeistAsset(3,this.CONTENT.boardMC.secGuardMC);
      this.RegisterHeistAsset(4,this.CONTENT.boardMC.websiteMC);
      this.RegisterHeistAsset(5,this.CONTENT.boardMC.manifestoMC);
   }
   function debug()
   {
      this.CREATE_VIEW(0,0);
      this.CREATE_VIEW(1,0);
      this.CREATE_VIEW(2,1);
      this.CREATE_VIEW(3,2);
      this.SET_LABELS("#SKILL","#ACCURRACY","#CUT","#heist title","#todo","#approach","#apprA","#apprB");
      this.SET_DATA_SLOT(0,0,7,"name here1","skill here1","Skilled1","750","250");
      this.SET_DATA_SLOT(0,1,2,"name here2","skill here1","Skilled1","750","250");
      this.SET_DATA_SLOT(0,2,3,"name here3","skill here1","Skilled1","750","250");
      this.SET_DATA_SLOT(0,3,4,"name here4","skill here1","Skilled1","750","250");
      this.SET_DATA_SLOT(0,4,5,"name here5","skill here1","Skilled1","750","250");
      this.SET_DATA_SLOT(1,0,6);
      this.SET_DATA_SLOT(1,1,7);
      this.SET_DATA_SLOT(2,0,3);
      this.SET_DATA_SLOT(2,1,4);
      this.SET_DATA_SLOT(3,0,1,"Photograph Ship");
      this.SET_DATA_SLOT(3,1,0,"Investigate Escape Routes");
      this.SET_DATA_SLOT(3,2,1,"Check On-Board Security");
      this.SET_DATA_SLOT(3,3,1,"Decide approach");
      this.SET_DATA_SLOT(3,4,1,"Pick Crew");
      this.DISPLAY_VIEW(0);
      this.DISPLAY_VIEW(1);
      this.DISPLAY_VIEW(2);
      this.DISPLAY_VIEW(3);
      this.SHOW_HEIST_ASSET(0,1);
      this.SHOW_HEIST_ASSET(1,1);
      this.SHOW_HEIST_ASSET(2,1);
      this.SHOW_HEIST_ASSET(3,1);
      this.SHOW_HEIST_ASSET(4,1);
      this.SHOW_HEIST_ASSET(5,1);
      this.FOCUS_VIEW(1);
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
         this.SHOW_VIEW(0,0);
      }
   }
   function CREATE_VIEW(viewIndex, viewType, xp, yp)
   {
      var _loc6_ = [116,278,524,550];
      var _loc5_ = [395,400,254,114];
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
      var _loc7_ = arguments[6];
      var _loc6_ = arguments[7];
      com.rockstargames.gtav.levelDesign.heists.HeistModel(this.model).setLabel(_weaponname,_jobcut,_accuracy,_loc7_,_loc6_);
      var _loc4_ = arguments[3];
      var _loc3_ = arguments[4];
      var _loc5_ = arguments[5];
      if(_loc4_ != undefined)
      {
         this.CONTENT.boardMC.tape01.headingTF.text = _loc4_;
      }
      if(_loc3_ != undefined)
      {
         this.CONTENT.boardMC.tape02.headingTF.text = _loc3_;
      }
      if(_loc5_ != undefined)
      {
         this.CONTENT.boardMC.tape03.headingTF.text = _loc5_;
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
