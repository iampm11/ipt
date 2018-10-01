#Load Java Libs
#import sys
#sys.path.append("C:\\Jython2.7.0\\mysql-connector-java-8.0.12\\mysql-connector-java-8.0.12.jar")

from javax.swing import JFrame, JButton, JTextField, JLabel, JPasswordField, JOptionPane
from com.ziclix.python.sql import zxJDBC
import User

class Init(object):
    def __init__(self):
        self.connect()
        
        self.frame = JFrame("Welcome", defaultCloseOperation = JFrame.EXIT_ON_CLOSE, layout=None, size=(430, 300))

        self.title = JLabel('ACCOUNTS', bounds=(0, 20, 430, 30), horizontalAlignment=0)
        self.frame.add(self.title)

        self.usernameLabel = JLabel('Username', bounds=(30, 60, 200, 30))
        self.frame.add(self.usernameLabel)

        self.inputUsername = JTextField('', bounds=(110, 60, 250, 30))
        self.frame.add(self.inputUsername)

        self.passwordLabel = JLabel('Password', bounds=(30, 100, 200, 30))
        self.frame.add(self.passwordLabel)

        self.inputPassowrd = JPasswordField('', bounds=(110, 100, 250, 30))
        self.frame.add(self.inputPassowrd)

        self.buttonLogin = JButton('LOGIN', bounds=(50, 180, 100, 30), actionPerformed= self.onLogin)
        self.frame.add(self.buttonLogin)

        self.registerButton = JButton('REGISTER', bounds=(240, 180, 100, 30), actionPerformed= self.openRegister)
        self.frame.add(self.registerButton)

        self.frame.visible = True

    def onLogin(self, event):
        username = self.inputUsername.text
        password = self.inputPassowrd.text
        
        if(username == "" or password == ""):
            JOptionPane.showMessageDialog(self.frame,"Provide Input For All Fields","Alert",JOptionPane.WARNING_MESSAGE) 
        else:            
            SELECT_SMT = "SELECT * from `accounts` WHERE `username` = ? AND `password` = ?"
            self.connection.executemany(SELECT_SMT, [username, password])
            if self.connection.fetchone() is None:
                JOptionPane.showMessageDialog(self.frame,"Wrong Credentials","Alert",JOptionPane.ERROR_MESSAGE)
            else:
                user = User(username, password)
                user.print()
                JOptionPane.showMessageDialog(self.frame,"Login Sucessfull","Success",JOptionPane.PLAIN_MESSAGE) 


    def onRegister(self, event):
        username = self.inputUsername2.text
        password = self.inputPassowrd2.text
        
        if(username == "" or password == ""):
            JOptionPane.showMessageDialog(self.frame2,"Provide Input For All Fields","Alert",JOptionPane.WARNING_MESSAGE) 
        elif(password != self.reinputPassowrd2.text):
            JOptionPane.showMessageDialog(self.frame2,"Passwords Doesn't Match","Alert",JOptionPane.ERROR_MESSAGE) 
        else:
            self.connection.execute("SELECT * FROM `accounts` WHERE `username` LIKE '"+ username +"';")
            if self.connection.fetchone() is not None:
                JOptionPane.showMessageDialog(self.frame2,"Provided Username Already Exist","Alert",JOptionPane.ERROR_MESSAGE)
            else:
                INSERT_SMT = "INSERT INTO `accounts`(`username`, `password`) VALUES (?,?)"
                self.connection.executemany(INSERT_SMT, [username, password])
                self.conn.commit()
                JOptionPane.showMessageDialog(self.frame2,"Registration Successfull. You can Login Now","Alert",JOptionPane.INFORMATION_MESSAGE)
        
        
    def openRegister(self, event):
        self.frame2 = JFrame('Register', layout=None, size=(430, 300))
        
        self.usernameLabel2 = JLabel('Username', bounds=(30, 60, 200, 30))
        self.frame2.add(self.usernameLabel2)

        self.inputUsername2 = JTextField('', bounds=(110, 60, 250, 30))
        self.frame2.add(self.inputUsername2)

        self.passwordLabel2 = JLabel('Password', bounds=(30, 100, 200, 30))
        self.frame2.add(self.passwordLabel2)

        self.inputPassowrd2 = JPasswordField('', bounds=(110, 100, 250, 30))
        self.frame2.add(self.inputPassowrd2)
        
        self.repasswordLabel2 = JLabel('Re-Password', bounds=(30, 140, 200, 30))
        self.frame2.add(self.repasswordLabel2)

        self.reinputPassowrd2 = JPasswordField('', bounds=(110, 140, 250, 30))
        self.frame2.add(self.reinputPassowrd2)

        self.registerButton2 = JButton('REGISTER', bounds=(240, 200, 100, 30), actionPerformed= self.onRegister)
        self.frame2.add(self.registerButton2)
        
        
        self.frame2.visible = True
    
    def connect(self):
        self.conn = zxJDBC.connect("jdbc:mysql://localhost/accounts", "root", "", "com.mysql.jdbc.Driver")
        self.connection = self.conn.cursor()

Init()
