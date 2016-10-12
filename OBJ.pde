class OBJ { 
  
  String type;
  int[] OBJ_vetor;
  int[][] OBJ_poliVetor;
  boolean isvisible;

  //=================================================================
  void myRedraw() { }

  //================================================================= 
  boolean edita() { return true; } 

  //=================================================================
  boolean desenha() { return true; }
  boolean desenha(boolean snap, int gridX, int gridY) { return true; }
   
  //================================================================= 
  String getType() { return this.type; } 
 
  //================================================================= 
  boolean isVisible_() { return this.isvisible; }

  //=================================================================
  void setVisible_() 
  {
    if (this.isvisible == true)
    {
      this.isvisible = false;
    }
    else
    {
      this.isvisible = true;
    }
  } 

  //=================================================================
  void validatePosition()
  {
    if(mouseX < 77) mouseX = 77;
    if(mouseX > width-243) mouseX = width-243;
    if(mouseY < 64) mouseY = 64;
    if(mouseY > height) mouseY = height;
  }
  
  //=================================================================
  boolean isValidatePosition()
  {
    if(mouseX < 77) return false;
    if(mouseX > width-243) return false;
    if(mouseY < 64) return false;
    if(mouseY > height) return false;
    
    return true;
  }
  
  //=================================================================
  int getSizeOBJVetor()
  {
    return OBJ_vetor.length;
  }
  
  //=================================================================
  int getSizeOBJPoliVetor()
  {
    return OBJ_poliVetor.length;
  }
}
