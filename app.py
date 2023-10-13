import psutil 
from flask import Flask, render_template

app = Flask(__name__)
@app.route("/")
def index():
    cpu_per = psutil.cpu_percent()
    mem_per = psutil.virtual_memory().percent
    disk_usage = round(psutil.disk_usage("/").free/(2**30), 1)
    Massage = None
    if cpu_per > 80 or mem_per > 80:
        Massage = "Your CPU and memory are running out of resource please scale up"
    # return f"CPU Utilization is {cpu_per} and Memory Utilization: {mem_per} and Free Disk Space: {disk_usage}GB"
    return render_template("index.html", mem_metric = mem_per, cpu_metric = cpu_per , disk_usage = disk_usage , message = Massage)
if __name__ == '__main__':
    app.run(debug=True ,host='0.0.0.0')
