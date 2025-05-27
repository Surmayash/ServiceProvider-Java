<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chat with <%= request.getParameter("workerName") %> </title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .chat-container {
            width: 400px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }
        .chat-header {
            background: #007bff;
            color: white;
            padding: 15px;
            text-align: center;
            font-size: 18px;
        }
        .chat-box {
            height: 300px;
            overflow-y: auto;
            padding: 15px;
            background: #f9f9f9;
        }
        .message {
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            max-width: 70%;
        }
        .sent {
            background: #007bff;
            color: white;
            align-self: flex-end;
        }
        .received {
            background: #e0e0e0;
            color: black;
            align-self: flex-start;
        }
        .chat-input {
            display: flex;
            padding: 10px;
            background: white;
            border-top: 1px solid #ccc;
        }
        .chat-input input {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
        }
        .chat-input button {
            margin-left: 10px;
            padding: 10px;
            background: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="chat-container">
        <div class="chat-header"><%= request.getParameter("workerName") %></div>
        <div class="chat-box" id="chatBox"></div>
        <div class="chat-input">
            <input type="text" id="messageInput" placeholder="Type a message...">
            <button onclick="sendMessage()">Send</button>
        </div>
    </div>

    <script>
        function loadMessages() {
            $.ajax({
                url: 'GetMessagesServlet',
                method: 'GET',
                success: function (data) {
                    $('#chatBox').html(data);
                }
            });
        }

        function sendMessage() {
            var sender = "<%=session.getAttribute("userEmail")%>";
            var receiver = "<%=request.getParameter("workerEmail")%>";
            var message = document.getElementById("messageInput").value;
            
            if (message.trim() !== "") {
                $.post("SendMessageServlet", {
                    sender: sender,
                    receiver: receiver,
                    message: message
                }, function () {
                    document.getElementById("messageInput").value = "";
                    loadMessages();
                });
            }
        }
        
        setInterval(loadMessages, 3000); 
        loadMessages();
    </script>
</body>
</html>
