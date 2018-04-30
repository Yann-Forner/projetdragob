/*
  ProjetDrago
    By Yann FORNER v1
*/

int menu=0;
boolean isEauChaudePleine=false;
boolean isEauChaude=false;
boolean isGlaconPlein=false;
boolean isGlacon=false;
int yRect=-1;
int yRect2=-1;
int xBarree=0;
int xBarree2=0;
int timerGlacon=0;
int xPosMenuIndic=-200;
int chronoFrame=0;
int chronoTime=0;
float angle; 



PImage fond1;
PImage buttonStart;

PImage helice;
PImage schema;
PImage fond2;
PImage glacon1;
PImage glacon2;
PImage glacon3;
PImage glacon4;
PImage flecheR;
PImage flecheR2;
PImage flecheB;
PImage flecheB2;
PImage fond3;

PImage tableau;

PImage graphe;


void setup(){
  size(750,600);
  frameRate(60);
  
  fond1=loadImage("fond1.png");
  buttonStart=loadImage("buttonStart.png");
  
  helice=loadImage("helice.png");
  fond2=loadImage("fond2.png");
  schema=loadImage("schema.png");
  glacon1=loadImage("glacon1.png");
  glacon2=loadImage("glacon2.png");
  glacon3=loadImage("glacon3.png");
  glacon4=loadImage("glacon4.png");
  flecheR=loadImage("flecheR.png");
  flecheR2=loadImage("flecheR2.png");
  flecheB=loadImage("flecheB.png");
  flecheB2=loadImage("flecheB2.png");
  fond3=loadImage("fond3.png");
  
  graphe=loadImage("graphe.png");
  tableau=loadImage("tableau.png");
}//finSetup

void draw(){
  imageMode(CORNER);
  if (menu==0){
    image(fond1,0,0);
    image(buttonStart,275,250);
  }//menu
  if (menu==1){
    image(fond2,0,0);
    if(isEauChaude==true){
     RemplissageEau();
    }
    if(isGlacon==true){
     RemplissageGlacon(); 
     RemplissageEauGlacons();
    }
    image(schema,200,80);
    indicationPos();
     
     
    
    fill(0);
    textSize(15);
    text(chronoTime+" min",50,452);
    if(isGlaconPlein==true && isEauChaudePleine==true){
      Helice();
    }else{
      image(helice,415,110);
    }
  }//animation
  if (menu==2){
    image(fond3,0,0);
    image(graphe,0,0);
    indicationPos();
  }//Graphique
  if (menu==3){
    image(fond3,0,0);
    image(tableau,0,0);
    indicationPos();
  }//Tableau
  
  chrono();

}//finDraw

void Helice(){
  imageMode(CENTER);
  translate (453,140);
  rotate(angle);
  image(helice,0,0);
  angle+=.1;
  imageMode(CORNER);
}

void RemplissageEau(){
  fill(43,152,245,125);
   rect(516,515,161,yRect);
   
   noStroke();
   if(yRect>=-180){
        yRect=yRect-5;
   }else{
     isEauChaudePleine=true;
   }
   if(isEauChaudePleine==true){
     barreeEnRouge(229);
     image(flecheR,550,325);
     image(flecheR2,500,225);
   }
    
}//finRemplissageEau
void RemplissageEauGlacons(){
  fill(43,152,245,125);
   rect(233,515,149,yRect2);
   
   noStroke();
   if(chronoTime>=13 && yRect2>=-45){
        yRect2=yRect2-1;
   }
   if(chronoTime>=25 && yRect2>=-90){
        yRect2=yRect2-1;
   }
   if(chronoTime>=37 && yRect2>=-135){
        yRect2=yRect2-1;
   }
   if(chronoTime>=49 && yRect2>=-180){
        yRect2=yRect2-1;
   }
   
    
}//finRemplissageEau
void RemplissageGlacon(){
   ++timerGlacon;
   if(chronoTime<=48)image(glacon1,304,452);
   if(timerGlacon>=25 && chronoTime<=36)image(glacon2,243,405);
   if(timerGlacon>=50 && chronoTime<=24)image(glacon3,245,380);
   if(timerGlacon>=65 && chronoTime<=12){
     image(glacon4,234,324);
     isGlaconPlein=true;
   }
   if(isGlaconPlein==true){
     barreeEnRouge2(297);
     image(flecheB,344,325);
     image(flecheB2,358,229);
      }
    
}//finRemplissageGlacon

void barreeEnRouge(int y){
   fill(255,0,0);
   noStroke();
     rect(24,y,xBarree,3);
     if(xBarree<=80)  
     {
       xBarree=xBarree+5;
     }
}//finBarreeEnRouge

void barreeEnRouge2(int y){
   fill(255,0,0);
   noStroke();
     rect(24,y,xBarree2,3);
     if(xBarree2<=80)  
     {
       xBarree2=xBarree2+5;
     }
}//finBarreeEnRouge2
void indicationPos(){
  fill(0);
  rect(xPosMenuIndic,30,80,3);
  if(menu==1)xPosMenuIndic=233;
  if(menu==2)xPosMenuIndic=333;
  if(menu==3)xPosMenuIndic=433;
  if(menu==0) xPosMenuIndic=-200;
}
void chrono(){
  if(isGlaconPlein==true && isEauChaudePleine==true){
    chronoFrame=chronoFrame+1;
      if(chronoFrame%60==0){
        chronoTime=chronoTime+1;
      }
  }
}//finChrono
  
void mousePressed(){
  if (menu==0){
    if(mouseX<=475 && mouseX>=275 && mouseY>=250 && mouseY<=350){
      menu=1;
    }//buttonStart
  }//menu
  if (menu==1){
    if(mouseX<=108 && mouseX>=25 && mouseY>=213 && mouseY<=252){
      isEauChaude=true;
    }//buttonEauChaude
    if(mouseX<=108 && mouseX>=25 && mouseY>=277 && mouseY<=315){
      isGlacon=true;
    }//buttonGlacons
  }//Schema
  if(menu==1 || menu==2 || menu==3){
    if(mouseX>=225 && mouseX<=325 && mouseY>=1 && mouseY <=40 && menu!=1){
      menu=1;
    }//buttonToAnimation
    if(mouseX>=326 && mouseX <= 426 && mouseY >= 1 && mouseY <= 40 && menu!=2){
      menu=2;
    }//buttonToGraphique
    if(mouseX>=427 && mouseX <=527 && mouseY >=1 && mouseY <= 40 && menu!=3){
      menu=3;
    }//buttonToTableau
    
  }//schema,graphique,tableau
}//finMousePressed
