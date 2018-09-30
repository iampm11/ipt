#Load Java Libs
import sys
sys.path.append("C:\\Jython2.7.0\\mysql-connector-java-8.0.12\\mysql-connector-java-8.0.12.jar")

from javax.swing import JFrame, JButton, JTextField, JLabel
from com.ziclix.python.sql import zxJDBC
from com.mysql.jdbc.Driver import Driver

url = "jdbc:mysql://localhost/test"
user = "root"
password = "password"
mysqlConn = zxJDBC.connect(url, user, password, "com.mysql.jdbc.Driver")

class Login(object):
    def __init__(self):
        self.frame = JFrame("Welcome", defaultCloseOperation = JFrame.EXIT_ON_CLOSE, layout=None, size=(430, 300))

        self.title = JLabel('ACCOUNTS', bounds=(0, 20, 430, 30), horizontalAlignment=0)
        self.frame.add(self.title)

        self.usernameLabel = JLabel('Username', bounds=(30, 60, 200, 30))
        self.frame.add(self.usernameLabel)

        self.inputUsername = JTextField('', bounds=(110, 60, 250, 30))
        self.frame.add(self.inputUsername)

        self.passwordLabel = JLabel('Password', bounds=(30, 100, 200, 30))
        self.frame.add(self.passwordLabel)

        self.inputPassowrd = JTextField('', bounds=(110, 100, 250, 30))
        self.frame.add(self.inputPassowrd)

        self.buttonLogin = JButton('LOGIN', bounds=(50, 180, 100, 30), actionPerformed= self.onLogin)
        self.frame.add(self.buttonLogin)

        self.registerButton = JButton('REGISTER', bounds=(240, 180, 100, 30), actionPerformed= self.onRegister)
        self.frame.add(self.registerButton)

        self.frame.visible = True

    def onLogin(self, event):
        username = self.inputUsername.text
        password = self.inputUsername.text


    def onRegister(self, event):
        return


Login()
