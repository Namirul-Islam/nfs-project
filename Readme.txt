The project focuses on developing a network file system adopted from Sun microsystem’s network file system. This system allows users to mount a directory on a specified server allowing users to communicate through a shared storage over a network. Since we did not have access to physical systems, we decided to work on virtual ones so the choice was between containers and virtual machines. Since we would be running multiple clients and at least one server, running multiple virtual machines on a single computer would be infeasible since virtual machines consume a lot of memory and we are limited in that resource. So we opted for containers which compared to virtual machines take up far less space.


A network file system gives us the illusion that our files are located on our physical hard drive when in fact it is located on a completely different system. Moreover, the system is fault tolerant in the sense that if a client crashes the system does not become unusable. The data is spread out across multiple servers so in case a server is not working the client can connect to another server with access to the same directory and continue operations. This is done by making a replica of the original server.


In this project, we used docker and created 2 client containers and 2 server containers and ensured communication between them. The clients and servers were configured using a Dockerfile which contains the information about the system’s configuration. As a result, there was no need to build the containers from scratch every time and the process of setting up the containers was automated. A script was included for the container which would also be used to run the commands inside a virtual terminal in the clients. The server containers are similar in the sense that they also utilize a Dockerfile for the server’s configuration as well as a script file. The script file ensures that the server can ensure remote procedure calls for the clients as well as ensuring that the correct network file system daemon has been mounted for usage.


Video Link: 


Name: Namirul Islam
Email: namirul.islam@g.bracu.ac.bd


Name: Abid Hossain Ashik
Email: abid.hossain.ashik@g.bracu.ac.bd


Name: Mr. Mohammad Fahim

Email:
