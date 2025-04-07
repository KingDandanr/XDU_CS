class MyThread extends Thread{  
    private int ticket; 

	MyThread(int t) {
		ticket = t;
	}
	
    public void run(){
        for(int i=0;i<ticket;i++){ 
            if(ticket>0){
                System.out.println(this.getName()+" sold ticket"+ ticket--);
            }
        }
    } 
};
 
public class ThreadTest {  
    public static void main(String[] args) {  
        MyThread t1=new MyThread(10);
        MyThread t2=new MyThread(15);
        MyThread t3=new MyThread(30);
        t1.start();
        t2.start();
        t3.start();
    }  
}