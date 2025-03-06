class com.rockstargames.gtav.minigames.horseracingconsole.screens.RulesScreen extends com.rockstargames.gtav.minigames.horseracingconsole.Screen
{
   var currActiveElementID;
   var view;
   var buttons;
   var cursor;
   var app;
   function RulesScreen(app, viewContainer, cursor)
   {
      super(app,viewContainer,"rulesScreen",cursor);
      this.init();
   }
   function init()
   {
      super.init();
      this.currActiveElementID = -1;
      this.view.heading.textAutoSize = "shrink";
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.heading,"HORSEGAME_RULES",4,true,false);
      var _loc5_ = this.view.heading1._y;
      var _loc4_ = 1;
      while(_loc4_ <= 5)
      {
         var _loc3_ = this.view["heading" + _loc4_];
         _loc3_.textAutoSize = "shrink";
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(_loc3_,"HORSEGAME_RULES_H" + _loc4_,2,true,false);
         _loc3_._y = _loc5_;
         _loc5_ += 33;
         _loc3_ = this.view["body" + _loc4_];
         _loc3_.autoSize = "left";
         com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setLocalisedText(_loc3_,"HORSEGAME_RULES_B" + _loc4_);
         _loc3_._y = _loc5_;
         _loc5_ += _loc3_._height + 20;
         _loc4_ = _loc4_ + 1;
      }
      com.rockstargames.gtav.minigames.horseracingconsole.HORSE_RACING_CONSOLE.setSpacedText(this.view.closeButton.label,"HORSEGAME_CLOSE",3,true,false);
      var _loc6_ = new com.rockstargames.gtav.minigames.horseracingconsole.NavigationElement(this.view.closeButton,com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.CANCEL_BUTTON);
      this.buttons.push(_loc6_);
      this.cursor.setChangeListener(this.delegate(this,this.onActiveElementChange));
      this.cursor.show();
   }
   function onActiveElementChange(activeElementID)
   {
      if(activeElementID != -1 && activeElementID != this.currActiveElementID)
      {
         this.app.playSound("nav_hover");
      }
      this.currActiveElementID = activeElementID;
      this.buttons[0].view.gotoAndStop(activeElementID != com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.CANCEL_BUTTON ? "off" : "on");
   }
   function handleAccept()
   {
      if(this.cursor.getTargetIDUnderCursor() == com.rockstargames.gtav.minigames.horseracingconsole.NavigationIDs.CANCEL_BUTTON)
      {
         this.app.playSound("nav_back");
      }
   }
}
