package dc.sockettest;

import java.io.*;
import java.net.*;

public class MultiThreadEchoServer {
	 public static void main(String[] args) throws Exception {
		ServerSocket listenSocket=new ServerSocket(8189);
        Socket socket=null;
            
        int count=0;
        System.out.println("Server listening at 8189");
            
        while(true){
            socket=listenSocket.accept();
			count++;
			System.out.println("The total number of clients is " + count + ".");
            ServerThread serverThread=new ServerThread(socket);
            serverThread.start();
        }
    }
}