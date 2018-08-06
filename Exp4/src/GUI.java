import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.*;

public class GUI {
    public static final int WIDTH = 550;
    public static final int HEIGHT = 400;

    public static JFrame frame;
    public static JLabel title, date, labels[], currentBalanceLabel;
    public static JButton btnOK, btnMessage;
    public static JTextField fields[];

    public static AccountDetails accounts;

    public static void main(String[] args) {
        frame = new JFrame();
        frame.setSize(WIDTH, HEIGHT);
        frame.setLayout(null);

        title = new JLabel("ACCOUNT DETAILS", SwingConstants.CENTER);
        title.setBounds(0, 10, WIDTH, 20);

        date = new JLabel("Date: ", SwingConstants.RIGHT);
        date.setBounds(0, 40, WIDTH - 40, 20);

        String labelNames[] = new String[]{"Account No.", "Name", "Balance", "Withdraw Amount"};
        labels = new JLabel[labelNames.length];
        fields = new JTextField[labelNames.length];

        int yAxis = 90;

        for(int i=0;i < labels.length; i++, yAxis += 30) {
            labels[i] = new JLabel(labelNames[i], SwingConstants.RIGHT);
            labels[i].setBounds(0, yAxis, WIDTH/3 - 20, 20);
            frame.add(labels[i]);

            fields[i] = new JTextField();
            fields[i].setBounds(WIDTH/2, yAxis, WIDTH/3, 20);
            frame.add(fields[i]);
        }
        fields[2].setEditable(false);
        yAxis += 20;
        currentBalanceLabel = new JLabel("Current Balance", SwingConstants.RIGHT);
        currentBalanceLabel.setBounds(0, yAxis, 2*WIDTH/3, 20 );
        frame.add(currentBalanceLabel);

        btnOK = new JButton("OK");
        btnOK.setBounds(70, yAxis+40, 100, 30);
        btnOK.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if(e.getClickCount() == 2) {
                    onOKBtnClicked();
                }
            }
        });
        frame.add(btnOK);

        btnMessage = new JButton("Message");
        btnMessage.setBounds(WIDTH - (80 + 100), yAxis+40, 100, 30);
        btnMessage.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                if(e.getClickCount() == 2) {
                    onMessageBtnClicked();
                }
            }
        });
        frame.add(btnMessage);

        frame.add(title);
        frame.add(date);

        frame.setVisible(true);
    }

    public static void onOKBtnClicked() {
        accounts = new AccountDetails();

        accounts.setAccountNo(Long.parseLong(fields[0].getText()));
        accounts.setName(fields[1].getText());
        accounts.setWithdrawAmount(Double.parseDouble(fields[3].getText()));

        fields[2].setText("" + accounts.getBalanceAmt());
        currentBalanceLabel.setText("Current Balance :" + accounts.currentBalance());
        accounts.generateSystemDate();
        date.setText(accounts.getDate());
    }

    public static void onMessageBtnClicked() {
        String msg = "Balance in your Account No: " + accounts.getAccountNo() + " as on " + accounts.getDate() + " is " + accounts.currentBalance();
        JOptionPane.showMessageDialog(frame, msg, "SMS", JOptionPane.INFORMATION_MESSAGE);
    }
}