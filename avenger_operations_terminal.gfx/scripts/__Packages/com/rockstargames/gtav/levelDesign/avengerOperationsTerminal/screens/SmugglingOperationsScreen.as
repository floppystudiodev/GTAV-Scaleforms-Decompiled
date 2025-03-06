class com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.SmugglingOperationsScreen extends com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.screens.Screen
{
   var view;
   var buttons;
   var cursor;
   var operationDataObject;
   var numButtons = 3;
   function SmugglingOperationsScreen(app, viewContainer, cursor, dataObject)
   {
      super(app,viewContainer,cursor,"smugglingOperationsScreen",dataObject);
      this.init();
   }
   function init()
   {
      this.setUpLabel(this.view.title,"AOT_SMUGGLING_OPERATIONS",false,"center","left");
      this.view.bar._width = this.view.title.textWidth + 20;
      this.buttons = [];
      var _loc2_ = 0;
      while(_loc2_ <= this.numButtons)
      {
         this.view["button_" + _loc2_]._visible = false;
         this.initButton(com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.ButtonIDs["SMUGGLING_OPERATION_" + _loc2_],this.view["button_" + _loc2_]);
         _loc2_ = _loc2_ + 1;
      }
      this.cursor.snapTo(this.buttons[0].cx,this.buttons[0].cy);
   }
   function UPDATE_OPERATION()
   {
      var _loc2_ = this.operationDataObject.index;
      this.setUpText(this.view["button_" + _loc2_].title,this.operationDataObject.title,true,"center","left");
      this.view["button_" + _loc2_].title.text = "//" + this.view["button_" + _loc2_].title.text;
      this.view["button_" + _loc2_].bar._width = this.view["button_" + _loc2_].title.textWidth + 5;
      this.setUpText(this.view["button_" + _loc2_].description,this.operationDataObject.description,false,"top","left");
      this.setUpLabel(this.view["button_" + _loc2_].rewardLabel,"AOT_REWARD",false,"center","left");
      this.setUpText(this.view["button_" + _loc2_].reward,this.operationDataObject.reward,false,"top","right");
      this.setUpLabel(this.view["button_" + _loc2_].difficulty,"AOT_LEVEL",false,"center","left");
      this.view["button_" + _loc2_].difficulty.text = "/" + this.view["button_" + _loc2_].difficulty.text + "/" + this.operationDataObject.difficulty;
      this.view["button_" + _loc2_].checkMark._visible = false;
      this.view["button_" + _loc2_].lock._visible = false;
      if(this.operationDataObject.status == 1)
      {
         this.view["button_" + _loc2_].checkMark._visible = true;
      }
      else if(this.operationDataObject.status == 2)
      {
         this.view["button_" + _loc2_].lock._visible = true;
      }
      this.view["button_" + _loc2_].image.gotoAndStop(_loc2_ + 1);
      this.view["button_" + _loc2_].background.gotoAndStop(1);
      this.view["button_" + _loc2_]._visible = true;
      if(_loc2_ == 0)
      {
         this.view["button_" + _loc2_].checkMark.gotoAndStop(2);
         this.view["button_" + _loc2_].background.gotoAndStop(2);
         this.view["button_" + _loc2_].title.textColor = 8315228;
         this.view["button_" + _loc2_].difficulty.textColor = 0;
         this.view["button_" + _loc2_].description.textColor = 0;
         this.view["button_" + _loc2_].rewardLabel.textColor = 8315228;
         this.view["button_" + _loc2_].reward.textColor = 8315228;
         this.view["button_" + _loc2_].bar.gotoAndStop(2);
      }
   }
   function initButton(id, buttonView)
   {
      var _loc2_ = new com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.Button(id,buttonView);
      this.buttons.push(_loc2_);
      this.cursor.addTarget(_loc2_);
   }
   function onTargetChange(activeTarget)
   {
      var _loc2_ = 0;
      while(_loc2_ <= this.buttons.length)
      {
         if(activeTarget.id == com.rockstargames.gtav.levelDesign.avengerOperationsTerminal.ui.ButtonIDs["SMUGGLING_OPERATION_" + _loc2_])
         {
            this.view["button_" + _loc2_].checkMark.gotoAndStop(2);
            this.view["button_" + _loc2_].background.gotoAndStop(2);
            this.view["button_" + _loc2_].title.textColor = 8315228;
            this.view["button_" + _loc2_].difficulty.textColor = 0;
            this.view["button_" + _loc2_].description.textColor = 0;
            this.view["button_" + _loc2_].rewardLabel.textColor = 8315228;
            this.view["button_" + _loc2_].reward.textColor = 8315228;
            this.view["button_" + _loc2_].bar.gotoAndStop(2);
         }
         else
         {
            this.view["button_" + _loc2_].checkMark.gotoAndStop(1);
            this.view["button_" + _loc2_].background.gotoAndStop(1);
            this.view["button_" + _loc2_].title.textColor = 0;
            this.view["button_" + _loc2_].difficulty.textColor = 8315228;
            this.view["button_" + _loc2_].description.textColor = 8315228;
            this.view["button_" + _loc2_].rewardLabel.textColor = 0;
            this.view["button_" + _loc2_].reward.textColor = 0;
            this.view["button_" + _loc2_].bar.gotoAndStop(1);
         }
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
