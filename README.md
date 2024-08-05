The project is based on Muduo network library, Protobuf development and Zookeeper to implement a distributed network communication framework, the main functions are as follows:
1、Based on the Muduo network library to achieve network layer development, through the binders to separate the network layer and business layer code, and make it have good concurrency performance;

2、Using Protobuf to serialise and deserialise the data related to RPC method calls, to implement the RPC method provision and function processing logic;

3、Use Zookeeper as the middleware of the project consistency coordination service to achieve local service registration, service discovery and other functions;

4、Using the single-case pattern to provide the project with macro-defined log types and asynchronous output.

Compile step:

One-click compilation ./autobuild.sh

After compilation, /consumer and /provider are generated in the /bin directory;

Make sure the zookeeper service is turned on;

Run './consumer -i test.conf' and './provider -i test.conf'

See the blog column for a detailed explanation：https://blog.csdn.net/m0_73537205/category_12707329.html?spm=1001.2014.3001.5482
