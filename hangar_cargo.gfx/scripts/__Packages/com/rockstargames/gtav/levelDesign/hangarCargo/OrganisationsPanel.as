class com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel
{
   var view;
   var allButtons;
   var activeButtons;
   var noButtons;
   var organisations;
   var listOffset;
   var arrowMinY;
   var arrowMaxY;
   var onColour;
   var offColour;
   var showing;
   static var MAX_ORGANISATIONS = 5;
   static var MAX_MEMBERS = 6;
   static var PANEL_FADE_DELAY = 0.3;
   static var PANEL_FADE_DURATION = 0.25;
   static var ELEMENT_FADE_IN_DURATION = 0.5;
   static var ELEMENT_FADE_IN_STEP = 0.1;
   static var LIST_SCROLL_STEP = 1.4;
   function OrganisationsPanel(view)
   {
      this.view = view;
      this.init();
   }
   function init()
   {
      this.allButtons = [];
      this.activeButtons = [];
      this.noButtons = [];
      this.organisations = [];
      this.listOffset = 0;
      this.arrowMinY = 0.5 * this.view.memberPanel.arrow._height;
      this.arrowMaxY = this.view.memberPanel._height - 0.5 * this.view.memberPanel.arrow._height;
      this.onColour = new flash.geom.ColorTransform();
      this.onColour.rgb = 16777215;
      this.offColour = new flash.geom.ColorTransform();
      this.offColour.rgb = 6736998;
      this.view.title.label.textAutoSize = "shrink";
      this.view.title._alpha = 0;
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.title.label,"HC_ORGS");
      this.view.memberPanel.title.label.textAutoSize = "shrink";
      com.rockstargames.gtav.levelDesign.HANGAR_CARGO.setLocalisedText(this.view.memberPanel.title.label,"HC_MEMBERS");
      this.view.memberPanel._alpha = 0;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.MAX_ORGANISATIONS)
      {
         var _loc3_ = this.view["listItem" + _loc2_];
         _loc3_.transform.colorTransform = this.offColour;
         _loc3_._alpha = 0;
         this.allButtons.push(new com.rockstargames.gtav.levelDesign.hangarCargo.Button(com.rockstargames.gtav.levelDesign.HANGAR_CARGO["ORGANISATION_" + _loc2_],_loc3_));
         _loc2_ = _loc2_ + 1;
      }
      this.hide(true);
   }
   function update(organisations)
   {
      this.organisations = organisations;
      this.redrawOrganisationList(this.listOffset);
      if(!this.showing)
      {
         this.show();
      }
   }
   function redrawOrganisationList(offset)
   {
      var _loc4_ = this.organisations.length;
      this.activeButtons.length = 0;
      this.listOffset = offset;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.MAX_ORGANISATIONS)
      {
         var _loc6_ = this.view["listItem" + _loc2_].label;
         var _loc3_ = (_loc2_ + offset) % _loc4_;
         var _loc5_ = _loc2_ >= _loc4_ ? "" : this.organisations[_loc3_].name;
         com.rockstargames.gtav.levelDesign.HANGAR_CARGO.truncate(_loc6_,_loc5_,"left");
         if(_loc2_ < _loc4_)
         {
            this.activeButtons.push(this.allButtons[_loc3_]);
         }
         _loc2_ = _loc2_ + 1;
      }
      if(_loc4_ > com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.MAX_ORGANISATIONS)
      {
         offset = (offset + 1) % _loc4_;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.listItem0,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.LIST_SCROLL_STEP,{onCompleteScope:this,onComplete:this.redrawOrganisationList,onCompleteArgs:[offset]});
      }
   }
   function showOrganisationMembers(listIndex)
   {
      var _loc10_ = (listIndex + this.listOffset) % this.organisations.length;
      var _loc9_ = this.organisations[_loc10_];
      var _loc7_ = _loc9_.members.length;
      if(_loc7_ < 1)
      {
         return undefined;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.listItem0);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.memberPanel.listItem0);
      this.redrawMemberList(_loc9_.members,0);
      var _loc6_ = 11;
      var _loc11_ = Math.max(1,Math.min(_loc7_,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.MAX_MEMBERS));
      var _loc5_ = _loc11_ * this.view.memberPanel.listItem0._height + this.view.memberPanel.listItem0._y - this.view.memberPanel.bg._y + _loc6_;
      this.view.memberPanel.bg._height = _loc5_;
      var _loc8_ = this.view["listItem" + listIndex];
      var _loc3_ = _loc8_._y + 0.5 * _loc8_._height;
      var _loc4_ = this.view.memberPanel.bg._y + _loc5_ - 0.5 * this.view.memberPanel.arrow._height - _loc6_;
      var _loc12_ = _loc3_ <= _loc4_ ? 0 : _loc3_ - _loc4_;
      this.view.memberPanel._y = _loc12_;
      var _loc2_ = _loc3_ - this.view.memberPanel._y;
      _loc2_ = Math.max(Math.min(this.arrowMaxY,_loc2_),this.arrowMinY);
      this.view.memberPanel.arrow._y = _loc2_;
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.memberPanel,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.PANEL_FADE_DURATION,{_alpha:100});
   }
   function hideOrganisationMembers()
   {
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.memberPanel.listItem0);
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.memberPanel,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.PANEL_FADE_DURATION,{_alpha:0});
      this.redrawOrganisationList(this.listOffset);
   }
   function redrawMemberList(members, offset)
   {
      var _loc6_ = members.length;
      var _loc2_ = 0;
      while(_loc2_ < com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.MAX_MEMBERS)
      {
         var _loc4_ = this.view.memberPanel["listItem" + _loc2_].label;
         var _loc5_ = (_loc2_ + offset) % _loc6_;
         var _loc3_ = _loc2_ >= _loc6_ ? "" : members[_loc5_];
         com.rockstargames.gtav.levelDesign.HANGAR_CARGO.truncate(_loc4_,_loc3_,"left");
         _loc2_ = _loc2_ + 1;
      }
      if(_loc6_ > com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.MAX_MEMBERS)
      {
         offset = (offset + 1) % _loc6_;
         com.rockstargames.ui.tweenStar.TweenStarLite.delayCall(this.view.memberPanel.listItem0,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.LIST_SCROLL_STEP,{onCompleteScope:this,onComplete:this.redrawMemberList,onCompleteArgs:[members,offset]});
      }
   }
   function show(immediate)
   {
      if(immediate)
      {
         this.view._alpha = 100;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.PANEL_FADE_DURATION,{_alpha:100,delay:com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.PANEL_FADE_DELAY,onCompleteScope:this,onComplete:this.onMainFadeInComplete});
      }
      this.showing = true;
   }
   function onMainFadeInComplete()
   {
      var _loc3_ = {_alpha:100,delay:0};
      var _loc2_ = this.allButtons.length - 1;
      while(_loc2_ >= 0)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.allButtons[_loc2_].view,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.ELEMENT_FADE_IN_DURATION,_loc3_);
         _loc3_.delay += com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.ELEMENT_FADE_IN_STEP;
         _loc2_ = _loc2_ - 1;
      }
      _loc3_.onCompleteScope = this;
      _loc3_.onComplete = this.redrawOrganisationList;
      _loc3_.onCompleteArgs = [0];
      com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view.title,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.ELEMENT_FADE_IN_DURATION,_loc3_);
   }
   function hide(immediate)
   {
      if(immediate)
      {
         this.view._alpha = 0;
      }
      else
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.to(this.view,com.rockstargames.gtav.levelDesign.hangarCargo.OrganisationsPanel.PANEL_FADE_DURATION,{_alpha:0});
      }
      this.showing = false;
   }
   function updateSelectedButton(activeButtonID)
   {
      var _loc3_ = 0;
      var _loc4_ = this.allButtons.length;
      while(_loc3_ < _loc4_)
      {
         var _loc2_ = this.allButtons[_loc3_];
         if(_loc2_.id == activeButtonID)
         {
            _loc2_.view.transform.colorTransform = this.onColour;
         }
         else
         {
            _loc2_.view.transform.colorTransform = this.offColour;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
   function get buttons()
   {
      return !this.showing ? this.noButtons : this.activeButtons;
   }
   function dispose()
   {
      var _loc2_ = this.allButtons.length - 1;
      while(_loc2_ >= 0)
      {
         com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.allButtons[_loc2_].view);
         _loc2_ = _loc2_ - 1;
      }
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.memberPanel.listItem0);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.memberPanel);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view.title);
      com.rockstargames.ui.tweenStar.TweenStarLite.removeTweenOf(this.view);
      this.allButtons = null;
      this.activeButtons = null;
      this.noButtons = null;
      this.organisations = null;
      this.onColour = null;
      this.offColour = null;
   }
}
