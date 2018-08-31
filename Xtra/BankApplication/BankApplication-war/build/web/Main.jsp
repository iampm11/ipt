<%@page import="Banking.Bank_1"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityManager"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Banking Application</title>
        <link rel="shortcut icon" type="image/png" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAMAAAAoLQ9TAAAAA3NCSVQICAjb4U/gAAAACXBIWXMAAAPRAAAD0QGYiom0AAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAALdQTFRF/////////6qq1dWq///f///j/+rV4dK01ca41dW418m85Mmu1sy4//Pb7eHL9eXS9ejS9ezS//Pc//Hd//Hb28y54tTA++/Y//Hc//Lc28y43M243M252s632823/PDa/fDa28y47t/J28244tS95NW98OPN28258uTO2cqx+OvV18ex3M2028255dfC28242824//Lbwq+W2824/vHb//Lc2824//Lb2824//Lcwa2UvaqR//LcCn8SywAAADt0Uk5TAAIDBggJDBESEhMTGUBFT09PWFtdeH19g4WIkJigpKamsLC3ubq+wMDExMXGx9Tb4ePl5efo6uru8/WzNygFAAAAlklEQVQYV53I6xJCUBSG4YWiAzo5lFOhqC2baAvb/V9XUszUz55Zs2beD+BltN7uNmMYSKRpEalvvmru18utqfjPoAWnmtL6GGjvFqKMdrJIaFMh5DEgRAEZ4yXGi+6vMJaBix02dBnfZ9yQdWIOwFbBMsA0wbBAteGfQSyTWZFO8nyaFvOkFEFHaI/QoT8dvPMXD6wfT40UGvaOZENGAAAAAElFTkSuQmCC"/>
        <link href='https://fonts.googleapis.com/css?family=Product+Sans' rel='stylesheet' type='text/css'>
        <style>
            .card-1 {
                box-shadow: 0 10px 20px rgba(0,0,0,0.19), 0 6px 6px rgba(0,0,0,0.23);
                transition: all 0.3s cubic-bezier(.25,.8,.25,1);
            }

            * {
                font-family: 'Product Sans', 'Courier New', Courier, monospace;
            }

            body {
                background-image: url('https://i0.wp.com/ficedu.org/wp-content/uploads/2016/07/Savin-NY-Website-Background-Web.jpg');
                background-size: cover;
                min-height: 90vh;
                display: flex;
                font-size: 20px;
                flex-direction: column;
                justify-content: center;
                align-items: center;
            }

            .container {
                position: relative;
                background-color: white;
                padding: 15px;
                min-width: 480px;
                min-height: 400px;
            }

            input[type=number] {
                width: calc(100% - 15px);
                font-size: 18px;
                display: block;
                padding: 5px;
                border: 1px solid #bdbdbd;
                margin-bottom: 20px;
            }

            button {
                display: block;
                width: 100%;
                padding: 15px;
                position: absolute;
                bottom: 0;
                background-color: #4527a0 ;
                color: white;
                right: 0;
                text-transform: uppercase;
                font-size: 18px;
                letter-spacing: 5px;
                left: 0;
                cursor: pointer;
                border: none;
            }

            button:hover {
                background-color: #311b92 ;
            }

            button:active {
                background-color: #512da8;
            }

            div.image {
                text-align: center;
            }

            img {
                width: 70px;
                height: auto;
            }

            p.balance span {
                display: block;
                text-align: center;
            }

            span.text {
                font-size: 12px;
                margin-bottom: 5px;
                text-transform: uppercase;
            }

            [type="radio"] {
                position: absolute;
                visibility: hidden;
                width: 0;
            }

            [type="radio"] + label {
                position: relative;
                padding-left: 28px;
                cursor: pointer;
                line-height: 20px;
                display: inline-block;
                color: #666;
            }

            [type="radio"] + label:before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                width: 18px;
                height: 18px;
                border: 1px solid #ddd;
                border-radius: 100%;
                background: #fff;
            }

            [type="radio"] + label:after{
                content: '';
                width: 12px;
                height: 12px;
                background: #4527a0;
                position: absolute;
                top: 4px;
                left: 4px;
                border-radius: 100%;
            }

            [type="radio"]:not(:checked) + label:after {
                opacity: 0;
            }

            [type="radio"]:checked + label:after {
                opacity: 1;
            }
            
            label {
                display: block;
                width: 100%;
                margin: 20px 0;
                text-transform: uppercase;
                font-size: 14px;
                letter-spacing: 3px;
            }
        
        
        </style>
    </head>
    <body>
        <%
            EntityManagerFactory factory = Persistence.createEntityManagerFactory("BankApplication-warPU");
            EntityManager manager = factory.createEntityManager();
            
            EntityTransaction transaction = manager.getTransaction();
            transaction.begin();
            
            Bank_1 bank = manager.find(Bank_1.class, "Reez");
            int bankBalance = bank.getBalance();
            
            if (request.getParameter("action") != null) {
                String action = request.getParameter("action");
                int balance = Integer.parseInt(request.getParameter("amount"));
                
                if(action.equals("deposit")) {
                    bank.setBalance(bankBalance + balance);
                } else {
                    if(bankBalance < balance) balance = bankBalance;
                    bank.setBalance(bankBalance - balance);
                }
            }
            manager.persist(bank);
            bankBalance = bank.getBalance();
            transaction.commit();
            manager.close();
            factory.close();
        %>
        <div class="container card-1">
            <div class="image">
                <img src="data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iaXNvLTg4NTktMSI/Pgo8IS0tIEdlbmVyYXRvcjogQWRvYmUgSWxsdXN0cmF0b3IgMTkuMC4wLCBTVkcgRXhwb3J0IFBsdWctSW4gLiBTVkcgVmVyc2lvbjogNi4wMCBCdWlsZCAwKSAgLS0+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayIgdmVyc2lvbj0iMS4xIiBpZD0iQ2FwYV8xIiB4PSIwcHgiIHk9IjBweCIgdmlld0JveD0iMCAwIDUxMS45OTkgNTExLjk5OSIgc3R5bGU9ImVuYWJsZS1iYWNrZ3JvdW5kOm5ldyAwIDAgNTExLjk5OSA1MTEuOTk5OyIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSIgd2lkdGg9IjI1NnB4IiBoZWlnaHQ9IjI1NnB4Ij4KPGc+Cgk8Zz4KCQk8cGF0aCBkPSJNNTA1LjcwOSwxNTkuNTc1TDMzNi40NjIsNTAuNjgyYy0zLjM3OS0yLjE3NC03Ljg3OS0xLjE5Ni0xMC4wNTIsMi4xODFjLTIuMTczLDMuMzc4LTEuMTk3LDcuODc4LDIuMTgxLDEwLjA1MiAgICBsMTY2Ljc3MywxMDcuMzAxaC0zOC44NzhMMjY2LjY0LDQ4LjA3Yy02LjQ2My00LjE1OC0xNC44MTYtNC4xNTctMjEuMjgsMEw1NS41MTQsMTcwLjIxNkgxNi42MzZMMjU1Ljk5MSwxNi4yMDRsMzMuODk5LDIxLjgxICAgIGMzLjM3OSwyLjE3Myw3Ljg3OCwxLjE5NywxMC4wNTItMi4xODFjMi4xNzMtMy4zNzgsMS4xOTctNy44NzgtMi4xODEtMTAuMDUybC0zMy44OTktMjEuODFjLTQuNzc2LTMuMDczLTEwLjk0Ny0zLjA3My0xNS43MjMsMCAgICBMNi4yOTEsMTU5LjU3NWMtNS4xNSwzLjMxNC03LjQ1LDkuNDg4LTUuNzIzLDE1LjM2NGMxLjcyNyw1Ljg3Niw3LjAwMiw5LjgyNCwxMy4xMjYsOS44MjRoMzYuNjg0djI1LjA3djIxLjk1NiAgICBjMCw1Ljc4OSw0LjEwNiwxMC42MzcsOS41NTgsMTEuNzg0djEyLjgwMWMwLDYuNjQsNS40MDIsMTIuMDQyLDEyLjA0MiwxMi4wNDJoMXY4OS4xMTJjMCw0LjAxNywzLjI1Niw3LjI3Myw3LjI3Myw3LjI3MyAgICBjNC4wMTcsMCw3LjI3My0zLjI1Niw3LjI3My03LjI3M3YtOTYuMzg1YzAtNC4wMTctMy4yNTYtNy4yNzMtNy4yNzMtNy4yNzNoLTUuNzY4di0xMC4wNGg1MS41MTN2MTAuMDM4aC01Ljc2OCAgICBjLTQuMDE3LDAtNy4yNzMsMy4yNTYtNy4yNzMsNy4yNzN2MTYwLjY5NmMwLDQuMDE3LDMuMjU2LDcuMjczLDcuMjczLDcuMjczaDUuNzY4djEwLjkxNUg3NC40ODNWNDI5LjExaDUuNzY4ICAgIGM0LjAxNywwLDcuMjczLTMuMjU2LDcuMjczLTcuMjczdi0xOC41OWMwLTQuMDE3LTMuMjU2LTcuMjczLTcuMjczLTcuMjczYy00LjAxNywwLTcuMjczLDMuMjU2LTcuMjczLDcuMjczdjExLjMxN2gtMSAgICBjLTYuNjQsMC0xMi4wNDIsNS40MDEtMTIuMDQyLDEyLjA0MXYxMi44MDFjLTUuNDUzLDEuMTQ3LTkuNTU4LDUuOTk1LTkuNTU4LDExLjc4NHYxNC42ODJIMjQuNjE0ICAgIGMtOC4wNCwwLTE0LjU4MSw2LjU0MS0xNC41ODEsMTQuNTgxdjE1LjI5OWMwLDguMDQsNi41NDEsMTQuNTgxLDE0LjU4MSwxNC41ODFoNDYyLjc3MmM4LjA0LDAsMTQuNTgxLTYuNTQxLDE0LjU4MS0xNC41ODEgICAgdi0xNS4yOTljMC04LjA0LTYuNTQxLTE0LjU4MS0xNC41ODEtMTQuNTgxaC0yNS43NjRWNDUxLjE5YzAtNS43ODktNC4xMDYtMTAuNjM3LTkuNTU4LTExLjc4NHYtMTIuODAxICAgIGMwLTYuNjQtNS40MDItMTIuMDQxLTEyLjA0Mi0xMi4wNDFoLTF2LTE0Ni4xNWgxYzYuNjQsMCwxMi4wNDItNS40MDIsMTIuMDQyLTEyLjA0MnYtMTIuODAxICAgIGM1LjQ1My0xLjE0Nyw5LjU1OC01Ljk5NSw5LjU1OC0xMS43ODR2LTIxLjk1NnYtMjUuMDdoMzYuNjg0YzYuMTI0LDAsMTEuMzk5LTMuOTQ4LDEzLjEyNi05LjgyNCAgICBDNTEzLjE1OSwxNjkuMDYzLDUxMC44NTksMTYyLjg4OCw1MDUuNzA5LDE1OS41NzV6IE0yNTMuMjMsNjAuMzAzYzEuNjgzLTEuMDgzLDMuODU3LTEuMDgyLDUuNTQsMGwxNzAuODMzLDEwOS45MTRIODIuMzk4ICAgIEwyNTMuMjMsNjAuMzAzeiBNNjQuOTI0LDE4NC43NjJoMzgyLjE1MXYxNy43OTdoLTc3LjkwMmgtNzAuNTg1aC04NS4xNzZoLTcwLjU4NUg2NC45MjRWMTg0Ljc2MnogTTI5Ni4zMDQsNDM5LjQwOHYtMTIuODAxICAgIGMwLTYuNjQtNS40MDItMTIuMDQxLTEyLjA0Mi0xMi4wNDFoLTF2LTE0Ni4xNWgxYzYuNjQsMCwxMi4wNDItNS40MDIsMTIuMDQyLTEyLjA0MnYtMTIuODAxICAgIGM1LjQ1My0xLjE0Nyw5LjU1OC01Ljk5NSw5LjU1OC0xMS43ODR2LTE0LjY4M0gzNjEuOXYxNC42ODNjMCw1Ljc4OSw0LjEwNiwxMC42MzcsOS41NTgsMTEuNzg0djEyLjgwMSAgICBjMCw2LjY0LDUuNDAyLDEyLjA0MiwxMi4wNDIsMTIuMDQyaDF2MTQ2LjE1aC0xYy02LjY0LDAtMTIuMDQyLDUuNDAxLTEyLjA0MiwxMi4wNDF2MTIuODAxICAgIGMtNS40NTIsMS4xNDctOS41NTgsNS45OTUtOS41NTgsMTEuNzg0djE0LjY4MmgtNTYuMDM4di0xNC42ODJDMzA1Ljg2Miw0NDUuNDAzLDMwMS43NTYsNDQwLjU1NSwyOTYuMzA0LDQzOS40MDh6ICAgICBNMTQwLjU0Miw0MzkuNDA4di0xMi44MDFjMC02LjY0LTUuNDAyLTEyLjA0MS0xMi4wNDItMTIuMDQxaC0xdi0xNDYuMTVoMWM2LjY0LDAsMTIuMDQyLTUuNDAyLDEyLjA0Mi0xMi4wNDJ2LTEyLjgwMSAgICBjNS40NTItMS4xNDcsOS41NTgtNS45OTUsOS41NTgtMTEuNzg0di0xNC42ODNoNTYuMDM5djE0LjY4M2MwLDUuNzg5LDQuMTA2LDEwLjYzNyw5LjU1OCwxMS43ODR2MTIuODAxICAgIGMwLDYuNjQsNS40MDIsMTIuMDQyLDEyLjA0MiwxMi4wNDJoMXYxNDYuMTVoLTFjLTYuNjQsMC0xMi4wNDIsNS40MDEtMTIuMDQyLDEyLjA0MXYxMi44MDEgICAgYy01LjQ1MiwxLjE0Ny05LjU1OCw1Ljk5NS05LjU1OCwxMS43ODR2MTQuNjgySDE1MC4xdi0xNC42ODJDMTUwLjEsNDQ1LjQwMywxNDUuOTk0LDQ0MC41NTUsMTQwLjU0Miw0MzkuNDA4eiBNMjc1Ljk4OSw0MjkuMTEgICAgaDUuNzY4djEwLjkxNWgtNTEuNTEzVjQyOS4xMWg1Ljc2OGM0LjAxNywwLDcuMjczLTMuMjU2LDcuMjczLTcuMjczVjI2MS4xNDJjMC00LjAxNy0zLjI1Ni03LjI3NC03LjI3My03LjI3NGgtNS43NjhWMjQzLjgzICAgIGg1MS41MTN2MTAuMDM4aC01Ljc2OGMtNC4wMTcsMC03LjI3MywzLjI1Ni03LjI3Myw3LjI3M3YxNjAuNjk2QzI2OC43MTYsNDI1Ljg1NCwyNzEuOTcyLDQyOS4xMSwyNzUuOTg5LDQyOS4xMXogTTIyMi45NywyMjkuMjg0ICAgIGgtMC4wMzJoLTIuMjUzdi0xMi4xNzhoNzAuNjN2MTIuMTc4aC0yLjI4NWMtMC4wMDUsMC0wLjAxMSwwLjAwMS0wLjAxNiwwLjAwMXMtMC4wMTEtMC4wMDEtMC4wMTYtMC4wMDFIMjIyLjk3eiBNMjIwLjY4NSw0NTQuMjEzICAgIGMwLjcxLDAuMjMxLDEuNDY2LDAuMzYsMi4yNTMsMC4zNmg2Ni4wNTljMC44MTEsMCwxLjU4OS0wLjEzOSwyLjMxOC0wLjM4NHYxMS42ODRoLTcwLjYzVjQ1NC4yMTN6IE02Ny4yMSwyMjkuMjg0aC0yLjI4NXYtMTIuMTc4ICAgIGg3MC42M3YxMi4xNzhoLTAuMDAxaC0yLjI4NUg2Ny4yMXogTTY0LjkyNCw0NTQuMjAxYzAuNzE5LDAuMjM4LDEuNDg2LDAuMzcyLDIuMjg1LDAuMzcyaDY2LjA2YzAuNzk5LDAsMS41NjYtMC4xMzQsMi4yODUtMC4zNzIgICAgdjExLjY3MmgtNzAuNjNWNDU0LjIwMXogTTQ4Ny40MjEsNDgwLjQ1NGwtMC4wMiwxNS4zMzNjMCwwLTAuMDA0LDAuMDAxLTAuMDE1LDAuMDAxbC00NjIuODA3LTAuMDM0bDAuMDM1LTE1LjMzNEw0ODcuNDIxLDQ4MC40NTQgICAgeiBNNDQ0Ljc3LDQ1NC41NzJjMC44MDcsMCwxLjU4LTAuMTM3LDIuMzA2LTAuMzc5djExLjY4aC03MC42M3YtMTEuNjY1YzAuNzEzLDAuMjM0LDEuNDczLDAuMzY0LDIuMjY1LDAuMzY0SDQ0NC43N3ogICAgIE0zOTEuNzcyLDI1My44NjloLTUuNzY4VjI0My44M2g1MS41MTN2MTAuMDM4aC01Ljc2OGMtNC4wMTcsMC03LjI3MywzLjI1Ni03LjI3Myw3LjI3M3YxNjAuNjk2YzAsNC4wMTcsMy4yNTYsNy4yNzQsNy4yNzMsNy4yNzQgICAgaDUuNzY4djEwLjkxNWgtNTEuNTEzdi0xMC45MTVoNS43NjhjNC4wMTcsMCw3LjI3My0zLjI1Niw3LjI3My03LjI3M1YyNjEuMTQyQzM5OS4wNDUsMjU3LjEyNSwzOTUuNzg5LDI1My44NjksMzkxLjc3MiwyNTMuODY5eiAgICAgTTQ0Ny4wNzcsMjI5LjI4NEw0NDcuMDc3LDIyOS4yODRoLTIuMjg2Yy0wLjAwMywwLTAuMDA3LDAuMDAxLTAuMDEsMC4wMDFzLTAuMDA3LTAuMDAxLTAuMDEtMC4wMDFoLTY2LjAzOWgtMC4wMmgtMi4yNjV2LTEyLjE3OCAgICBoNzAuNjNWMjI5LjI4NHoiIGZpbGw9IiMwMDAwMDAiLz4KCTwvZz4KPC9nPgo8Zz4KCTxnPgoJCTxwYXRoIGQ9Ik0yNTkuMDc2LDExMy4xNjVWOTAuNDU5YzcuODMsMC41NTksMTAuNzM4LDQuMTM4LDEzLjQyMiw0LjEzOGMzLjM1NiwwLDQuOTIyLTQuMjUsNC45MjItNi4zNzUgICAgYzAtNS40OC0xMC43MzgtNy44MjktMTguMzQ0LTguMDUzdi0zLjAyYzAtMS4zNDMtMS42NzctMi41NzMtMy4zNTUtMi41NzNjLTEuOTAyLDAtMy4yNDQsMS4yMzEtMy4yNDQsMi41NzN2My4yNDQgICAgYy0xMC42MjYsMS4xMTgtMjEuMjUyLDYuNzExLTIxLjI1MiwyMC44MDRjMCwxNC4zMTcsMTEuMTg2LDE4LjM0NCwyMS4yNTIsMjEuOTIzdjI2LjI4M2MtMTEuNDA5LTAuODk0LTE0LjQyOS04LjcyNC0xOC4xMi04LjcyNCAgICBjLTIuNzk2LDAtNS4xNDUsMy42OTEtNS4xNDUsNi4zNzZjMCw1LjQ4MSw5LjM5NSwxMi45NzUsMjMuMjY1LDEzLjE5OWgwdjMuNDY4YzAsMS4zNDMsMS4zNDIsMi41NzMsMy4yNDQsMi41NzMgICAgYzEuNjc3LDAsMy4zNTUtMS4yMzEsMy4zNTUtMi41NzN2LTMuODAzYzEyLjA4LTEuNjc3LDIwLjM1Ny05LjI4MywyMC4zNTctMjMuMDQxICAgIEMyNzkuNDMzLDEyMS42NjYsMjY4LjgwNywxMTYuNzQ0LDI1OS4wNzYsMTEzLjE2NXogTTI1My4xNDksMTExLjA0Yy01LjkyOS0yLjIzNy0xMC43MzgtNC41ODYtMTAuNzM4LTEwLjk2MiAgICBjMC01LjgxNiw0LjQ3NC04LjYxMiwxMC43MzgtOS4zOTVWMTExLjA0eiBNMjU4LjQwNiwxNDkuMTgxVjEyNS41OGM1LjQ4LDIuMzQ5LDkuODQyLDUuNDgxLDkuODQzLDEyLjUyOCAgICBDMjY4LjI0OSwxNDQuNDgzLDI2NC40NDYsMTQ4LjA2MywyNTguNDA2LDE0OS4xODF6IiBmaWxsPSIjMDAwMDAwIi8+Cgk8L2c+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPGc+CjwvZz4KPC9zdmc+Cg==" />
            </div>
            <p class="balance"> <span class="text">Current Balance</span>     <span class="bal"> &#8377; <%= bankBalance %></span></p>
            <form method="POST">
                <input type="number" name="amount" value="0" id="numberInput" />
                
                <input type="radio" name="action" value="deposit" checked id="dradio"> <label for="dradio">Deposit</label>
                <input type="radio" name="action" value="withdraw" id="wradio"> <label for="wradio">Withdraw</label>
    
                <button type="submit" name="Submit">Submit</button>
            </form>
        </div>
    </body>
</html>