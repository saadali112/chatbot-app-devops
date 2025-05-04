// Fade intro and show chatbot
window.onload = () => {
  setTimeout(() => {
    document.getElementById("intro-screen").style.display = "none";
    document.getElementById("chatbot-app").style.display = "flex";
  }, 3000);
};

// Handle quick replies
function quickReply(text) {
  document.getElementById("user-input").value = text;
  sendMessage();
}

// Handle Enter key
document.getElementById("user-input").addEventListener("keypress", (e) => {
  if (e.key === "Enter") sendMessage();
});

// Messaging
function sendMessage() {
  const input = document.getElementById("user-input");
  const chatBox = document.getElementById("chat-box");

  const userText = input.value.trim();
  if (!userText) return;

  // Create user message
  const userMsg = document.createElement("div");
  userMsg.className = "message user-message";
  userMsg.innerHTML = userText;
  chatBox.appendChild(userMsg);

  // Clear input
  input.value = "";
  
  // Scroll to bottom
  chatBox.scrollTop = chatBox.scrollHeight;

  // Bot response after delay
  setTimeout(() => {
    const reply = getBotReply(userText.toLowerCase());
    const botMsg = document.createElement("div");
    botMsg.className = "message bot-message";
    botMsg.innerHTML = `<strong>Nova:</strong> ${reply}`;
    chatBox.appendChild(botMsg);
    chatBox.scrollTop = chatBox.scrollHeight;
  }, 600);
}

function getBotReply(input) {
  input = input.replace(/[?.!]/g, "").trim();

  if (input.includes("hello") || input.includes("hi")) return "Hi there! 👋 How can I assist you with DevOps today?";
  if (input.includes("how are you")) return "I'm running smoothly in the cloud! ☁️ How can I help you?";
  if (input.includes("your name")) return "I'm Nova, your AI DevOps assistant. Ask me about CI/CD, Docker, Kubernetes, or cloud platforms!";
  if (input.includes("bye")) return "Goodbye! Feel free to return anytime you need DevOps assistance.";
  if (input.includes("help")) return "I can help with DevOps concepts, tools, and best practices. What specifically do you need?";

  // DevOps-specific
  if (input.includes("help me with devops") || input.includes("devops help")) 
    return "Here's a quick roadmap:<br>1. Version Control (Git)<br>2. CI/CD (Jenkins/GitHub Actions)<br>3. Containers (Docker)<br>4. Orchestration (Kubernetes)<br>5. Cloud (AWS/Azure/GCP)";
  
  if (input.includes("what is devops")) 
    return "DevOps combines software development (Dev) and IT operations (Ops) to shorten the development lifecycle while delivering features, fixes, and updates frequently.";
  
  if (input.includes("what is ci/cd") || input.includes("ci/cd")) 
    return "CI/CD stands for Continuous Integration and Continuous Delivery. It automates building, testing, and deploying applications for rapid, reliable releases.";
  
  if (input.includes("what is docker") || input.includes("docker")) 
    return "Docker is a platform for developing, shipping, and running applications in containers. Containers package code with all its dependencies.";
  
  if (input.includes("devops tools")) 
    return "Popular DevOps tools include:<br>- Git/GitHub<br>- Jenkins/GitHub Actions<br>- Docker/Kubernetes<br>- Terraform/Ansible<br>- AWS/Azure/GCP<br>- Prometheus/Grafana";
  
  if (input.includes("how to deploy on aws") || input.includes("aws deploy")) 
    return "AWS deployment options:<br>1. EC2 for apps<br>2. S3 for static sites<br>3. ECS/EKS for containers<br>4. Lambda for serverless<br>Use Terraform or CloudFormation for IaC.";

  return "That's an interesting question about DevOps! I'm still learning, but I can help with common DevOps topics like CI/CD, containers, or cloud deployment.";
}