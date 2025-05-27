<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Support Chat</title>
    
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
           body {
        font-family: 'Poppins', sans-serif;
        background-color: #f8f9fa;
        margin: 0;
        padding: 0;
    }

    .chatbot-container {
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 100%;
        max-width: 350px;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
        border-radius: 15px;
        overflow: hidden;
        background: white;
    }

    .chat-header {
        background-color: #007bff;
        color: white;
        padding: 12px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .chat-header i {
        font-size: 18px;
        cursor: pointer;
    }

    .chat-box {
        background: white;
        height: 400px;
        display: flex;
        flex-direction: column;
    }

    .chat-messages {
        flex: 1;
        padding: 12px;
        overflow-y: auto;
        display: flex;
        flex-direction: column;
        scrollbar-width: thin;
        scrollbar-color: transparent transparent;
    }

    .chat-messages::-webkit-scrollbar {
        width: 6px;
        background-color: transparent;
    }

    .chat-messages::-webkit-scrollbar-thumb {
        background-color: transparent;
        border-radius: 3px;
    }

    .message {
        max-width: 80%;
        padding: 10px 15px;
        margin: 5px;
        border-radius: 15px;
        font-size: 14px;
        word-wrap: break-word;
        opacity: 0;
        transform: translateY(10px);
        animation: fadeIn 0.3s forwards;
    }

    .user-message {
        background-color: #007bff;
        color: white;
        align-self: flex-end;
        border-radius: 15px 15px 0px 15px;
    }

    .bot-message {
        background-color: #e0e0e0;
        color: black;
        align-self: flex-start;
        border-radius: 15px 15px 15px 0px;
    }

    .chat-input {
        display: flex;
        padding: 8px;
        background: #f1f1f1;
        border-top: 1px solid #ddd;
        align-items: center;
    }

    .chat-input input {
        flex: 1;
        padding: 10px;
        border: none;
        border-radius: 20px;
        outline: none;
        font-size: 14px;
    }

    .chat-input button {
        background: #007bff;
        color: white;
        border: none;
        border-radius: 50%;
        padding: 10px;
        cursor: pointer;
        margin-left: 5px;
        font-size: 16px;
    }

    .option-button {
        background: #007bff;
        color: white;
        border: none;
        padding: 7px 12px;
        margin: 4px;
        border-radius: 15px;
        cursor: pointer;
        font-size: 14px;
        transition: 0.2s;
    }

    .option-button:hover {
        background: #0056b3;
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .chatbot-container {
            bottom: 10px;
            right: 25px; 
            width: 90%;
            max-width: none;
        }

        .chat-box {
            height: 460px;
        }

        .chat-input input {
            font-size: 12px;
            padding: 8px;
        }

        .chat-input button {
            padding: 8px;
            font-size: 14px;
        }

        .option-button {
            font-size: 12px;
            padding: 5px 10px;
        }
    }

    @media (max-width: 480px) {
        .chatbot-container {
            width: 95%;
            bottom: 5px;
            right: 7px;
        }

        .chat-box {
            height: 400px;
        }

        .message {
            font-size: 12px;
            padding: 8px 12px;
        }

        .chat-input input {
            font-size: 12px;
        }

        .chat-input button {
            padding: 6px;
        }
    }

    </style> 
</head>
<body>
    <div class="chatbot-container">
        <div class="chat-header">
            <span>Support Chat</span>
            <i class="fas fa-times" onclick="closeChat()"></i>
        </div>
        <div class="chat-box">
            <div class="chat-messages" id="chat-messages"></div>
            <div class="chat-input">
                <input type="text" id="user-input" placeholder="Type your message..." onkeypress="handleKeyPress(event)">
                <button onclick="sendMessage()"><i class="fas fa-paper-plane"></i></button>
            </div>
        </div>
    </div>

	<script>
        let language = "";
        let chatMessages = document.getElementById("chat-messages");

        window.onload = function() {
            startChat();
        };

        function startChat() {
            addMessage("Namaste Yash!", "bot");
            addOptions(["English", "Hindi"], selectLanguage);
        }

        function selectLanguage(selectedLang) {
            language = selectedLang.toLowerCase();
            if (language === "english") {
                addMessage("How may I help you?", "bot");
                addOptions(["Subscription", "Services", "Contact", "Delete Account", "Other"], handleMainOptions);
            }else if (language === "hindi") {
                addMessage("मैं आपकी कैसे मदद कर सकता हूँ?", "bot");
                addOptions(["सदस्यता", "सेवाएं", "संपर्क", "खाता हटाएं", "अन्य"], handleMainOptionsHindi);
            }
        } 

        function handleMainOptions(option) {
            if (option === "Subscription") {
                addMessage("Subscription related.", "bot");
                addOptions(["Buy package", "Other", "Go to menu", "End Chat"], handleSubscriptionOptions);
            }  
            else if (option === "Delete Account") {
                addMessage("Login first -- Go to setting, Delete account.", "bot");
                addOptions(["Other", "Go to menu", "End Chat"], handleDeleteAccount);
            } 
            else if (option === "Contact") {
                addMessage("You can connect with us by email & contact.\nEmail: servicesystem@gmail.com\nContact: +91 6725367846.\nCall morning 7 to night 9.", "bot");
                addOptions(["Other", "Go to menu", "End Chat"], handleContact);
            } 
            else if (option === "Services") {
                addMessage("We provide home services like Maid, Cook, Teacher, Plumber, Driver etc.", "bot");
                addOptions(["Book service", "Other", "Go to menu", "End Chat"], handleServices);
            }
            else if (option === "Other") {
                addMessage("Type and send me your question.", "bot");
                waitingForUserInput = true;
                }
        }

        let waitingForUserInput = false; // Jab user manually likhne wala ho toh true hoga

        function sendMessage() {
            let userInput = document.getElementById("user-input");
            let text = userInput.value.trim(); 
            
            if (text === "") return; 

            addMessage(userInput.value, "user"); 
            userInput.value = ""; 

            if (waitingForUserInput) {
                waitingForUserInput = false; // Reset flag
                addMessage("Loading...", "bot");

                setTimeout(() => {
                    addMessage("Our team will get back to you soon.", "bot");
                }, 2000);
                setTimeout(() => {
                    addMessage("Or you can call to our team +91 7485784832.", "bot");
                    addMessage("Thank you for your query.😁", "bot");
                }, 3000);
            }else if (["hi", "hii","Hi","Hii","HII","Hello", "HELLO", "hello", "hey", "namaste"].includes(text)) {
            	startChat();
            } else {
                    setTimeout(() => {
                    addMessage("Sorry, I didn't understand. Please select an option!", "bot");
                }, 1000);
            }
        } 

        // Subscription Options
        function handleSubscriptionOptions(option) { 
            if (option === "Buy package") {
                addMessage("Package", "bot");
                redirectToPage("packages.jsp"); 
            } else if (option === "Other") {
                addMessage("Type and send me your question.", "bot");
                waitingForUserInput = true;
            } else if (option === "Go to menu") {
                window.location.reload();
            } else if (option === "End Chat") {
                addMessage("Thank you! Have a great day.😊", "bot");
            }
        }
 
        // Delete Account Options
        function handleDeleteAccount(option) {
            if (option === "Other") {
                addMessage("Type and send me your question.", "bot");
                waitingForUserInput = true;
            } else if (option === "Go to menu") {
                window.location.reload();
            } else if (option === "End Chat") {
                addMessage("Thank you! Have a great day.😊", "bot");
            }
        }

        // Contact Options
        function handleContact(option) {
            if (option === "Other") {
                addMessage("Type and send me your question.", "bot");
                waitingForUserInput = true;
            } else if (option === "Go to menu") {
                window.location.reload();
            } else if (option === "End Chat") {
                addMessage("Thank you! Have a great day.😊", "bot");
            }
        }

        // Service Options
        function handleServices(option) {
            if (option === "Book service") {
                redirectToPage("signin.jsp");
            } else if (option === "Other") {
                addMessage("Type and send me your question.", "bot");
                waitingForUserInput = true;
            } else if (option === "Go to menu") {
                window.location.reload();
            } else if (option === "End Chat") {
                addMessage("Thank you! Have a great day.😊", "bot");
            }
        }


        function handleServices(option) {
            if (option === "Book service") {
                redirectToPage("signin.jsp");
            } 
            else if (option === "Other") {
                addMessage("Type and send me your question.", "bot");
            } 
            else if (option === "Go to menu") {
                window.location.reload();
            } 
            else if (option === "End Chat") {
                addMessage("Thank you! Have a great day.😊", "bot");
            }
        }
        function handleMainOptionsHindi(option) {
            if (option === "सदस्यता") {
                addMessage("सदस्यता से संबंधित।", "bot");
                addOptions(["पैकेज खरीदें", "अन्य", "मेनू पर जाएं", "चैट समाप्त करें"], handleSubscriptionOptionsHindi);
            } 
            else if (option === "खाता हटाएं") {
                addMessage("पहले लॉगिन करें -- सेटिंग्स में जाएं, खाता हटाएं।", "bot");
                addOptions(["अन्य", "मेनू पर जाएं", "चैट समाप्त करें"], handleDeleteAccountHindi);
            } 
            else if (option === "संपर्क") {
                addMessage("आप ईमेल और संपर्क के माध्यम से हमसे जुड़ सकते हैं।\nईमेल: servicesystem@gmail.com\nसंपर्क: +91 6725367846\nसुबह 7 बजे से रात 9 बजे तक कॉल करें।", "bot");
                addOptions(["अन्य", "मेनू पर जाएं", "चैट समाप्त करें"], handleContactHindi);
            } 
            else if (option === "सेवाएं") {
                addMessage("हम घरेलू सेवाएं प्रदान करते हैं जैसे नौकरानी, रसोइया, शिक्षक, प्लंबर, ड्राइवर आदि।", "bot");
                addOptions(["सेवा बुक करें", "अन्य", "मेनू पर जाएं", "चैट समाप्त करें"], handleServicesHindi);
            }
            else if (option === "अन्य") {
                addMessage("अपना प्रश्न टाइप करें और भेजें।", "bot");
                waitingForUserInput = true;
            }
        }

        // सदस्यता विकल्प
        function handleSubscriptionOptionsHindi(option) {
            if (option === "पैकेज खरीदें") {
                addMessage("पैकेज", "bot");
                redirectToPage("packages.jsp");
            } else if (option === "अन्य") {
                addMessage("अपना प्रश्न टाइप करें और भेजें।", "bot");
                waitingForUserInput = true;
            } else if (option === "मेनू पर जाएं") {
                window.location.reload();
            } else if (option === "चैट समाप्त करें") {
                addMessage("धन्यवाद! आपका दिन शुभ हो।😊", "bot");
            }
        }

        // खाता हटाने के विकल्प
        function handleDeleteAccountHindi(option) {
            if (option === "अन्य") {
                addMessage("अपना प्रश्न टाइप करें और भेजें।", "bot");
                waitingForUserInput = true;
            } else if (option === "मेनू पर जाएं") {
                window.location.reload();
            } else if (option === "चैट समाप्त करें") {
                addMessage("धन्यवाद! आपका दिन शुभ हो।😊", "bot");
            }
        }

        // संपर्क विकल्प
        function handleContactHindi(option) {
            if (option === "अन्य") {
                addMessage("अपना प्रश्न टाइप करें और भेजें।", "bot");
                waitingForUserInput = true;
            } else if (option === "मेनू पर जाएं") {
                window.location.reload();
            } else if (option === "चैट समाप्त करें") {
                addMessage("धन्यवाद! आपका दिन शुभ हो।😊", "bot");
            }
        }

        // सेवा विकल्प
        function handleServicesHindi(option) {
            if (option === "सेवा बुक करें") {
                redirectToPage("signin.html");
            } else if (option === "अन्य") {
                addMessage("अपना प्रश्न टाइप करें और भेजें।", "bot");
                waitingForUserInput = true;
            } else if (option === "मेनू पर जाएं") {
                window.location.reload();
            } else if (option === "चैट समाप्त करें") {
                addMessage("धन्यवाद! आपका दिन शुभ हो।😊", "bot");
            }
        }

        function addMessage(text, sender) {
            let msgDiv = document.createElement("div");
            msgDiv.classList.add("message", sender === "bot" ? "bot-message" : "user-message");
            msgDiv.innerText = text;
            chatMessages.appendChild(msgDiv);
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }

        function addOptions(options, callback) {
            let optionsDiv = document.createElement("div");
            options.forEach(option => {
                let btn = document.createElement("button");
                btn.classList.add("option-button");
                btn.innerText = option;
                btn.onclick = () => {
                    addMessage(option, "user");
                    callback(option);
                    optionsDiv.remove();
                };
                optionsDiv.appendChild(btn);
            });
            chatMessages.appendChild(optionsDiv);
        }

        function redirectToPage(url) {
            window.location.href = url;
        }
        
        function closeChat() {
            document.querySelector(".chatbot-container").style.display = "none";
        }
    </script>

</body>
</html>
