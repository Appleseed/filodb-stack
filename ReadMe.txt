Steps to run this.
1) change working directory to filodb-stack
2) Build Image 
Use command:- sudo docker build -t filodb .
2)After image is build without any error.
Use command :- sudo docker run -it filodb bash
This will run the container
3)Inside container Run script to start the cassandra server.
sudo  ./Data_in_Filo_through_cli.sh

After these steps, we can use FIloDB in the container itself.
