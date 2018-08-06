import javax.swing.*;

public class GUI {
    public static final int WIDTH = 550;
    public static final int HEIGHT = 400;

    public static JFrame frame;
    public static void main(String[] args) {
        frame = new JFrame();
        frame.setSize(WIDTH, HEIGHT);
        frame.setLayout(null);


        frame.setVisible(true);
    }
}