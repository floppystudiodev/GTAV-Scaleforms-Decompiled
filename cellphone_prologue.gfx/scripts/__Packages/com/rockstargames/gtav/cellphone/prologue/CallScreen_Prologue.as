class com.rockstargames.gtav.cellphone.prologue.CallScreen_Prologue extends com.rockstargames.ui.core.PhoneUIComponent
{
   var header;
   var container;
   var content;
   var linkageKey;
   var offsetY;
   var offsetX;
   var dataProviderUI;
   var TextBlackHex;
   var _callState;
   var isEngaged = false;
   var offStateAlpha = 60;
   function CallScreen_Prologue()
   {
      super();
   }
   function construct(parentContainer, linkageID, params)
   {
      super.construct(parentContainer,linkageID,params);
      this.renderContainers();
   }
   function renderContainers()
   {
      this.header._visible = false;
      if(this.container.content == undefined)
      {
         this.content = this.container.attachMovie(this.linkageKey,"content",this.container.getNextHighestDepth(),{_x:this.offsetX,_y:this.offsetY});
      }
      this.populateContent();
   }
   function populateContent()
   {
      this.callState = this.dataProviderUI[0][0];
      switch(this.callState)
      {
         case com.rockstargames.gtav.cellphone.CallState.INITIAL_OUTGOING_CALL[0]:
            this.content.gotoAndStop("INITIAL_OUTGOING_CALL");
            break;
         case com.rockstargames.gtav.cellphone.CallState.INITIAL_INCOMING_CALL[0]:
            this.content.gotoAndStop("DEFAULT");
            break;
         case com.rockstargames.gtav.cellphone.CallState.ACTIVE_CALL[0]:
            this.content.gotoAndStop("ACTIVE_CALL");
            this.content.fromAddress.textColor = this.TextBlackHex;
            break;
         case com.rockstargames.gtav.cellphone.CallState.ACTIVE_CALL_WAITING_FOR_RESPONSE[0]:
            this.content.gotoAndStop("INITIAL_OUTGOING_CALL");
            break;
         case com.rockstargames.gtav.cellphone.CallState.ENGAGED_CALL[0]:
            this.content.gotoAndStop("DEFAULT");
            this.content.fromAddress._alpha = this.offStateAlpha;
            this.content.fromAddress.textColor = this.TextBlackHex;
            this.content.jobTitle._alpha = this.offStateAlpha;
            break;
         case com.rockstargames.gtav.cellphone.CallState.ANSWERPHONE_CALL[0]:
            this.content.gotoAndStop("ACTIVE_CALL");
      }
      this.content.fromAddress._alpha = 100;
      this.content.jobTitle._alpha = 100;
      var _loc2_ = this.dataProviderUI[0][1];
      var _loc3_ = this.dataProviderUI[0][3];
      if(_loc2_)
      {
         this.content.fromAddress.text = _loc2_;
         this.content.fromAddress.textColor = this.TextBlackHex;
      }
      if(_loc3_)
      {
         this.content.jobTitle.text = _loc3_;
         this.content.jobTitle.textColor = this.TextBlackHex;
      }
   }
   function get callState()
   {
      return this._callState;
   }
   function set callState(newCallState)
   {
      this._callState = newCallState;
   }
}
