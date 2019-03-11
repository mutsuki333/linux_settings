# Python notes

- [Python notes](#python-notes)
  - [pip](#pip)
    - [Python requirements](#python-requirements)
    - [Virtual environment](#virtual-environment)
  - [Python syntax, utilities](#python-syntax-utilities)
    - [basic syntax](#basic-syntax)
      - [number](#number)
      - [Triple Quotes](#triple-quotes)
      - [format method](#format-method)
      - [Escape Sequences](#escape-sequences)
      - [Raw string](#raw-string)
      - [operators](#operators)
      - [Statements](#statements)
      - [DocStrings](#docstrings)
      - [Data Structure](#data-structure)
      - [Class](#class)
      - [IO, FileIO](#io-fileio)
      - [Handling Exceptions](#handling-exceptions)
      - [Decorators](#decorators)
    - [Useful tips](#useful-tips)
    - [Pickle](#pickle)
    - [sys](#sys)
    - [Math](#math)
    - [float calculations may be inaccurate](#float-calculations-may-be-inaccurate)
    - [Numpy](#numpy)
  - [Server](#server)
    - [Simple server can be used with](#simple-server-can-be-used-with)
    - [Gunicorn](#gunicorn)
    - [Editting a bash script to start Gunicorn](#editting-a-bash-script-to-start-gunicorn)
    - [Starting and monitoring with Supervisor](#starting-and-monitoring-with-supervisor)
    - [Nginx](#nginx)

## pip

### Python requirements

`pip freeze` will list all python packages and its versions.  
```pip freeze > requirements.txt```  
To **install** the required packages  
```pip install -r requirements.txt```  
    or  
```pip -r requirements.txt```  to run in the desired environment.

### Virtual environment

virtualenv|cmd
:---|---
install|`[sudo] pip install virtualenv`
setup|`virtualenv ENV`
access to the global site-packages|with flag `--system-site-packages`
start|`source bin/activate`
stop|`deactivate`

## Python syntax, utilities

### basic syntax

#### number

Floating point numbers (or floats for short) are 3.23 and 52.3E-4 .  
#### Triple Quotes

can use single
quotes and double quotes freely within the triple quotes.

```python
'''This is a multi-line string. This is the first line.
This is the second line.
"What's your name?," I asked.
He said "Bond, James Bond."
'''
```

#### format method

```python
age = 20
name = 'Swaroop'
print('{0} was {1} years old when he wrote this book'.format(name, age))
print(f'{name} was {age} years old when he wrote this book') #python 3.6
# decimal (.) precision of 3 for float '0.333'
print('{0:.3f}'.format(1.0/3)) # 0.333
# fill with underscores (_) with the text centered
# (^) to 11 width '___hello___'
print('{0:_^11}'.format('hello')) # ___hello___
```

#### Escape Sequences

```python
"This is the first sentence. \
This is the second sentence."
# is the same as
"This is the first sentence. This is the second sentence."
```

#### Raw string

```python
r"Newlines are indicated by \n"
# use raw strings when dealing with regular expressions.
# or a lot of backwhacking may be required.
```

#### operators

operators|usage
-|-
`**` (power) | Returns x to the power of y
`//` (divide and floor) | Divide x by y and round the answer down to the nearest integer value.

#### Statements

```python
# if else while for
number = 23
running = True
while running:
    guess = int(input('Enter an integer : '))
    if guess == number:
        print('Congratulations, you guessed it.')
        # this causes the while loop to stop
        running = False
    elif guess < number:
        print('No, it is a little higher than that.')
    else:
    print('No, it is a little lower than that.')
else:
    print('The while loop is over.')
    # Do anything else you want to do here
print('Done')

for i in range(1, 5):
print(i)
else:
print('The for loop is over')

# Function
def say_hello():
# block belonging to the function
print('hello world')
# End of function
say_hello() # call the function
```

#### DocStrings

```python
def print_max(x, y):
    '''Prints the maximum of two numbers.
    The two values must be integers.'''
    # convert to integers, if possible
    x = int(x)
    y = int(y)
    if x > y:
        print(x, 'is maximum')
    else:
        print(y, 'is maximum')
print_max(3, 5)
print(print_max.__doc__)
```

#### Data Structure

type|utility
-|-
List|`shoplist = ['apple', 'mango', 'carrot', 'banana']` <br>`for...in`, `append()`, `sort()`, or `help(list)` for help.
Tuple | `zoo = ('python', 'elephant', 'penguin')`
Dictionary|`d = {key1 :value1, key2 : value2 }`, `del d['key']`
Set | `bri = set(['brazil', 'russia', 'india'])`<br>`'india' in bri  #True`,<br>`'usa' in bri  #False`

#### Class

```python
class Robot:
    """Represents a robot, with a name."""
    # A class variable, counting the number of robots
    population = 0
    def __init__(self, name):
        """Initializes the data."""
        self.name = name
        print("(Initializing {})".format(self.name))
        # When this person is created, the robot
        # adds to the population
        Robot.population += 1
    def die(self):
        """I am dying."""
        print("{} is being destroyed!".format(self.name))
        Robot.population -= 1
        if Robot.population == 0:
            print("{} was the last one.".format(self.name))
        else:
            print("There are still {:d} robots working.".format(Robot.population))
    def say_hi(self):
        """Greeting by the robot.
        Yeah, they can do that."""
        print("Greetings, my masters call me {}.".format(self.name))
    @classmethod
    def how_many(cls):
        """Prints the current population."""
        print("We have {:d} robots.".format(cls.population))
```

inherit

```python
class SchoolMember:
    '''Represents any school member.'''
    def __init__(self, name, age):
        self.name = name
        self.age = age
        print('(Initialized SchoolMember: {})'.format(self.name))
    def tell(self):
        '''Tell my details.'''
        print('Name:"{}" Age:"{}"'.format(self.name, self.age), end=" ")
class Teacher(SchoolMember):
    '''Represents a teacher.'''
    def __init__(self, name, age, salary):
        SchoolMember.__init__(self, name, age)
        self.salary = salary
        print('(Initialized Teacher: {})'.format(self.name))
    def tell(self):
        SchoolMember.tell(self)
        print('Salary: "{:d}"'.format(self.salary))
class Student(SchoolMember):
    '''Represents a student.'''
    def __init__(self, name, age, marks):
        SchoolMember.__init__(self, name, age)
        self.marks = marks
        print('(Initialized Student: {})'.format(self.name))
    def tell(self):
        SchoolMember.tell(self)
        print('Marks: "{:d}"'.format(self.marks))
t = Teacher('Mrs. Shrividya', 40, 30000)
s = Student('Swaroop', 25, 75)
# prints a blank line
print()
members = [t, s]
for member in members:
# Works for both Teachers and Students
member.tell()
```

#### IO, FileIO

`something = input("Enter text: ")`

```python
poem = '''\
Programming is fun
When the work is done
if you wanna make your work also fun:
use Python!
'''
# Open for 'w'riting
f = open('poem.txt', 'w')
# Write text to file
f.write(poem)
# Close the file
f.close()
# If no mode is specified,
# 'r'ead mode is assumed by default
f = open('poem.txt')
while True:
    line = f.readline()
    # Zero length indicates EOF
    if len(line) == 0:
        break
    # The `line` already has a newline
    # at the end of each line
    # since it is reading from a file.
    print(line, end='')
# close the file
f.close()
```

```python
# encoding=utf-8
import io

f = io.open("abc.txt", "wt", encoding="utf-8")
f.write(u"英語じゃない")
f.close()
text = io.open("abc.txt", encoding="utf-8").read()
print(text)
```

with statement

```python
with open("poem.txt") as f:
    for line in f:
        print(line, end='')
```

#### Handling Exceptions

```python
try:
    text = input('Enter something --> ')
except EOFError:
    print('Why did you do an EOF on me?')
except KeyboardInterrupt:
    print('You cancelled the operation.')
else:
    print('You entered {}'.format(text))
finally:
    # do something
    pass
```

```python
class ShortInputException(Exception):
    '''A user-defined exception class.'''
    def __init__(self, length, atleast):
        Exception.__init__(self)
        self.length = length
        self.atleast = atleast

try:
    text = input('Enter something --> ')
    if len(text) < 3:
        raise ShortInputException(len(text), 3)
    # Other work can continue as usual here
except EOFError:
    print('Why did you do an EOF on me?')
except ShortInputException as ex:
    print(('ShortInputException: The input was ' +
    '{0} long, expected at least {1}')
    .format(ex.length, ex.atleast))
else:
    print('No exception was raised.')
finally:
    # do something
    pass
```

#### Decorators

```python
from time import sleep
from functools import wraps
import logging
logging.basicConfig()
log = logging.getLogger("retry")

def retry(f):
    @wraps(f)
    def wrapper_function(*args, **kwargs):
        MAX_ATTEMPTS = 5
        for attempt in range(1, MAX_ATTEMPTS + 1):
            try:
                return f(*args, **kwargs)
            except Exception:
                log.exception("Attempt %s/%s failed : %s",
                    attempt,
                    MAX_ATTEMPTS,
                    (args, kwargs))
                sleep(10 * attempt)
            log.critical("All %s attempts failed : %s",
                MAX_ATTEMPTS,
                (args, kwargs))
        return wrapper_function
        
counter = 0

@retry
def save_to_database(arg):
    print("Write to a database or make a network call or etc.")
    print("This will be automatically retried if exception is thrown.")
    global counter
    counter += 1
    # This will throw an exception in the first call
    # And will work fine in the second call (i.e. a retry)
    if counter < 2:
        raise ValueError(arg)

if __name__ == '__main__':
    save_to_database("Some bad value")
```

### Useful tips

### Pickle

standard module called pickle which you can use to store any plain
Python object in a file and then get it back later. This is called storing the object persistently.

```python
import pickle

# The name of the file where we will store the object
shoplistfile = 'shoplist.data'
# The list of things to buy
shoplist = ['apple', 'mango', 'carrot']

# Write to the file
f = open(shoplistfile, 'wb')
# Dump the object to a file
pickle.dump(shoplist, f)
f.close()

# Destroy the shoplist variable
del shoplist

# Read back from the storage
f = open(shoplistfile, 'rb')
# Load the object from the file
storedlist = pickle.load(f)
print(storedlist)
f.close()
```

### sys

`sys.argv`, `sys.path`, `dir()`

```python
# create a new variable 'a'
>>> a = 5
>>> dir()
['__builtins__', '__doc__', '__name__', '__package__', 'sys', 'a']
# delete/remove a name
>>> del a
>>> dir()
['__builtins__', '__doc__', '__name__', '__package__', 'sys']
```

### Math

[API list](https://docs.python.org/3/library/math.html)
common functions | usage
-|-
math.ceil(x) | the smallest integer greater than or equal to x
factorial(x) | x factorial
floor(x) | x, the largest integer less than or equal to x
pow(x, y) | x raised to the power y
log(x[, base]) | logarithm of x (to base e or base if given)
sqrt(x) | square root of x
pi | π = 3.141592…
e | e = 2.718281…

### float calculations may be inaccurate

Use [`decimal`](https://docs.python.org/2/library/decimal.html#module-decimal) for better results.

```python
>>> from decimal import *
>>> getcontext().prec = 6
>>> Decimal(1) / Decimal(7)
Decimal('0.142857')
>>> getcontext().prec = 28
>>> Decimal(1) / Decimal(7)
Decimal('0.1428571428571428571428571429')
```

### Numpy

## Server

### Simple server can be used with

`python -m http.server`
or a more complete test server

```python
import sys
import os

if sys.version_info < (3,):
    import SimpleHTTPServer as server
    import SocketServer as socketserver
    import urlparse as parse
else:
    from http import server
    from urllib import parse
    import socketserver

PORT = 8000
INDEXFILE = 'index.html'

class MyHandler(server.SimpleHTTPRequestHandler):
    def do_GET(self):

        # Parse query data to find out what was requested
        parsedParams = parse.urlparse(self.path)

        # See if the file requested exists
        if os.access('.' + os.sep + parsedParams.path, os.R_OK):
            # File exists, serve it up
            server.SimpleHTTPRequestHandler.do_GET(self)
        else:
            # send index.html, but don't redirect
            self.send_response(200)
            self.send_header('Content-Type', 'text/html')
            self.end_headers()
            with open(INDEXFILE, 'rb') as fin:
                self.copyfile(fin, self.wfile)


if __name__ == "__main__":

    args = sys.argv[1:]

    if len(args) > 0:
        PORT = int(args[0])

    Handler = MyHandler

    httpd = socketserver.TCPServer(("", PORT), Handler)

    sys.stdout.write("serving at port: %s\n" % PORT)
    httpd.serve_forever()
```

### Gunicorn

A Python WSGI HTTP Server for UNIX.  
**Install** : `pip install gunicorn`  
**Start** : `gunicorn APPNAME.wsgi`

Commonly Used Arguments||
---|---
`-b BIND, --bind=BIND`|Specify a server socket to bind. <br> To specify an IP : HOST:PORT
`-w WORKERS, --workers=WORKERS`|The number of worker processes.
`-n APP_NAME, --name=APP_NAME`|Adjust the name of Gunicorn process. (pip install setproctitle)
`-u USER, --user USER`|Switch worker processes to run as this user.
`-g GROUP, --group GROUP`|Switch worker process to run as this group.

### Editting a bash script to start Gunicorn

```bash
#!/bin/bash

NAME="word_rec"                                  # Name of the application
DJANGODIR=/home/mutsuki/code/learn_python/http/word_rec             # Django project directory
SOCKFILE=/home/mutsuki/code/learn_python/http/word_rec/run/gunicorn.sock  # we will communicte using this unix socket
USER=mutsuki                                     # the user to run as
GROUP=webapp                                     # the group to run as
NUM_WORKERS=3                                    # how many worker processes should Gunicorn spawn
#NUM_WORKERS=1
DJANGO_SETTINGS_MODULE=word_rec.settings         # which settings file should Django use
DJANGO_WSGI_MODULE=word_rec.wsgi                 # WSGI module name

echo "Starting $NAME as `whoami`"

# Activate the virtual environment
cd $DJANGODIR
source ENV/bin/activate
export DJANGO_SETTINGS_MODULE=$DJANGO_SETTINGS_MODULE
export PYTHONPATH=$DJANGODIR:$PYTHONPATH

# Create the run directory if it doesn't exist
RUNDIR=$(dirname $SOCKFILE)
test -d $RUNDIR || mkdir -p $RUNDIR

# Start your Django Unicorn
# Programs meant to be run under supervisor should not daemonize themselves (do not use --daemon)
exec ENV/bin/gunicorn ${DJANGO_WSGI_MODULE}:application \
  --name $NAME \
  --workers $NUM_WORKERS \
  --bind=unix:$SOCKFILE \
  --user=$USER --group=$GROUP \
  --log-level=debug \
  --log-file=-
  #--bind=0.0.0.0:3000 \
```

Change the script fill to executable.  
`sudo chmod u+x gunicorn_start`

### Starting and monitoring with Supervisor

**install** : `sudo apt-get install supervisor`  
When Supervisor is installed you can give it programs to start and watch by creating configuration files in the `/etc/supervisor/conf.d` directory.  
[ref.](http://supervisord.org/configuration.html#program-x-section-example)  
in `/etc/supervisor/conf.d/word_rec.conf`

```conf
[program:word_rec]
command = /home/mutsuki/word_rec/gunicorn_start                       ; Command to start app
user = mutsuki                                                        ; User to run as
stdout_logfile = /home/mutsuki/word_rec/logs/gunicorn_supervisor.log  ; Where to write log messages
redirect_stderr = true                                                ; Save stderr in the same log
environment=LANG=en_US.UTF-8,LC_ALL=en_US.UTF-8                       ; Set UTF-8 as default encoding]
```

Create the file to store your application’s log messages:

```shell
mkdir /word_rec/logs/
touch word_rec/logs/gunicorn_supervisor.log 
```

**To start**

```shell
$ sudo supervisorctl reread
word_rec: available
$ sudo supervisorctl update
word_rec: added process group
```

Other commands `sudo supervisorctl COMMAND APPNAME`.  
`status`, `stop`, `start`, `restart`

### Nginx

**install** : `sudo apt-get install nginx`  
**start** : `sudo systemctl start nginx`  
**Other commands** : `status`, `stop`, `start`, `restart`.

Each Nginx virtual server should be described by a file in the *`/etc/nginx/sites-available directory`*. You select which sites you want to enable by making **symbolic links** to those in the *`/etc/nginx/sites-enabled`* directory.  
In `/etc/nginx/sites-available/word_rec`  

```Nginx
upstream hello_app_server {

      # fail_timeout=0 means we always retry an upstream even if it failed
      # to return a good HTTP response (in case the Unicorn master nukes a
                # single worker for timing out).

      server unix:/home/mutsuki/word_rec/run/gunicorn.sock fail_timeout=0;
}

server {

    listen   80;

    client_max_body_size 4G;

    access_log /home/mutsuki/word_rec/logs/nginx-access.log;
    error_log /home/mutsuki/word_rec/logs/nginx-error.log;

    location /static/ {
        alias   /home/mutsuki/word_rec/static/;
    }

    location /media/ {
        alias   /home/mutsuki/word_rec/image;
    }

    location / {
        # an HTTP header important enough to have its own Wikipedia entry:
        #   http://en.wikipedia.org/wiki/X-Forwarded-For
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

        # enable this if and only if you use HTTPS, this helps Rack
        # set the proper protocol for doing redirects:
        # proxy_set_header X-Forwarded-Proto https;

        # pass the Host: header from the client right along so redirects
        # can be set properly within the Rack application
        proxy_set_header Host $http_host;

        # we don't want nginx trying to do something clever with
        # redirects, we set the Host: header above already.
        proxy_redirect off;

        # set "proxy_buffering off" *only* for Rainbows! when doing
        # Comet/long-poll stuff.  It's also safe to set if you're
        # using only serving fast clients with Unicorn + nginx.
        # Otherwise you _want_ nginx to buffer responses to slow
        # clients, really.
        # proxy_buffering off;

        # Try to serve static files from nginx, no point in making an
        # *application* server like Unicorn/Rainbows! serve static files.
          #if (!-f $request_filename) {
          #    proxy_pass http://hello_app_server;
          #    break;
          #}

        # Error pages
        error_page 500 502 503 504 /500.html;
        location = /500.html {
            root /webapps/hello_django/static/;
    }

}
```

Then  

``` bash
sudo ln -s /etc/nginx/sites-available/word_rec /etc/nginx/sites-enabled/word_rec
```

    $ sudo service nginx restart
