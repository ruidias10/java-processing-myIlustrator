class OBJ_Point extends OBJ { 

  boolean ponto1 = false;
  
  int x1, y1, x2, y2;
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_Point()
  {
    this.type="Ponto";
    this.isvisible = true;
    this.OBJ_vetor = new int[2];
  }
  //=================================================================


  // Desenha o que tem na memória
  //=================================================================
  void myRedraw()
  {
    if (this.isvisible == true)
    {
      color black = color(0);
      set(this.OBJ_vetor[0],this.OBJ_vetor[1], black);
    }
  }
  //=================================================================


  // Inicia o processo de desenhar
  //=================================================================
  boolean desenha(boolean snap, int gridX, int gridY)
  {
    if(this.ponto1==false) 
    {
      println("FONIX FALSOOOO");
      if (mousePressed && (mouseButton == LEFT))
      {
        if (snap == true)
        {
          this.x1 = (int)mouseX/gridX;
          this.y1 = (int)mouseY/gridY; 
          
          this.x1 = this.x1*gridX+5;
          this.y1 = this.y1*gridY+2;
        }
        else
        {
          this.x1 = mouseX;
          this.y1 = mouseY; 
        }

        if (this.isValidatePosition() == true)
          this.ponto1=true;


        this.OBJ_vetor[0]=this.x1;
        this.OBJ_vetor[1]=this.y1;
        
        return true;
      }
    }

    return false;
   } 

}   
