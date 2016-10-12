  import controlP5.*;
  import processing.pdf.*;

  PShape bot;
  Window win;
  Document doc;
  ControlP5 cp5;


  void setup() 
  {
    cp5 = new ControlP5(this);
    win = new Window(cp5);
    doc = new Document(win);
    
    bot = loadShape("android.svg");
  }


  void draw()
  {
    win.cleanWindow();
    win.displayStaticMenus();
    
    redraw();
    doc.drawLayer();
    doc.checkActions();
    
    shape(bot, width/2-200, height/2-200, 200, 200);  // Draw at coordinate (110, 90) at size 100 x 100
  }


  void redraw()
  {
    doc.documentRedraw();
  }


  void mouseClicked()
  {
    //println("X " + mouseX);
    // Menu lado esquerdo
    //======================
    if ((mouseX >= 0 && mouseX <= 77) || (mouseY >= 66 && mouseY <= height))
    {
      doc.setMouseClicked(mouseX, mouseY);
    }
    // Menu topo
    //======================
    else if ((mouseX >= 90 && mouseX <= width) || (mouseY >= 31 && mouseY <= 61))
    {
      doc.setMouseClicked(mouseX, mouseY);
    } 
  
    // Menu dos layers
    //======================
    int cnt=4;
    int heightSize = 22;
    int position = 90 - heightSize;

    for (int i=0; i<=doc._OBJ_SIZE_; i++)
    {
      int myPoint = ((position-heightSize-heightSize)*cnt)-cnt*2;
      
      if (doc._OBJ_[i] != null) 
      {
        if (((mouseX >= width-237) && (mouseX <= width-214)) && ((mouseY >= myPoint) && (mouseY <= myPoint+21))) 
        {
          doc._OBJ_[i].setVisible_();
        }
      }
      cnt++;
    }  
  }
  
  

  
  void controlEvent(ControlEvent theEvent) 
  {
    // DropdownList is of type ControlGroup. A controlEvent will be triggered from inside the ControlGroup class. therefore you need to check the originator of the Event with if (theEvent.isGroup()) to avoid an error message thrown by controlP5.
    if (theEvent.isGroup()) {
      //println("!!!!!!!!!!!!!!!event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());

      if (theEvent.getGroup().isMouseOver() == true)
      {
        if (theEvent.getGroup().getName() == "myList-DLStrokeWeight")
        {
          win.setStrokeWeight((int)theEvent.getGroup().getValue());
        }
        else if (theEvent.getGroup().getName() == "myList-DLRounded")
        {
          win.setRoundedCorners((int)theEvent.getGroup().getValue());
        }
      }
    } 
    else if (theEvent.isController()) {
      //println("!event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
      
      if (theEvent.getController().isMouseOver() == true)
      {
        //apanha o value dos btns dos menus de cima
        println(theEvent.getController().getName());
        if (theEvent.getController().getName() == "Sair"){
          exit();
        }
        else if (theEvent.getController().getName() == "Novo"){
          doc.cleanOBJ();
        }
        else if (theEvent.getController().getName() == "Gravar PDF"){
          beginRecord(PDF, "ficheiro.pdf");
          doc.documentRedraw();
          //shape(bot, width/2-200, height/2-200, 200, 200);  // Draw at coordinate (110, 90) at size 100 x 100
          endRecord();
        }
        //println((int)theEvent.getController().getValue());
      }  
        
        
        
    }
  }

