package Worker;

import java.util.Scanner;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicConnectionFactory;
import javax.jms.TopicPublisher;
import javax.jms.TopicSession;
import javax.naming.InitialContext;

public class Client {
    
    public static void main(String[] args) throws Exception {
        InitialContext ctx = new InitialContext();
        TopicConnectionFactory factory = (TopicConnectionFactory) ctx.lookup("TopicConnectionFactory");
        TopicConnection connection = factory.createTopicConnection();
        connection.start();
        Topic t = (Topic) ctx.lookup("Topic");
        TopicSession session = connection.createTopicSession(false, 0);
        TopicPublisher publisher = session.createPublisher(t);
        
        
        Scanner s = new Scanner(System.in);
        while (true) {
            System.out.print(">> ");
           String in = s.nextLine();
           TextMessage msg = session.createTextMessage();
           msg.setText(in);
           publisher.send(msg);
        }
    }
    
}
