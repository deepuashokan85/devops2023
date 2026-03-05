from flask import Flask
import socket

app = Flask(__name__)

@app.route('/')
def hello():
    # This helps us see which Kubernetes Pod is answering the request
    hostname = socket.gethostname()
    return f"""
    <h1>DevOps Pipeline Success!</h1>
    <p><b>Status:</b> Image pulled from Docker Hub and running in Kubernetes.</p>
    <p><b>Served by Pod:</b> {hostname}</p>
    """

if __name__ == "__main__":
    # Must use 0.0.0.0 so it's accessible outside the container
    app.run(host='0.0.0.0', port=5000)

