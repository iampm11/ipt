/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.jms.Topic;
import javax.jms.TopicConnection;
import javax.jms.TopicConnectionFactory;
import javax.jms.TopicPublisher;
import javax.jms.TopicRequestor;
import javax.jms.TopicSession;
import javax.jms.TopicSubscriber;
import javax.naming.InitialContext;

/**
 *
 * @author reezp
 */
public class Receiver {
    public static void main(String[] args) throws Exception {
        InitialContext ctx = new InitialContext();
        TopicConnectionFactory factory = (TopicConnectionFactory) ctx.lookup("TopicConnectionFactory");
        TopicConnection connection = factory.createTopicConnection();
        connection.start();
        Topic t = (Topic) ctx.lookup("Topic");
        TopicSession session = connection.createTopicSession(false, 0);
        TopicSubscriber subscriber = session.createSubscriber(t);
        
        subscriber.setMessageListener(new MessageListener() {
            @Override
            public void onMessage(Message message) {
                try {
                    TextMessage msg = (TextMessage) message;
                    System.err.println("MSG : >> " + msg.getText());
                } catch (JMSException ex) {
                    Logger.getLogger(Client.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
        
        System.out.println("Listening For Messages...");
        
        while (true) {
            Thread.sleep(300);
        }
    }
}
