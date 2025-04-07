import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.util.Iterator;

public class ReactorEchoServer {
    private Selector selector;
    private ServerSocketChannel serverChannel;
    private static final int PORT = 12345;
    
    public ReactorEchoServer() throws IOException {
        selector = Selector.open();
        serverChannel = ServerSocketChannel.open();
        serverChannel.configureBlocking(false);
        serverChannel.bind(new InetSocketAddress(PORT));
        serverChannel.register(selector, SelectionKey.OP_ACCEPT);
        System.out.println("Reactor Echo Server is running on port " + PORT);
    }
    
    public void start() throws IOException {
        while (true) {
            selector.select();
            Iterator<SelectionKey> keys = selector.selectedKeys().iterator();
            
            while (keys.hasNext()) {
                SelectionKey key = keys.next();
                keys.remove();
                
                if (key.isAcceptable()) {
                    accept(key);
                } else if (key.isReadable()) {
                    read(key);
                }
            }
        }
    }
    
    private void accept(SelectionKey key) throws IOException {
        ServerSocketChannel serverChannel = (ServerSocketChannel) key.channel();
        SocketChannel clientChannel = serverChannel.accept();
        clientChannel.configureBlocking(false);
        clientChannel.register(selector, SelectionKey.OP_READ);
        System.out.println("Client connected: " + clientChannel.getRemoteAddress());
    }
    
    private void read(SelectionKey key) throws IOException {
        SocketChannel clientChannel = (SocketChannel) key.channel();
        ByteBuffer buffer = ByteBuffer.allocate(1024);
        int bytesRead = clientChannel.read(buffer);
        
        if (bytesRead == -1) {
            clientChannel.close();
            System.out.println("Client disconnected");
            return;
        }
        
        buffer.flip();
        String received = new String(buffer.array(), 0, buffer.limit());
        System.out.println("Received: " + received);
        
        clientChannel.write(ByteBuffer.wrap(received.getBytes()));
    }
    
    public static void main(String[] args) {
        try {
            new ReactorEchoServer().start();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
