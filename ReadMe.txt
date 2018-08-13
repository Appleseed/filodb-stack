Steps to run this.
1) Build Image 
Use command:- sudo docker build -t image_name:tag
2)After image is build without any error.
Use command :- sudo docker run -it image_name:tag
This will run the container
3)Run script to start the cassandra server.
sudo  ./Data_in_Filo_through_cli.sh

After these steps, we can use FIloDB in the container itself.
