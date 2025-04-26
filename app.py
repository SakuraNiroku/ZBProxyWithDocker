from flask import Flask, render_template, request, redirect
import subprocess
import json

app = Flask(__name__)

@app.route('/')
def index():
    with open('ip.json', 'r') as f:
        data = json.load(f)
        content = [data['ip'],data['port']]
    return render_template('index.html', content=content)

@app.route('/save', methods=['POST'])
def save():
    try:
        ip = request.form['content']
        port = int(request.form['port'])
        if not(port > 10000 and port < 65530):
            raise Exception()
        data = {'ip': ip, 'port': port}
        with open('ip.json', 'w') as f:
            json.dump(data, f)
        subprocess.run(['python', 'restart.py'])
    finally:
        return redirect('/')

if __name__ == '__main__':
    app.run(debug=True)