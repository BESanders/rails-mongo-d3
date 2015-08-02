### Synopsis
Demonstration site testing using Rails to connect to a MongoDB backend and  
perform CRUD operations. We also throw a little D3 in for fun.

### Installation
The repository comes prepackaged with a Vagrant instance that will provision  
and start a Mongo database instance. It will also configure the networking  
that is expected by Rails. If you want to change this, you must point  
```mongo_endpoint``` to the Mongo instance of your choice in ```application.rb```.  
Otherwise, simple do:  
```Bash
vagrant up
```

### Endpoints
- ```/d3``` - The primary 'program'. A scatterplot powered by D3 and backed by  
              a MongoDB instance. 
