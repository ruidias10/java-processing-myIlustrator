class OBJ_Triangle extends OBJ { 

  boolean ponto1 = false;
  boolean quadFeito = false;

  int r, g, b, size;
  int xi, yi, xf, yf, xx, yy;
  int OBJ_roundedCorners = 0;
  
  int[] vetor = new int[6];
  int[] OBJ_strokeColor = new int[3];
  //=================================================================


  // Construtor da class
  //=================================================================
  OBJ_Triangle(int[] _bgColor, int[] _strokeColor)
  {
    this.size = 100; 
    this.type="Triângulo";
    this.isvisible = true;

    r = _bgColor[0];
    g = _bgColor[1];
    b = _bgColor[2];
    
    this.OBJ_strokeColor = _strokeColor;
    
    stroke(this.OBJ_strokeColor[0], this.OBJ_strokeColor[1], this.OBJ_strokeColor[2]);
    fill(r, g, b);
  }
  //=================================================================


  // Desenha o que tem na memória
  //=================================================================
  void myRedraw()
  {
    if (this.isvisible == true)
    {
      stroke(this.OBJ_strokeColor[0], this.OBJ_strokeColor[1], this.OBJ_strokeColor[2]);
      fill(r, g, b);
      triangle(this.vetor[0], this.vetor[1], this.vetor[2], this.vetor[3], this.vetor[4], this.vetor[5]);
    }
  }
  //=================================================================


  // Inicia o processo de desenhar
  //=================================================================
  boolean desenha()
  {
    if (this.quadFeito == false )
    {
      if(this.ponto1 == false) 
    {
        if (mousePressed && (mouseButton == LEFT))
        {
          this.xi = mouseX;
          this.yi = mouseY;         
          
      if(mouseX>78) 
          {      
        this.ponto1=true;  
          }      
        }
      }
          
      if(this.ponto1 == true && this.quadFeito == false)
      {
        this.validatePosition();
        triangle(this.xi-mouseX, mouseY, this.xi, this.yi, this.xi+mouseX, mouseY);
      }
        
      if(this.ponto1 == true)
      {
        if (mousePressed == false)
        {
          this.vetor[0]=this.xi-mouseX;
          this.vetor[1]=mouseY;
          this.vetor[2]=this.xi;
          this.vetor[3]=this.yi;
          this.vetor[4]=this.xi+mouseX;
          this.vetor[5]=mouseY;

          return true;
        }
      }
    }
  
    return false;
  }
}    
