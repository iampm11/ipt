
import com.sun.java.swing.plaf.motif.MotifButtonListener;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionListener;
import javax.swing.JPanel;

public class MouseMoveBean extends JPanel {
    private final int HEIGHT = 600;
    private final int WIDTH = 600;
    
    private int circleSize = 20;
    private int Xm = 0, Ym = 0;

    public MouseMoveBean() {
        super.setBackground(Color.WHITE);
        super.addMouseMotionListener(new MouseMotionListener() {
            @Override
            public void mouseDragged(MouseEvent e) {
            }

            @Override
            public void mouseMoved(MouseEvent e) {
                Xm = e.getX();
                Ym = e.getY();
                
                repaint();
            }
        });
    }
    
    
    private Color randomColor() {
        return new Color((int) (Math.random() * 255), (int) (Math.random() * 255), (int) (Math.random() * 255));
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponents(g);
        g.setColor(Color.white);
        g.fillRect(0,0,HEIGHT,WIDTH);
        g.setColor(this.randomColor());
        g.drawOval(Xm-15, Ym-15, 30, 30);
    }

    @Override
    public Dimension getSize() {
        return new Dimension(HEIGHT,WIDTH);
    }
    
    
}
