package Insurance;

public class Load {
      @SuppressWarnings({"SleepWhileInLoop", "static-access"})
      public static void main(String args[]) {
          Loading L=new Loading();
          L.setVisible(true);
          try{
               for(int i=0;i<=100;i++) {
                  Thread.sleep(20);
                  L.load.setText(Integer.toString(i)+"%");
                  if(i==100){
                      L.setVisible(false);
                      Login.main(new String[0]);  
                    }
                }
            }
          catch(InterruptedException e){  
        }     
    
}     
    
}

