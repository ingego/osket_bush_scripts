echo "dir: $1"
echo "name $2"
cd $1
dart create $2
wait
cd $2
dart pub add alfred 
dart pub add logger
dart pub add dio



touch Dockerfile 

dockerEditor="FROM dart:stable AS build
WORKDIR /app
COPY ./ /app

RUN dart pub get
CMD dart run
";
echo "$dockerEditor">./Dockerfile;
wait 
rm -rf test 
cd lib 
mkdir server 
cd server 
touch ./server.dart 


classCreator=" import 'dart:async';
import 'package:alfred/alfred.dart';

class Server with Endpoint { 
  void server() async{ 
      final app = Alfred();

  app.get('/example', expample);

  await app.listen();

  }

}
mixin Endpoint {

FutureOr expample(req, res) {}
} "
echo "$classCreator"> ./server.dart ;
mkdir moduls 
mkdir models 
mkdir endoints

