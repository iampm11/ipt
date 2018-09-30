package Worker;

import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueReceiver;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.InitialContext;

public class Client {
    
    public static void main(String[] args) throws Exception {
        InitialContext ctx = new InitialContext();
        QueueConnectionFactory factory = (QueueConnectionFactory) ctx.lookup("ChatConnectionFactory");
        QueueConnection connection = factory.createQueueConnection();
        connection.start();
        Queue q = (Queue) ctx.lookup("ChatDestination");
        QueueSession session = connection.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);
        QueueSender sender = session.createSender(q);
        
        Scanner s = new Scanner(System.in);
        while (true) {
            System.out.print(">> ");
           String in = s.nextLine();
           TextMessage msg = session.createTextMessage();
           msg.setText(in);
           sender.send(msg);
        }
    }
    
}
