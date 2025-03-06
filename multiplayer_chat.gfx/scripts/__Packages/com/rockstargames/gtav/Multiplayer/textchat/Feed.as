class com.rockstargames.gtav.Multiplayer.textchat.Feed
{
   var numLines;
   var mc;
   var historyOffset;
   var nextLine;
   var lines;
   var nameFormat;
   var scopeFormat;
   var messageFormat;
   static var UID = 0;
   static var LINE_SPACING = 0;
   static var DROP_SHADOW = new flash.filters.DropShadowFilter(1,45,0,1,1,1,0.6,3);
   static var EASE_DURATION = 0.5;
   static var EASE_CURVE = com.rockstargames.ui.tweenStar.Ease.CIRCULAR_OUT;
   function Feed(container, x, y, width, align, numLines)
   {
      this.numLines = numLines + 1;
      this.init(container,x,y,width,align);
   }
   function show()
   {
      this.mc._visible = true;
   }
   function hide()
   {
      this.mc._visible = false;
   }
   function reset()
   {
      this.historyOffset = 0;
      this.nextLine = 0;
      var _loc2_ = 0;
      while(_loc2_ < this.numLines)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.lines[_loc2_]);
         this.lines[_loc2_]._alpha = 0;
         this.lines[_loc2_]._y = 0;
         this.lines[_loc2_].goalY = 0;
         this.lines[_loc2_].label.text = "";
         _loc2_ = _loc2_ + 1;
      }
   }
   function addLine(name, scope, message, nameColour, addToTop, forceFinishTweens)
   {
      if(name == undefined || name.length == 0)
      {
         return undefined;
      }
      if(message == undefined || message.length == 0)
      {
         return undefined;
      }
      if(addToTop)
      {
         this.addLineToTop(name,scope,message,nameColour,forceFinishTweens);
      }
      else
      {
         this.addLineToBottom(name,scope,message,nameColour,forceFinishTweens);
      }
   }
   function get maxLines()
   {
      return this.numLines;
   }
   function init(container, x, y, width, align)
   {
      this.nameFormat = new TextFormat("$Font2_cond",20,16777215,false,false,false,"","",align);
      this.scopeFormat = new TextFormat("$Font2",13,12632256,false,false,false,"","",align);
      this.messageFormat = new TextFormat("$Font2",13,16777215,false,false,false,"","",align);
      this.mc = container.createEmptyMovieClip("feed" + com.rockstargames.gtav.Multiplayer.textchat.Feed.UID++,container.getNextHighestDepth());
      this.mc._x = x;
      this.mc._y = y;
      this.lines = new Array(this.numLines);
      var _loc3_ = 0;
      while(_loc3_ < this.numLines)
      {
         var _loc4_ = this.mc.createEmptyMovieClip("line" + _loc3_,_loc3_);
         _loc4_._alpha = 0;
         _loc4_.goalY = 0;
         this.lines[_loc3_] = _loc4_;
         var _loc2_ = _loc4_.createTextField("label",0,0,0,width,com.rockstargames.gtav.Multiplayer.textchat.Feed.LINE_SPACING);
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.embedFonts = true;
         _loc2_.autoSize = "left";
         _loc2_.filters = [com.rockstargames.gtav.Multiplayer.textchat.Feed.DROP_SHADOW];
         _loc2_.selectable = false;
         _loc3_ = _loc3_ + 1;
      }
      this.nextLine = 0;
      this.historyOffset = 0;
   }
   function RepositionMoviePostScreeenAdjust(x, y)
   {
      this.mc._x = x;
      this.mc._y = y;
   }
   function addLineToBottom(name, scope, message, nameColour, forceFinishTweens)
   {
      var _loc7_ = this.lines[this.nextLine];
      this.setLineText(_loc7_,name,scope,message,nameColour);
      _loc7_._alpha = 0;
      _loc7_._y = com.rockstargames.gtav.Multiplayer.textchat.Feed.LINE_SPACING;
      var _loc5_ = {ease:com.rockstargames.gtav.Multiplayer.textchat.Feed.EASE_CURVE,_y:- _loc7_._height,_alpha:100};
      var _loc4_ = - _loc7_._height;
      var _loc2_ = 0;
      while(_loc2_ < this.numLines)
      {
         var _loc6_ = (this.nextLine + this.numLines - _loc2_) % this.numLines;
         var _loc3_ = this.lines[_loc6_];
         if(_loc2_ > 0)
         {
            _loc4_ -= com.rockstargames.gtav.Multiplayer.textchat.Feed.LINE_SPACING + _loc3_._height;
         }
         if(_loc2_ == this.numLines - 1)
         {
            _loc5_._alpha = 0;
         }
         _loc3_.goalY = _loc4_ + 0.5 | 0;
         _loc5_._y = _loc4_ + 0.5 | 0;
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc3_,com.rockstargames.gtav.Multiplayer.textchat.Feed.EASE_DURATION,_loc5_);
         if(forceFinishTweens)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(_loc3_,true);
         }
         _loc2_ = _loc2_ + 1;
      }
      this.nextLine = (this.nextLine + 1) % this.numLines;
   }
   function addLineToTop(name, scope, message, nameColour, forceFinishTweens)
   {
      var _loc8_ = this.lines[this.nextLine];
      this.setLineText(_loc8_,name,scope,message,nameColour);
      _loc8_._alpha = 0;
      _loc8_._y = this.lines[(this.nextLine + 1) % this.numLines]._y - _loc8_._height - com.rockstargames.gtav.Multiplayer.textchat.Feed.LINE_SPACING;
      var _loc5_ = {ease:com.rockstargames.gtav.Multiplayer.textchat.Feed.EASE_CURVE,_y:com.rockstargames.gtav.Multiplayer.textchat.Feed.LINE_SPACING,_alpha:0};
      var _loc4_ = com.rockstargames.gtav.Multiplayer.textchat.Feed.LINE_SPACING;
      var _loc3_ = 0;
      while(_loc3_ < this.numLines)
      {
         var _loc6_ = (this.nextLine - 1 + this.numLines - _loc3_) % this.numLines;
         var _loc2_ = this.lines[_loc6_];
         if(_loc3_ > 0)
         {
            _loc4_ -= com.rockstargames.gtav.Multiplayer.textchat.Feed.LINE_SPACING + _loc2_._height;
            _loc5_._alpha = 100;
         }
         _loc2_.goalY = _loc4_ + 0.5 | 0;
         _loc5_._y = _loc4_ + 0.5 | 0;
         if(forceFinishTweens)
         {
            com.rockstargames.ui.tweenStar.TweenStarLite.endTweenOf(_loc2_,true);
         }
         com.rockstargames.ui.tweenStar.TweenStarLite.to(_loc2_,com.rockstargames.gtav.Multiplayer.textchat.Feed.EASE_DURATION,_loc5_);
         _loc3_ = _loc3_ + 1;
      }
      this.nextLine = (this.nextLine - 1 + this.numLines) % this.numLines;
   }
   function setLineText(container, name, scope, message, nameColour)
   {
      if(scope.length > 0)
      {
         scope = " [" + scope.toUpperCase() + "] ";
      }
      else
      {
         scope = " ";
      }
      if(isNaN(nameColour))
      {
         nameColour = 16777215;
      }
      this.nameFormat.color = nameColour;
      var _loc5_ = name.length;
      var _loc4_ = _loc5_ + scope.length;
      var _loc6_ = _loc4_ + message.length;
      var _loc2_ = container.label;
      _loc2_.text = name + scope + message;
      _loc2_.setTextFormat(0,_loc5_,this.nameFormat);
      _loc2_.setTextFormat(_loc5_,_loc4_,this.scopeFormat);
      _loc2_.setTextFormat(_loc4_,_loc6_,this.messageFormat);
   }
}
