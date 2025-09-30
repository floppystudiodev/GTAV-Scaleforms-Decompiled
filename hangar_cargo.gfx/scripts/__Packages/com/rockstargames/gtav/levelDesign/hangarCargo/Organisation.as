class com.rockstargames.gtav.levelDesign.hangarCargo.Organisation
{
   var _members;
   var _nom;
   function Organisation(_nom, _members)
   {
      this._nom = _nom;
      this._members = _members;
   }
   function get name()
   {
      return this._nom;
   }
   function get members()
   {
      return this._members;
   }
}
