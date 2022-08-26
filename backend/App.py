from flask import Flask, render_template
app = Flask(__name__)

@app.route('/jsmith/lxk')
def test():
   return render_template('view.html')

if __name__ == '__main__':
   app.run(host='192.168.1.3', port=5000, debug=True, threaded=False)