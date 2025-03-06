class com.rockstargames.gtav.levelDesign.nightclub.structs.Technician
{
   var assignmentIndex;
   var isAvailable;
   var isOnSale;
   function Technician()
   {
      this.assignmentIndex = -1;
      this.isAvailable = false;
      this.isOnSale = false;
   }
   function get isAssigned()
   {
      return this.assignmentIndex != -1;
   }
}
