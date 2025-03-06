class com.rockstargames.gtav.levelDesign.robberyComputer.screens.MissionScreen extends com.rockstargames.gtav.levelDesign.robberyComputer.screens.Screen
{
   var buttons;
   var showingMissionInfo;
   var view;
   var cursor;
   var app;
   function MissionScreen(app, viewContainer, cursor, overlay)
   {
      super(app,viewContainer,cursor,overlay,"missionScreen");
      this.init();
   }
   function init()
   {
      this.buttons = [];
      this.showingMissionInfo = [false,false,false,false];
      var _loc3_ = undefined;
      _loc3_ = new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.MissionButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_1,this.view.missionButton0);
      _loc3_.navLeft = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      _loc3_.navRight = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_2;
      _loc3_.navUp = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      _loc3_.navDown = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_3;
      this.buttons.push(_loc3_);
      _loc3_ = new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.MissionButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_2,this.view.missionButton1);
      _loc3_.navLeft = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_1;
      _loc3_.navRight = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      _loc3_.navUp = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      _loc3_.navDown = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_4;
      this.buttons.push(_loc3_);
      _loc3_ = new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.MissionButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_3,this.view.missionButton2);
      _loc3_.navLeft = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      _loc3_.navRight = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_4;
      _loc3_.navUp = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_1;
      _loc3_.navDown = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      this.buttons.push(_loc3_);
      _loc3_ = new com.rockstargames.gtav.levelDesign.robberyComputer.navigation.MissionButton(com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_4,this.view.missionButton3);
      _loc3_.navLeft = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_3;
      _loc3_.navRight = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      _loc3_.navUp = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.ButtonIDs.MISSION_2;
      _loc3_.navDown = com.rockstargames.gtav.levelDesign.robberyComputer.navigation.Cursor.NULL_TARGET_ID;
      this.buttons.push(_loc3_);
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.cursor.addTarget(this.buttons[_loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.snapToTarget(this.buttons[0]);
      this.onTargetChange(this.cursor.getTargetUnderCursor());
      this.view.missionButton0.topNode._visible = false;
      this.view.missionButton0.leftNode._visible = false;
      this.view.missionButton1.topNode._visible = false;
      this.view.missionButton1.rightNode._visible = false;
      this.view.missionButton2.topNode._visible = false;
      this.view.missionButton2.bottomNode._visible = false;
      this.view.missionButton3.bottomNode._visible = false;
      this.view.missionButton3.rightNode._visible = false;
      this.view.rewardLabel.verticalAlign = "center";
      com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.setLocalisedText(this.view.rewardLabel,"ROBBERY_CMP_RWD");
      this.view.reward.verticalAlign = "center";
      this.updateMissions();
   }
   function updateMissions()
   {
      this.resetView();
      if(this.app.activeRobberyIndex >= 0 && this.app.activeRobberyIndex < com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.MAX_ROBBERIES)
      {
         var _loc4_ = this.app.robberies[this.app.activeRobberyIndex];
         if(_loc4_ != null)
         {
            this.view.heading.text = _loc4_.name.toUpperCase();
            this.view.reward.text = "$" + com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.formatNumber(_loc4_.payment);
            var _loc3_ = 0;
            while(_loc3_ < _loc4_.missions.length)
            {
               var _loc2_ = _loc4_.missions[_loc3_];
               if(_loc2_ != null)
               {
                  this.buttons[_loc3_].enabled = true;
                  this.buttons[_loc3_].populateView(_loc2_.name,_loc2_.description,_loc2_.textureDictionary,_loc2_.textureName,_loc2_.completionState,_loc2_.available,this.app.imageManager);
               }
               _loc3_ = _loc3_ + 1;
            }
         }
      }
      var _loc5_ = true;
      _loc5_ = this.updateLink(this.view.link01,_loc4_.missions[0],_loc4_.missions[1]) && _loc5_;
      _loc5_ = this.updateLink(this.view.link02,_loc4_.missions[0],_loc4_.missions[2]) && _loc5_;
      _loc5_ = this.updateLink(this.view.link12,_loc4_.missions[1],_loc4_.missions[2]) && _loc5_;
      this.view.link12._visible = !_loc5_;
      this.view.link13._visible = _loc5_;
      this.view.link23._visible = _loc5_;
      this.view.missionButton1.bottomNode._visible = !_loc5_;
      this.view.missionButton1.rightNode._visible = _loc5_;
      var _loc6_ = _loc4_.missions[3].completionState == 1 && _loc5_;
      this.view.link13.gotoAndStop(!_loc6_ ? "off" : "on");
      this.view.link23.gotoAndStop(!_loc6_ ? "off" : "on");
   }
   function updateLink(link, mission0, mission1)
   {
      var _loc1_ = mission0.completionState == 1 && mission1.completionState == 1;
      link.gotoAndStop(!_loc1_ ? "off" : "on");
      return _loc1_;
   }
   function customCancelResponse()
   {
      this.app.SHOW_SCREEN(this.app.MAIN_SCREEN);
      return false;
   }
   function toggleMissionInfo()
   {
      var _loc4_ = this.cursor.getTargetUnderCursor();
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         var _loc3_ = this.buttons[_loc2_];
         if(_loc3_.id == _loc4_.id)
         {
            this.showingMissionInfo[_loc2_] = !this.showingMissionInfo[_loc2_];
         }
         else
         {
            this.showingMissionInfo[_loc2_] = false;
         }
         _loc3_.infoVisible = this.showingMissionInfo[_loc2_];
         _loc2_ = _loc2_ + 1;
      }
   }
   function resetView()
   {
      this.view.title.text = "";
      this.view.payment.text = "";
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_].enabled = false;
         _loc2_ = _loc2_ + 1;
      }
   }
   function handleButtonInput(inputID)
   {
      switch(inputID)
      {
         case com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.ACCEPT:
            this.handleAcceptButton(this.cursor.getTargetUnderCursor());
            break;
         case com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.CANCEL:
            break;
         case com.rockstargames.gtav.levelDesign.ROBBERY_COMPUTER.Y:
            this.toggleMissionInfo();
      }
   }
   function handleAcceptButton(target)
   {
   }
   function onTargetChange(target)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         var _loc3_ = this.buttons[_loc2_];
         _loc3_.setState(_loc3_ == target);
         _loc2_ = _loc2_ + 1;
      }
   }
   function setButtonsEnabled(enabled)
   {
      var _loc2_ = 0;
      while(_loc2_ < this.buttons.length)
      {
         this.buttons[_loc2_].enabled = enabled;
         _loc2_ = _loc2_ + 1;
      }
   }
   function dispose()
   {
      var _loc3_ = 0;
      while(_loc3_ < this.buttons.length)
      {
         this.cursor.removeTarget(this.buttons[_loc3_]);
         _loc3_ = _loc3_ + 1;
      }
      this.buttons = [];
      super.dispose();
   }
}
